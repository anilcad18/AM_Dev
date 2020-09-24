@isTest
global class AxLoyalityDetailsMock implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        String body = '{"AccountId":"0000062014","FsProfileConfig":{"VipStatus":"53 / 400"'+
                    ',"PointsForVip":"400","VipProgramId":"0000000006","StandardOfferId":"0000000037",'+
                    '"PointsForStandardOffer":"100","BeverageOfferId":"0000000038","BeverageOfferCriteria":"10"},'+
                    '"Cards":[{"CardId":"000002738833","AccountId":"0000062014","Active":true,'+
                    '"ActivatedAtStore":"00071","ActivatedByEmplId":"003235"}],"Offers":[{"OfferId":"0000000002",'+
                    '"DescriptionEn":"Birthday tea","StartDate":"2020-03-13T00:00:00","EndDate":"2020-04-13T23:59:59",'+
                    '"Id":"3300000000"}],"Programs":[{"ProgramId":"0000000006","Status":0,"StartDate":"2019-01-01T00:00:00",'+
                    '"EndDate":"2100-01-01T00:00:00","EnrolledAtStore":null,"EnrolledByEmpl":null,'+
                    '"EnrolledDate":"0001-01-01T00:00:00","Offers":[]}]}';
        response.setBody(body);
        response.setStatusCode(200);
        return response; 
    }
}