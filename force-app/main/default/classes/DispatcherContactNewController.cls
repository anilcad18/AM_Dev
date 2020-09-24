public class DispatcherContactNewController {

    public DispatcherContactNewController() {
            }

    public ApexPages.StandardSetController setpb{
            get{
                if(setpb == null){
                    setpb = new ApexPages.StandardSetController(Database.getQueryLocator(
                        [SELECT Id, LastName, Createddate FROM Contact ORDER BY Createddate DESC ]));
                             setpb.setPageSize(10);
                             }
                             return setpb;
               } 
               set;
        }

        public List<Contact>getpbs(){
            return (List<Contact>)setpb.getrecords();
        }
/* ---------- For Redirect to New Page ------ */
 public string selectedAsset {get;set;}
    public PageReference assetClicked() 
    { 

    PageReference redirect = new PageReference('/apex/CreateTask?whoId='+selectedAsset); 

    // pass the selected asset ID to the new page
    redirect.setRedirect(true); 

    return redirect;
    }
        }