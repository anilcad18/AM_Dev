/**
 * Created by Anil Mannem on 03-Aug-2020
 */
public class icRepoBidder implements icIClass {

    public Object GetInstance() {
        return new Impl();
    }

    public Interface IClass {
        List<Bidder__c> getBidderInfo();
        List<Bidder__c> getBidderDetailsforPDF(String recordId);
        void updateBidderStatus(List<Bidder__c> bidderList);
    }

    public class Impl implements IClass {
        public List<Bidder__c> getBidderInfo() {
            return [SELECT  Name,
                            Opportunity__c,
                            //Unique_ID__c,
                            Status__c
                    FROM Bidder__c];
        }

		public List<Bidder__c> getBidderDetailsforPDF(String recordId) {
			return [SELECT Id, 
                            Name,
                            Owner.Email,
                           // Distributor_Account__r.Name,
                           // Contractor_Account__r.Name,
                            Opportunity__r.Name,
                            Opportunity__c,
                           // Opportunity__r.Type_of_Project__c,
                           // Opportunity__r.Account.Name,
                            //Opportunity__r.Est_Project_Start_Date__c,
//                            Opportunity__r.Est_Project_Completion__c,
                            //Opportunity__r.Estimated_Project_Size__c,
                            //Opportunity__r.Account.BillingAddress,
                            //Opportunity__r.Account.BillingStreet,
                            //Opportunity__r.Account.BillingCity,
                            //Opportunity__r.Quote_Approved__c,
                            Opportunity__r.Amount
                        FROM Bidder__c
                        WHERE Id =: recordId];
		}
        
        public void updateBidderStatus(List<Bidder__c> bidderList) {
            update bidderList;
        }
    }
}