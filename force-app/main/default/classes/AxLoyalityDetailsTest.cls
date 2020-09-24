@isTest
private class AxLoyalityDetailsTest {
    @isTest static  void testGetCallout() {
        Test.setMock(HttpCalloutMock.class, new AxLoyalityDetailsMock());
        Case c = new Case(origin='Chat', status='New', SuppliedEmail='test@test.com', subject='Test Case');
        insert c;
        system.test.startTest();
        Case ct = [SELECT id, SuppliedEmail from CASE where id =: c.id];
        // Call method to test
        AccountBean result = AxLoyalityDetails.getLoyalityDetails(ct.id);
        ct.SuppliedEmail = '';
        update ct;
        result = AxLoyalityDetails.getLoyalityDetails(ct.id);
    }
}