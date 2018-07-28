public with sharing class RetreiveProjects {
@AuraEnabled
    public static List <Project__c> getProjects(){
        return [SELECT Description__c,Id,Name,Status__c 
               FROM Project__c 
               WHERE Status__c = 'Ongoing'];
    }
}