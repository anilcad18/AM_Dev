public class Checkbox_del {  
   public List<sObjectWrapper> wrappers{get;set;}  
   public Checkbox_del(){  
   wrappers = getData();  
   }  
   
    public void deleterecords(){  
     List<Account> accToDel = new List<Account>();  
     for(sObjectWrapper wrap : wrappers){  
       if(wrap.isSelected){  
         accToDel.add(wrap.myAccount);  
       }  
     }  
      delete accToDel;  
      wrappers = getData();  
   }  
    private List<sObjectWrapper> getData(){  
     List<sObjectWrapper> wrappers = new List<sObjectWrapper>();  
     for(Account acc : [select name,industry,phone from Account order by name desc ]){  
       wrappers.add(new sObjectWrapper(acc,false));  
     }  
     return wrappers;  
   }  
    public class sObjectWrapper{  
    public boolean isSelected{get;set;}  
    public Account myAccount{get;set;}  
    public sObjectWrapper(Account myAccount,Boolean isSelected){  
     this.myAccount = myAccount;  
     this.isSelected = isSelected;  
    }  
   }  
 }