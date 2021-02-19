/**
 * @description CalloutMock Class for ManagerTree.
 * @author      Anil Mannem
 * @date        21-Jan-2021
 */
@isTest
global class OMNI_ManagerTreeCalloutMock implements HttpCalloutMock {

    protected Integer code; 
    protected String  status;
    protected String  responseAuth;
    protected String  responseManagerTree;

    global OMNI_ManagerTreeCalloutMock(Integer code, String status, String responseAuth, String responseManagerTree) {
        this.code                  = code;
        this.status                = status;
        this.responseAuth          = responseAuth; 
        this.responseManagerTree   = responseManagerTree; 
    }

    global HTTPResponse respond(HTTPRequest req) {
        HttpResponse resp = new HttpResponse(); 
        if(code == 0){
            throw new CalloutException('Critial error');
        } else if(req.getEndpoint() == 'callout:ManagerTree_Request_Payload'){
            resp.setBody(this.responseManagerTree); 
        } else if (req.getEndpoint() == 'callout:ManagerTree_AccessToken_API'){
            resp.setBody(this.responseAuth);
        } else {
            System.assert(false, 'unexpected endpoint ' + req.getEndpoint());
            return null;
        }
        resp.setStatusCode(this.code);
        resp.setStatus(this.status);
        return resp;
    }
}