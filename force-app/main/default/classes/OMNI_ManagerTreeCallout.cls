/**
 * @description Callout Class to fetch ManagerTree Payload.
 * @author      Anil Mannem
 * @date        21-Jan-2021
 */
public without sharing class OMNI_ManagerTreeCallout {

    public static string accessToken{get; set;}
    public static string accessTokenType{get; set;}

    /**
     * @description Method that returns ManagerTree Payload in Map<EmployeeId, SupervisorId> format.
     * @author      Anil Mannem
     * @date        21-Jan-2021
     */
    // public static Map<String, String> getManagerMap() {
    //     OMNI_ManagerTreeBean managerTreeBean = null;
    //     Map<String, String> managerMap = new Map<String, String>();

    //     Map<String, Object> accessTokenMap = getAccessTokenUsingNamedCredentials();
    //     if(accessTokenMap != null && !accessTokenMap.isEmpty()) {
    //         Http http = new Http();
    //         HttpRequest request = new HttpRequest();
    //         // request.setEndpoint('callout:ManagerTree_Request_Payload');
    //         request.setHeader('Content-Type', 'application/json');
    //         request.setHeader('Accept', 'application/json');
    //         String body = '{"application": "SLFC", "trackingNumber": "", "action": "GetAllEmployee" }';
    //         request.setBody(body);
    //         request.setMethod('POST');
    //         request.setTimeout(120000);
    //         accessToken = (String) accessTokenMap.get('access_token');
    //         accessTokenType = (String) accessTokenMap.get('token_type');    
    //         if(String.isNotBlank(accessTokenType) || String.isNotBlank(accessToken)){
    //             request.setHeader('Authorization', accessTokenType + ' ' + accessToken);
    //             try {
    //                 // HttpResponse response = http.send(request);
    //                 if(response.getStatusCode() == 200){
    //                     managerTreeBean = (OMNI_ManagerTreeBean) JSON.deserialize(response.getBody(), OMNI_ManagerTreeBean.class);
    //                     if(managerTreeBean != null) {
    //                         String trackingNumber = managerTreeBean.trackingNumber;
    //                         String requestTime = managerTreeBean.requestTime;
    //                         String processingTime = managerTreeBean.processingTime;
    //                         for(OMNI_ManagerTreeBean.EmployeeManagerTree mtb : managerTreeBean.employeeManagerTree){
    //                             managerMap.put(mtb.employeeID, mtb.supervisorID);
    //                         }
    //                         return managerMap;
    //                     } 
    //                 } else {
    //                     System.debug('****ManagerTree Payload Callout Failed:'+response);
    //                     saveErrorLog(request, response, null, 'Payload Callout Failed');
    //                 }
    //             } catch (Exception e) {
    //                 System.debug('*** ManagerTree Payload Callout Failed with Exception:'+e.getMessage());
    //                 saveErrorLog(request, null, e, 'Payload Exception');
    //             }
    //         }
    //     }
        // return null;
    // }
    
    /**
     * @description Method to returns accessTokenMap for ManagerTree Callout.
     * @author      Anil Mannem
     * @date        21-Jan-2021
     */
    // public static Map<String, Object> getAccessTokenUsingNamedCredentials() {
        // HttpRequest accessTokenReq = new HttpRequest();
        // String tokenRequestBody = 'grant_type=client_credentials&scope=hrtree/read';
        // // accessTokenReq.setEndpoint('callout:ManagerTree_AccessToken_API');
        // accessTokenReq.setMethod('POST');
        // accessTokenReq.setBody(tokenRequestBody);
        // Http accessTokenHttp = new Http();
        // try {
        //     // HTTPResponse accessTokenResponse = accessTokenHttp.send(accessTokenReq);
        //     if(accessTokenResponse.getStatusCode() == 200){
        //         return (Map<String, Object>) JSON.deserializeUntyped(accessTokenResponse.getBody());
        //     } else {
        //         System.debug('****Callout Failed:'+accessTokenResponse);
        //         saveErrorLog(accessTokenReq, accessTokenResponse, null, 'AccessToken Callout Failed');
        //     }
        // } catch (Exception e) {
        //     System.debug('*** Callout Failed with Exception:'+e.getMessage());
        //     saveErrorLog(accessTokenReq, null, e, 'AccessToken Exception');
        // }
        // return null;
    // }
    
    /**
     * @description Method to save Error Logs.
     * @author      Anil Mannem
     * @date        02-Feb-2021
     */
    // private static void saveErrorLog(HttpRequest request, HttpResponse response, Exception e, String errorDescription) {
        // ApplicationLogHandler.saveErrorLogs('ManagerTree', request, response, e, errorDescription);
    // }
}