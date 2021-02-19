/**
 * @description OMNI_ManagerTreeCallout Test Class.
 * @author      Anil Mannem
 * @date        21-Jan-2021
 */
@isTest
public class OMNI_ManagerTreeCalloutTest {

    // @isTest
    // static void test_getAccessTokenUsingNamedCredentials_Success(){
    //     String body = '{"access_token":"ImyOKUTLAlg83J26fkTI","scope":"hrtree\\/read","token_type":"bearer","expires_in":299}';
    //     Test.setMock(HttpCalloutMock.class, new OMNI_ManagerTreeCalloutMock(200, 'Success', body, null));
    //     System.Test.startTest();
    //     Map<String, Object> accTokenMap = OMNI_ManagerTreeCallout.getAccessTokenUsingNamedCredentials();
    //     System.assertEquals('ImyOKUTLAlg83J26fkTI', accTokenMap.get('access_token'));
    //     System.assertEquals('bearer', accTokenMap.get('token_type'));
    // }
    
    // @isTest
    // static void test_getAccessTokenUsingNamedCredentials_Failure(){
    //     String body = '';
    //     Test.setMock(HttpCalloutMock.class, new OMNI_ManagerTreeCalloutMock(400, 'Error', body, null));
    //     System.Test.startTest();
    //     Map<String, Object> accTokenMap = OMNI_ManagerTreeCallout.getAccessTokenUsingNamedCredentials();
    //     System.assertEquals(null, accTokenMap);
    // }

    // @isTest
    // static void test_getAccessTokenUsingNamedCredentials_Exception(){
    //     String body = '';
    //     Test.setMock(HttpCalloutMock.class, new OMNI_ManagerTreeCalloutMock(0, 'Error', body, null));
    //     System.Test.startTest();
    //     Map<String, Object> accTokenMap = OMNI_ManagerTreeCallout.getAccessTokenUsingNamedCredentials();
    //     System.assertEquals(null, accTokenMap);
    // }

    // @isTest
    // static void test_getManagerMap_Success() {
    //     String managerTreeResponse = '{"trackingNumber":"",'+
    //         			'"requestTime":"2021-01-20T09:40:19.096",'+
    //         			'"processingTime":"1721",'+
    //         			'"employeeManagerTree":'+
    //         				'[{"employeeID":"xx720274","supervisorID":"xx720275"},'+
    //         				'{"employeeID":"xx720275","supervisorID":"xx720276"},'+
    //         				'{"employeeID":"xx720276","supervisorID":""}]}';
    //     String authResponse = '{"access_token":"ojOfXB26k6YVjwvc5lfE","token_type":"bearer"}';
    //     Test.setMock(HttpCalloutMock.class, new OMNI_ManagerTreeCalloutMock(200, 'Success', authResponse, managerTreeResponse));
    //     System.Test.startTest();
    //     OMNI_ManagerTreeCallout.accessToken = 'ojOfXB26k6YVjwvc5lfE';
    //     OMNI_ManagerTreeCallout.accessTokenType = 'bearer';
    //     Map<String, String> result = OMNI_ManagerTreeCallout.getManagerMap();
    //     Integer resSize = result.size();
    //     System.assertEquals(resSize, 3);
    // }

    // @isTest
    // static void test_getManagerMap_NoAccessToken() {
    //     String managerTreeResponse = '{"trackingNumber":"",'+
    //         			'"requestTime":"2021-01-20T09:40:19.096",'+
    //         			'"processingTime":"1721",'+
    //         			'"employeeManagerTree":'+
    //         				'[{"employeeID":"xx720274","supervisorID":"xx720275"},'+
    //         				'{"employeeID":"xx720275","supervisorID":"xx720276"},'+
    //         				'{"employeeID":"xx720276","supervisorID":""}]}';
    //     String authResponse = '{}';
    //     Test.setMock(HttpCalloutMock.class, new OMNI_ManagerTreeCalloutMock(200, 'Success', authResponse, managerTreeResponse));
    //     System.Test.startTest();
    //     Map<String, String> result = OMNI_ManagerTreeCallout.getManagerMap();
    //     System.assertEquals(null, result);
    // }

}