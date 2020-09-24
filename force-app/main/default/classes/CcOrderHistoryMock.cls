@isTest
global class CcOrderHistoryMock implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        String body = '{"_v":"20.2","_type":"order_search_result","count":12,'+
                    '"hits":[{"_type":"order_search_hit","data":{"_type":"order",'+
                    '"adjusted_merchandize_total_tax":0,"adjusted_shipping_total_tax":1.46,"'+
                    'billing_address":{"_type":"order_address","address1":"123 ferrier",'+
                    '"city":"montreal","country_code":"CA","first_name":"ricardo","full_name":"ricardo nguyen",'+
                    '"id":"018e576911c89ed35c0bde7333","last_name":"nguyen","phone":"5144441111","postal_code":"h4p1m2",'+
                    '"state_code":"QC"},"confirmation_status":"not_confirmed","created_by":"Customer",'+
                    '"creation_date":"2020-04-02T15:26:35.000Z","currency":"CAD","customer_info":{"_type":"customer_info",'+
                    '"customer_id":"cd1VsPlifKFBEkQ7w6cabb2k3Z","customer_name":"ricardo nguyen","customer_no":"00000001",'+
                    '"email":"r.nguyen@davidstea.com"},"customer_name":"ricardo nguyen","export_status":"ready",'+
                    '"last_modified":"2020-04-02T15:26:38.000Z","merchandize_total_tax":0,"notes":{"_type":"simple_link",'+
                    '"link":"https://dev10.davidstea.com/s/Sites-CA-Site/dw/shop/v20_2/orders/00000101/notes"},'+
                    '"order_no":"00000101","order_token":"zbLjPRTNX26cW78-jd3qXc2nerSWh7R_vvF5OZZCSB8","order_total":19.19,'+
                    '"payment_instruments":[{"_type":"order_payment_instrument","amount":19.19,'+
                    '"payment_card":{"_type":"payment_card","card_type":"Visa","credit_card_expired":false,"holder":"Test"},'+
                    '"payment_instrument_id":"3682973f61995b1572bf7c06e4","payment_method_id":"CREDIT_CARD",'+
                    '"c_capturedAmount":19.19,"c_isCaptured":true,"c_paysafeSettlementID":"df9f06b9-d5b7-46db-a09b-8bcc5fa8ff5b",'+
                    '"c_paysafeSingleUseToken":"CC5ChhuvUTc7S43","c_paysafeStoredCredentialUsed":true}],"payment_status":"paid",'+
                    '"product_items":[{"_type":"product_item","adjusted_tax":0,"base_price":7.98,'+
                    '"bonus_product_line_item":false,"gift":false,"item_id":"cf73a7d896773d7006ea89ab1a",'+
                    '"item_text":"Banana Nut Bread","price":7.98,"price_after_item_discount":7.98,'+
                    '"price_after_order_discount":7.98,"product_id":"10240DT01VAR004079","product_name":"Banana Nut Bread",'+
                    '"quantity":1,"shipment_id":"me","tax":0,"tax_basis":7.98,"tax_class_id":"LOOSETEA","tax_rate":0,'+
                    '"c_isQualifiedForFreeSamples":true,"c_isQualifiedForFreeTin":false}],"product_sub_total":7.98,'+
                    '"product_total":7.98,"shipments":[{"_type":"shipment","adjusted_merchandize_total_tax":0,'+
                    '"adjusted_shipping_total_tax":1.46,"gift":false,"merchandize_total_tax":0,'+
                    '"product_sub_total":7.98,"product_total":7.98,"shipment_id":"me","shipment_no":"00000501",'+
                    '"shipment_total":19.19,"shipping_address":{"_type":"order_address","address1":"123 ferrier",'+
                    '"city":"montreal","country_code":"CA","first_name":"ricardo","full_name":"ricardo nguyen",'+
                    '"id":"f9bbd13bc16c7f6f630dd49ad2","last_name":"nguyen","phone":"5144441111","postal_code":"h4p1m2",'+
                    '"state_code":"QC"},"shipping_method":{"_type":"shipping_method","description":"Standard Shipping",'+
                    '"id":"STANDARD","name":"Standard","c_axItemNumber":"900996DT01"},"shipping_status":"not_shipped",'+
                    '"shipping_total":9.75,"shipping_total_tax":1.46,"tax_total":1.46}],'+
                    '"shipping_items":[{"_type":"shipping_item","adjusted_tax":1.46,"base_price":9.75,'+
                    '"item_id":"8524cbfbbff6d0f32de81d8c99","item_text":"Shipping","price":9.75,'+
                    '"price_after_item_discount":9.75,"shipment_id":"me","tax":1.46,"tax_basis":9.75,'+
                    '"tax_class_id":"STANDARD","tax_rate":0.1498}],"shipping_status":"not_shipped",'+
                    '"shipping_total":9.75,"shipping_total_tax":1.46,"site_id":"CA","status":"new","taxation":"net",'+
                    '"tax_total":1.46,"c_GST":0.49,"c_QST":0.97,"c_narvarExportOrder":false,"c_narvarFailedExportAttempts":0,'+
                    '"c_narvarOrderAPILastCall":"2020-04-02T15:26:38.000Z","c_orderFlowVersion":2,'+
                    '"c_referrer":"https://dev10-na01-davidstea.demandware.net/on/demandware.store/Sites-Site/default/SiteNavigationBar-StoreFront?csrf_token=ZGZ0954xyI_ah4VdgzPuRw8yS8OLiruPaQiXJiXd1Oyzt15M2uroLzL41qIW7SExH5iVmJS2hkFtL2iZapns454aUM7F9lzslnBZupBwl5MUqw-t8ib7qT7j4q67bZYlcihwowXqxPrIFOiLh6Hk0tqRqqJRT4sd1rJOrxUvxkgEHtzpgB4%3d"},'+
                    '"relevance":0},{"_type":"order_search_hit","data":{"_type":"order","adjusted_merchandize_total_tax":0,'+
                    '"adjusted_shipping_total_tax":1.46,"billing_address":{"_type":"order_address","address1":"123 ferrier",'+
                    '"city":"montreal","country_code":"CA","first_name":"ricardo","full_name":"ricardo nguyen","id":"06c357ec8752f8f914f4df302d",'+
                    '"last_name":"nguyen","phone":"5144441111","postal_code":"h4p1m2","state_code":"QC"},"confirmation_status":"not_confirmed",'+
                    '"created_by":"Customer","creation_date":"2020-04-02T15:37:42.000Z","currency":"CAD","customer_info":{"_type":"customer_info",'+
                    '"customer_id":"cd1VsPlifKFBEkQ7w6cabb2k3Z","customer_name":"ricardo nguyen","customer_no":"00000001",'+
                    '"email":"r.nguyen@davidstea.com"},"customer_name":"ricardo nguyen","export_status":"ready",'+
                    '"last_modified":"2020-04-02T15:37:44.000Z","merchandize_total_tax":0,"notes":{"_type":"simple_link",'+
                    '"link":"https://dev10.davidstea.com/s/Sites-CA-Site/dw/shop/v20_2/orders/00000106/notes"},"order_no":"00000106",'+
                    '"order_token":"kk-csLztwhHWRmxhOW2CTFzq_T1nP01CySr1AJ5lqwI","order_total":21.19,'+
                    '"payment_instruments":[{"_type":"order_payment_instrument","amount":21.19,'+
                    '"payment_card":{"_type":"payment_card","card_type":"Visa","credit_card_expired":false,"holder":"Test"},'+
                    '"payment_instrument_id":"28d0bbf31bd7134e927e6b0295","payment_method_id":"CREDIT_CARD","c_capturedAmount":21.19,'+
                    '"c_isCaptured":true,"c_paysafeSettlementID":"c700261a-6b14-4c7b-a4da-c075ef4a021d",'+
                    '"c_paysafeSingleUseToken":"CC5ChhuvUTc7S43","c_paysafeStoredCredentialUsed":true}],"payment_status":"paid",'+
                    '"product_items":[{"_type":"product_item","adjusted_tax":0,"base_price":9.98,"bonus_product_line_item":false,'+
                    '"gift":false,"item_id":"b904e96bcaf5d44df7ad070c56","item_text":"Peach Matcha","price":9.98,'+
                    '"price_after_item_discount":9.98,"price_after_order_discount":9.98,"product_id":"10532DT01VAR0029691",'+
                    '"product_name":"Peach Matcha","quantity":1,"shipment_id":"me","tax":0,"tax_basis":9.98,"tax_class_id":"LOOSETEA",'+
                    '"tax_rate":0,"c_isQualifiedForFreeSamples":true,"c_isQualifiedForFreeTin":false}],"product_sub_total":9.98,'+
                    '"product_total":9.98,"shipments":[{"_type":"shipment","adjusted_merchandize_total_tax":0,"adjusted_shipping_total_tax":1.46,'+
                    '"gift":false,"merchandize_total_tax":0,"product_sub_total":9.98,"product_total":9.98,"shipment_id":"me","shipment_no":"00000506",'+
                    '"shipment_total":21.19,"shipping_address":{"_type":"order_address","address1":"123 ferrier","city":"montreal",'+
                    '"country_code":"CA","first_name":"ricardo","full_name":"ricardo nguyen","id":"bcb84b5c4d7aeadfc1f1ca808a",'+
                    '"last_name":"nguyen","phone":"5144441111","postal_code":"h4p1m2","state_code":"QC"},'+
                    '"shipping_method":{"_type":"shipping_method","description":"Standard Shipping","id":"STANDARD","name":"Standard",'+
                    '"c_axItemNumber":"900996DT01"},"shipping_status":"not_shipped","shipping_total":9.75,"shipping_total_tax":1.46,"tax_total":1.46}],'+
                    '"shipping_items":[{"_type":"shipping_item","adjusted_tax":1.46,"base_price":9.75,"item_id":"dea9082a080adf2d41f619defd",'+
                    '"item_text":"Shipping","price":9.75,"price_after_item_discount":9.75,"shipment_id":"me","tax":1.46,"tax_basis":9.75,'+
                    '"tax_class_id":"STANDARD","tax_rate":0.1498}],"shipping_status":"not_shipped","shipping_total":9.75,"shipping_total_tax":1.46,'+
                    '"site_id":"CA","status":"new","taxation":"net","tax_total":1.46,"c_GST":0.49,"c_QST":0.97,"c_narvarExportOrder":false,'+
                    '"c_narvarFailedExportAttempts":0,"c_narvarOrderAPILastCall":"2020-04-02T15:37:44.000Z","c_orderFlowVersion":2},"relevance":0}],'+
                    '"query":{"text_query":{"_type":"text_query","fields":["customer_email"],"search_phrase":"r.nguyen@davidstea.com"}},'+
                    '"select":"(**)","sorts":[{"_type":"sort","field":"customer_name","sort_order":"asc"}],"start":0,"total":12,"access_token":"bc770a45-e60c-432f-a5b6-ffa5dd794156", "token_type":"Bearer"}';
        response.setBody(body);
        // response.setBody('{"AccountId":"0000062014","FsProfileConfig":{"VipStatus":"53 / 400","PointsForVip":"400","VipProgramId":"0000000006","StandardOfferId":"0000000037","PointsForStandardOffer":"100","BeverageOfferId":"0000000038","BeverageOfferCriteria":"10"},"Cards":[{"CardId":"000002738833","AccountId":"0000062014","Active":true,"ActivatedAtStore":"00071","ActivatedByEmplId":"003235"}],"Offers":[{"OfferId":"0000000002","DescriptionEn":"Birthday tea","StartDate":"2020-03-13T00:00:00","EndDate":"2020-04-13T23:59:59","Id":"3300000000"}],"Programs":[{"ProgramId":"0000000006","Status":0,"StartDate":"2019-01-01T00:00:00","EndDate":"2100-01-01T00:00:00","EnrolledAtStore":null,"EnrolledByEmpl":null,"EnrolledDate":"0001-01-01T00:00:00","Offers":[]}]}');
        response.setStatusCode(200);
        return response; 
    }
}