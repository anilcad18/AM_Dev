public class Fibanocci {
    public void test(){
        Integer i=0,j=1,k,n;
        System.debug(i+'  '+j+'  ');
        for(n=2;n<=6;n++){
            k=i+j;
            System.debug(k+'   ');
            i=j;
            j=k;
        }
    }
}