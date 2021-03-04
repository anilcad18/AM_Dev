public class ManagerTree {

    public static string accessToken{get; set;}
    public static string accessTokenType{get; set;}

    public static void createManagerTree(){
        Map<String, String> managerMap = new Map<String, String>();
        managerMap.put('1','2');
        managerMap.put('2','3');
        managerMap.put('3','4');
        managerMap.put('4','5');
        managerMap.put('5','5_1');
        managerMap.put('6','7');
        managerMap.put('7','8');
        managerMap.put('8','');
        managerMap.put('1.1','');
        managerMap.put('1.2','1.3');
        managerMap.put('1.3','1.4');
        managerMap.put('2.1','2.2');
        managerMap.put('2.2','2.3');
        managerMap.put('2.5','2.6');
        managerMap.put('3.1','');
        
        system.debug('****Manager Map is:'+managerMap);
        
        Map<String, String> managerTreeMap = new Map<String, String>();
        Set<String> empIdSet = managerMap.keySet();
        system.debug('****KeySet is:'+empIdSet);
        for(String s: empIdSet){
            String mgrTree = ','+s;
            String mgrId = s;
            system.debug('***mgrId is:'+mgrId);
            do{
                if(managerMap.get(mgrId) != null || !String.isBlank(managerMap.get(mgrId))){
                    mgrTree = mgrTree + ',' + managerMap.get(mgrId);
                    mgrId = managerMap.get(mgrId);
                }
            }while(managerMap.containsKey(mgrId));
            mgrTree = mgrTree +',';
            managerTreeMap.put(s, mgrTree);
        }
        system.debug('****Manager Tree Map is');
        for(String s: managerTreeMap.KeySet()){
	        system.debug(s+'--->'+managerTreeMap.get(s));
        }

    }

    
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
        if (accessTokenResponse.getStatusCode() == 200) {
	        System.debug('***Response Body is:'+JSON.serialize(accessTokenResponse.getBody()));
            JSONParser parser = JSON.createParser(accessTokenResponse.getBody());
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

    public static void getManagerTreeDetails(){
        Map<String, String> accesTokenMap = getAccesTokenUsingNamedCredentials();
        if (!accesTokenMap.isEmpty()) {
            if(!System.Test.isRunningTest()) {
                accessToken = accesTokenMap.get('token');
                accessTokenType = accesTokenMap.get('token_type');    
            }
            if (String.isNotBlank(accessToken)) {
                Http http = new Http();
                HttpRequest request = new HttpRequest();
                request.setEndpoint('https://intg-mtree.sf.intactfc.com:443/hr-employees-api-endpoints/v1/getAllEmployees');
                String body = '{"application": "SLFC", "trackingNumber": "Martin-343242-423423-44rtffrd346", "action": "GetAllEmployee" }';
                request.setBody(body);
                request.setHeader('Content-Type', 'application/json');
                request.setHeader('Accept', 'application/json');
                request.setHeader('Authorization', accessTokenType + ' ' + accessToken);
                request.setMethod('POST');
                request.setTimeout(120000);  //Time in milliseconds
                HttpResponse response = http.send(request);
                // If the request is successful, parse the JSON response.
                if (response.getStatusCode() == 200) {
                    System.debug('**** The respn:' + JSON.serialize(response.getBody()));
                }
            }
        }
    }
    
}