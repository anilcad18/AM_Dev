@isTest
private class CcOrderHistoryTest {
    @isTest static  void testGetCallout() {
        Test.setMock(HttpCalloutMock.class, new CcOrderHistoryMock());
        Case c = new Case(origin='Chat', status='New', SuppliedEmail='test@test.com', subject='Test Case');
        insert c;
        Map<String, String> accToken = new Map<String, String>();
        accToken.put('token', 'bc770a45-e60c-432f-a5b6-ffa5dd794156' );
        accToken.put('token_type', 'Bearer ');


        system.test.startTest();
        Case ct = [SELECT id, SuppliedEmail from CASE where id =: c.id];
        // Call method to test
        CcOrderHistory.accessToken = 'bc770a45-e60c-432f-a5b6-ffa5dd794156';
        CcOrderHistory.accessTokenType = 'Bearer ';
        CcCaseRespBean result = CcOrderHistory.getOrderDetails(ct.id);
        ct.SuppliedEmail = '';
        update ct;
        result = CcOrderHistory.getOrderDetails(ct.id);
    }
}