public class testClass{

public testClass() {
    system.debug('*************Entered into testClass()******');
   regMap = new Map<String, Set<String>>();
   regMap.put('a', new Set<String>{'a1','a2','a3'});
   regMap.put('b', new Set<String>{'b1','b2'});
   regMap.put('c', new Set<String>{'c1','c2','c3','c4'});
   keys = new Set<String>{'a','b','c'};
    system.debug('*************Leaving from testClass()******');   
}
    public Map<String, Set<String>> regMap {get; set;}
    public Set<String> keys {get; set;}
/*

    public Map<String, Set<String>> regMap {
        get{
            system.debug('*************Entered into regMap() Get()******');
            
            system.debug('*************Leaving from regMap() Get()******');
            return null;
        }
        set{
            system.debug('*************Entered into regMap() Set()******');
        
            system.debug('*************Leaving from regMap() Set()******');
        }
    }

    public Set<String> keys {
        get{
            system.debug('*************Entered into Keys Get()******');
            
            system.debug('*************Leaving from Keys Get()******');
            return null;
        }
        set{
            system.debug('*************Entered into Keys Set()******');
        
            system.debug('*************Leaving from Keys Set()******');
        }
    }

*/
}