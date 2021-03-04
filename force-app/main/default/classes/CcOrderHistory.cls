public class CcOrderHistory {
    public static string accessToken{get; set;}
    public static string accessTokenType{get; set;}
    // public void SetAccessToken(string accessToken){
    //     this.accessToken = accessToken;
    // }
    // public void SetAccessTokenType(string accessTokenType){
    //     this.accessTokenType = accessTokenType;
    // }
    
	public static Map<String, String> getAccesTokenUsingNC() {
        Map<String, String> accessMap = new Map<String, String>();
        Http http = new Http();
        String accessToken = NULL;
        HttpRequest request = new HttpRequest();
        // request.setEndpoint(System.Label.CC_EndPoint);
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        request.setBody('grant_type=urn:demandware:params:oauth:grant-type:client-id:dwsid:dwsecuretoken');
        request.setMethod('POST');
        system.debug('************Querying Response *********');
        HttpResponse response = http.send(request);
        system.debug('*********Response is '+response);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            System.debug('**** The respnose:' + JSON.serialize(response.getBody()));
            JSONParser parser = JSON.createParser(response.getBody());
            System.debug('***ParsedToken is:'+parser);
            while (parser.nextToken() != null) {
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'access_token')) {
                    parser.nextToken();
                    accessToken = parser.getText();
                    accessMap.put('token', accessToken);
                }
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'token_type')) {
                    parser.nextToken();
                    accessMap.put('token_type', parser.getText());
                }
            }
            return accessMap;
        }
        return accessMap;
	}
    
    @AuraEnabled(cacheable=true)
    public static CcCaseRespBean getOrderDetails(Id caseId) {
        OrderBean ordBean = null;
        CcCaseRespBean ccCaseResp = NULL;
        List<Case> caseList = [select SuppliedEmail from Case where Id = :caseId limit 1];
    
        if (!caseList.isEmpty()) {
            Case c = caseList[0];
            if (String.isBlank(c.SuppliedEmail)) {
                ccCaseResp = new CcCaseRespBean();
                ccCaseResp.orderList = new List<DataBean>{};
                ccCaseResp.msg = 'Email is Blank';
                return ccCaseResp;
            }
            Map<String, String> accesTokenMap = getAccesTokenUsingNC();  
            if (!accesTokenMap.isEmpty()) {
                if(!System.Test.isRunningTest()) {
                    accessToken = accesTokenMap.get('token');
                    accessTokenType = accesTokenMap.get('token_type');    
                }
                if (String.isNotBlank(accessToken)) {
                    Http http = new Http();
                    HttpRequest request = new HttpRequest();
                    // request.setEndpoint(System.Label.CC_EndPoint_OrderSearch);
                    String body = '{"query":{"text_query":{"fields":["customer_email"],'+
                                '"search_phrase":"'+c.SuppliedEmail+
                                '"}},"select":"(**)","sorts":[{"field":"customer_name","sort_order":"asc"}]}';
                    request.setBody(body);
                    request.setHeader('Authorization', accessTokenType + ' ' + accessToken);
                    request.setHeader('Content-Type', 'application/json');       
                    request.setMethod('POST');
                    request.setTimeout(120000);  //Time in milliseconds
                    HttpResponse response = http.send(request);
                    // If the request is successful, parse the JSON response.
                    if (response.getStatusCode() == 200) {
                        System.debug('**** The respn:' + JSON.serialize(response.getBody()));
                        ordBean = (OrderBean) JSON.deserialize(response.getBody(), OrderBean.class);
                        ccCaseResp = new CcCaseRespBean();
                        List<DataBean> dbList = new List<DataBean>();
                        if (ordBean.hits != null) {
                            for (HitsBean hb : ordBean.hits) {
                                DataBean db = hb.data;
                                dbList.add(hb.data);
                            }
                            for(DataBean db :dbList) {
                                db.creation_date = (db.creation_date).replace('T', ' ');
                                db.creation_date = (db.creation_date).substring(0,19);
                                db.order_total = 'C$ '+db.order_total;
                                // Mapping field names as display labels
                                if(db.shipping_status == 'not_shipped') db.shipping_status = 'Not Shipped';
                                if(db.shipping_status == 'part_shipped') db.shipping_status = 'Part Shipped';
                                if(db.shipping_status == 'shipped') db.shipping_status = 'Shipped';
                                if(db.status == 'created') db.status = 'Created';
                                if(db.status == 'new') db.status = 'New';
                                if(db.status == 'open') db.status = 'Open';
                                if(db.status == 'completed') db.status = 'Completed';
                                if(db.status == 'cancelled') db.status = 'Cancelled';
                                if(db.status == 'replaced') db.status = 'Replaced';
                                if(db.status == 'failed') db.status = 'Failed';
                                if(db.payment_status == 'not_paid') db.payment_status = 'Not Paid';
                                if(db.payment_status == 'part_paid') db.payment_status = 'Part Paid';
                                if(db.payment_status == 'paid') db.payment_status = 'Paid';
                                
                                if(db.payment_instruments[0].payment_method_id == 'CREDIT_CARD')
                                    db.payment_instruments[0].payment_method_id = 'Credit Card';
                                if(db.payment_instruments[0].payment_method_id == 'DW_APPLE_PAY')
                                    db.payment_instruments[0].payment_method_id = 'Apple Pay';
                                if(db.payment_instruments[0].payment_method_id == 'GIFT_CERTIFICATE')
                                    db.payment_instruments[0].payment_method_id = 'Gift Card';
                                if(db.payment_instruments[0].payment_method_id == 'PayPal')
                                    db.payment_instruments[0].payment_method_id = 'Paypal';
                                if(db.payment_instruments[0].payment_method_id == 'NOTENDER')
                                    db.payment_instruments[0].payment_method_id = 'No Tender';
                                if(db.payment_instruments[0].payment_method_id == 'DW_ANDROID_PAY')
                                    db.payment_instruments[0].payment_method_id = 'Android Pay';

                                for(ProductBean pb: db.product_items) {
                                    pb.base_price = 'C$ '+pb.base_price;
                                    pb.price = 'C$ '+pb.price;
                                    pb.price_after_order_discount = 'C$ '+pb.price_after_order_discount;
                                    if(pb.price_after_order_discount == 'C$ 0.00')
                                        pb.price_after_order_discount = pb.price;

                                }
                            }
                            ccCaseResp.orderList = dbList;
                        } else {
                            ccCaseResp.msg = 'No records found';   
                        }
                        return ccCaseResp;
                    }
                }
            }
        }
        return ccCaseResp;
    }
}