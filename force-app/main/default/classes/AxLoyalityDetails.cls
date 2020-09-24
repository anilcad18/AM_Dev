public class AxLoyalityDetails {
    @AuraEnabled(cacheable=true)
    public static AccountBean getLoyalityDetails(Id caseId) {
        AccountBean accBean = null;
        Case c = [select SuppliedEmail from Case where Id = :caseId limit 1];
        if (String.isBlank(c.SuppliedEmail)) {
            accBean = new AccountBean();
            accBean.msg = 'Email Id is Blank';
        } else {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            // request.setEndpoint(System.Label.AX_Endpoint+c.SuppliedEmail);
            request.setMethod('GET');
            request.setTimeout(120000);  //Time in milliseconds
            HttpResponse response = http.send(request);
            // If the request is successful, parse the JSON response.
            if (response.getStatusCode() == 200) {
                accBean = (AccountBean) JSON.deserialize(response.getBody(), AccountBean.class);
                if (accBean != NULL) {
                    for (CardBean cd : accBean.cards){
                        cd.active = String.isBlank(cd.active) || cd.active == 'true' ? 'Yes' : 'No';
                    }
                    for (ProgramBean pb : accBean.programs){
                        pb.status = String.isBlank(pb.status) || pb.status == '0' ? 'Inactive' : 'Active';
                        //pb.startDate = (pb.startDate).replace('T', ' ');
                        pb.startDate = (pb.startDate).subString(0,10);
                        pb.endDate = (pb.endDate).subString(0,10);
                    }
                    if(accBean.offers != null && !accBean.offers.isEmpty()){
                        for (OfferBean ob : accBean.offers){
                            ob.startDate = (ob.startDate).subString(0,10);
                            ob.endDate = (ob.endDate).subString(0,10);
                            ob.redeemed = String.isBlank(ob.redeemed) || ob.redeemed == 'true' ? 'Reedemed' : 'Not Reedemed';
                        }
                    }
                } else {
                    accBean = new AccountBean();
                    accBean.msg = 'No Records Found';
                }
                return accBean;
            }
        }
        return accBean;
    }
}