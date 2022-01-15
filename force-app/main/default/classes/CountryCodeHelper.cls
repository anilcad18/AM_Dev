public class CountryCodeHelper {
    public static string getCountryCode(String country) {
        Country_Code__mdt cc = Country_Code__mdt.getInstance(country);
        return cc.Country_Code__c;
    }
}