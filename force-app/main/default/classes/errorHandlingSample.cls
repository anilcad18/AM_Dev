/*
	Created by: Greg Hacic
	Last Update: 31 August 2015 by Greg Hacic
	Questions?: greg@interactiveties.com
	
	Notes:
		- controller for errorHandlingSample.page
*/
public with sharing class errorHandlingSample {
	
	public List<Contact> contactRecords = new List<Contact>(); //list for Contact records
	public String searchError; //variable for housing the error text
	public String searchString {get; set;} //the input provided by the User as they interact with the Visualforce page
	
	//constructor
	public errorHandlingSample() {
		performSearch(); //call the performSearch method
	}
	
	//getter for the searchError variable
	public String getSearchError() {
		return searchError; //return searchError value
	}
	
	//method for searching based upon the search string provided from the user interface
	public void performSearch() {
		contactRecords.clear(); //clear the current list
		searchError = null; //null out the search error string
		if (searchString != '' && searchString != null) { //if searchString is not null
			if (searchString.length() >= 2) { //if searchString has more than 1 character
				if ((searchString.contains('*') || searchString.contains('?')) && searchString.length() < 3) { //if searchString is less than 3 characters long and contains a wildcard value
					searchError = 'Three characters are required when using wildcards in your search.'; //provide an error message so the User may revise their search
				}
			} else { //otherwise, the searchString is less than 2 characters long
				searchError = 'You must include at least two characters in the search string.'; //provide an error message so the User may revise their search
			}
			if (searchError == null) { //if searchError is null
				List<List<sObject>> searchList = [FIND :searchString IN ALL FIELDS RETURNING Contact(AccountId, Account.Name, Id, Email, MobilePhone, Name, Phone, Title ORDER BY LastName)]; //search for all contacts
				List<Contact> listOfFoundContacts = ((List<Contact>)searchList[0]); //cast the search results into a list of Contacts
				for (Contact c : listOfFoundContacts) { //for all Contacts returned in our search
					contactRecords.add(c); //add the Contact to our contactRecords list
				}
			}
		}
	}
	
	//getter for the list of Contacts
	public List<Contact> getContactRecords() {
		return contactRecords;
	}
	
	//getter for the size of the list of Contacts
	public Integer getContactRecordsSize() {
		return contactRecords.size();
	}

}