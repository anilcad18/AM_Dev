public class MultiAdd{
    Public Account newAcc {get;set;}
    public List<contact> lstCont  = new List<contact>();
    public List<innerClass> lstInner{get;set;}
    public String selectedRowIndex{get;set;}  
    public Integer count = 1;
    public MultiAdd(ApexPages.StandardController acc){
       newAcc = (Account)acc.getRecord();
       lstInner = new List<innerClass>();
       addMoreRows();
       selectedRowIndex = '0';
    }    

    public PageReference Save(){
        PageReference pr = new PageReference('/apex/MultiAdd');        
        for(Integer j = 0;j<lstInner.size();j++){
            lstCont.add(lstInner[j].acct);
        } 
        insert lstCont;
        pr.setRedirect(True);
        return pr;
    }
    public void Add(){   
        count = count+1;
        addMoreRows();      
    }
    public void addMoreRows(){      
      innerClass objInnerClass = new innerClass(count);
      lstInner.add(objInnerClass);          
    }
    public void Del(){      
        if(count!=1){
            lstInner.remove(Integer.valueOf(selectedRowIndex)-1);
      		count = count - 1;        
        }
    }
/*    public MultiAdd1(ApexPages.StandardController ctlr){    
       lstInner = new List<innerClass>();
       addMoreRows();
       selectedRowIndex = '0';        
    }
*/
	public class innerClass{               
        public String recCount{get;set;}                
        public Contact acct{get;set;}
        Public contact con{get;set;}
        public innerClass(Integer intCount){
            recCount = String.valueOf(intCount);                                
            con = new contact();            
        }
    }
}