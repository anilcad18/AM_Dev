/**
 * @description Callout Class to fetch ManagerTree Payload.
 * @author      Anil Mannem
 * @date        21-Jan-2021
 */
public class BatchManagerTree {

    public static string accessToken{get; set;}
    public static string accessTokenType{get; set;}

    /**
     * @description Method that returns ManagerTree Payload im Map<EmployeeId, SupervisorId> format.
     * @author      Anil Mannem
     * @date        21-Jan-2021
     */
    public static Map<String, String> getManagerTreeDetails(){
        OMNI_ManagerTreeBean managerTreeBean = null;
        Map<String, String> managerMap = new Map<String, String>();
        Map<String, String> managerTreeMap = new Map<String, String>();
        Set<String> empIdSet = new Set<String>();

        Map<String, String> accessTokenMap = getAccesTokenUsingNamedCredentials();
        System.debug('***AccessTokenMap is:'+accessTokenMap);
        if(!accessTokenMap.isEmpty()){
            if(!System.Test.isRunningTest()){
                accessToken = accessTokenMap.get('token');
                accessTokenType = accessTokenMap.get('token_type');    
            }
            if(String.isNotBlank(accessToken)){
                Http http = new Http();
                HttpRequest request = new HttpRequest();
                //request.setEndpoint(System.Label.ManagerTreeURL);
                request.setHeader('Authorization', accessTokenType + ' ' + accessToken);
                request.setHeader('Content-Type', 'application/json');
                request.setHeader('Accept', 'application/json');
                String body = '{"application": "SLFC", "trackingNumber": "Martin-343242-423423-44rtffrd346", "action": "GetAllEmployee" }';
                request.setBody(body);
                request.setMethod('POST');
                request.setTimeout(120000);  //Time in milliseconds
                System.debug('***Request is:'+request);
                System.debug('***RequestHeaders Auth is:'+request.getHeader('Authorization'));
                System.debug('***RequestHeaders ContentType is:'+request.getHeader('Content-Type'));
                HttpResponse response = http.send(request);
                System.debug('***Response in getManagerBean is:'+response);
                System.debug('***Response Body in getManagerBean is:'+JSON.serialize(response.getBody()));
                // If the request is successful, parse the JSON response.
                if(response.getStatusCode() == 200){
                    System.debug('**** The respn:' + JSON.serialize(response.getBody()));
                    managerTreeBean = (OMNI_ManagerTreeBean) JSON.deserialize(response.getBody(), OMNI_ManagerTreeBean.class);
                    if(managerTreeBean != null){
                        String trkgNumber = managerTreeBean.trackingNumber;
                        String reqTime = managerTreeBean.requestTime;
                        String prsTime = managerTreeBean.processingTime;
                        for(OMNI_ManagerTreeBean.EmployeeManagerTree mtb : managerTreeBean.employeeManagerTree){
                            managerMap.put(mtb.employeeID, mtb.supervisorID);
                        }
                    }
                    system.debug('***managerMap is:'+managerMap);
                    if(managerMap != null){
                        system.debug('***Processing managerTree');
                        //managerTreeMap = processManagerTree(managerMap);
                        return processManagerTree(managerMap);
                    }
                }
            }
        }
        return null;
    }
    
    /**
     * @description Method that returns accessTokenType and accessToken.
     * @author      Anil Mannem
     * @date        21-Jan-2021
     */
    public static Map<String, String> getAccesTokenUsingNamedCredentials() {
        Map<String, String> accessMap = new Map<String, String>();
        Http http = new Http();
        String accessToken = NULL;
        String tokenRequestBody = 'grant_type=client_credentials&scope=hrtree/read';
        HttpRequest accessTokenReq = new HttpRequest();
        accessTokenReq.setEndpoint('callout:ManagerTree_AccessToken_API');
        accessTokenReq.setMethod('POST');
        accessTokenReq.setBody(tokenRequestBody);
        Http accessTokenHttp = new Http();
        HTTPResponse accessTokenResponse = accessTokenHttp.send(accessTokenReq);
        System.debug('***Response is:'+accessTokenResponse);
        // If the request is successful, parse the JSON response.
        if(accessTokenResponse.getStatusCode() == 200){
	        System.debug('***Response Body is:'+JSON.serialize(accessTokenResponse.getBody()));
            JSONParser parser = JSON.createParser(accessTokenResponse.getBody());
            while(parser.nextToken() != null){
                if((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'access_token')){
                    parser.nextToken();
                    accessToken = parser.getText();
                    accessMap.put('token', accessToken);
                }
                if((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'token_type')){
                    parser.nextToken();
                    accessMap.put('token_type', parser.getText());
                }
            }
            return accessMap;
        }
        return accessMap;
	}
    public static Map<String, String> processManagerTree(Map<String, String> managerMap){
        Map<String, String> managerTreeMap = new Map<String, String>();
        if(managerMap != null){
            System.debug('****ManagerMap Size is:'+managerMap.size());
            System.debug('****ManagerMap is:'+managerMap);
            Set<String> empIdSet = managerMap.keySet();
            for(String s: empIdSet){
                String mgrTree = ','+s;
                String mgrId = s;
                do{
                    if(managerMap.get(mgrId) != null || !String.isBlank(managerMap.get(mgrId))){
                        mgrTree = mgrTree + ',' + managerMap.get(mgrId);
                        mgrId = managerMap.get(mgrId);
                    }
                }while(managerMap.containsKey(mgrId));
                mgrTree = mgrTree +',';
                mgrTree = mgrTree.replace(',,', ',');
                managerTreeMap.put(s, mgrTree);
            }
        }
        System.debug('****managerTreeMap Size is:'+managerTreeMap.size());
        System.debug('****managerTreeMap is:'+managerTreeMap);
        return managerTreeMap;
    }
}