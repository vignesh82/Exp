public with sharing class ContactTriggerHandler {
    
    public void onAfterInsert(List<Contact> accList, Map<Id,Contact> oldMap, Map<Id,Contact> newMap){
        Set<Id> accountIdSet = new Set <Id>();
        List<Account> lstAccountsToUpdate = new List <Account>();
         
        for(Contact con:accList){
            accountIdSet.add(con.accountID);            
        }
        
        for(Account acc:[SELECT Id,Name,Number_of_Contacts__c,(Select Id from Contacts) from Account where Id IN: accountIdSet]){
            Account accObj = new Account ();
            accObj.Id = acc.Id;
            accObj.Number_of_Contacts__c= acc.Contacts.size();
            lstAccountsToUpdate.add(accObj);
        }
        
        UPDATE lstAccountsToUpdate;
    }
    
    public void onAfterUpdateDelete(List<Contact> accList, Map<Id,Contact> oldMap, Map<Id,Contact> newMap){
        Set <Id> accountIdSet = new Set <Id>();
        List <Account> lstAccountsToUpdate = new List <Account>();
         
        
        for(Id con:oldMap.keySet()){
            accountIdSet.add(oldMap.get(con).accountID);
        }
        
        
        for(Account acc:[SELECT Id,Name,Number_of_Contacts__c,(Select Id from Contacts) from Account where Id IN: accountIdSet]){
            Account accObj = new Account ();
            accObj.Id = acc.Id;
            accObj.Number_of_Contacts__c= acc.Contacts.size();
            lstAccountsToUpdate.add(accObj);
        }
        
        UPDATE lstAccountsToUpdate;
    }

}