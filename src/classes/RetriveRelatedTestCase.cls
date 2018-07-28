public class RetriveRelatedTestCase {
    @AuraEnabled
    public static List <Test_Case__c> getRelatedTestCases(string projectId){       
        
        return [SELECT Project__r.Id, LastModifiedDate, Project__r.Name ,Description__c,Id,Name,Preconditions__c,Title__c,User_Story__c 
                FROM Test_Case__c WHERE Project__r.Id =: projectId ORDER BY LastModifiedDate  DESC NULLS FIRST];                
    }
    
     @AuraEnabled   
    public static Test_Case__c deleteTestCase(Test_Case__c testCase){ 
        
        List <Test_Case_Step__c> steps = [SELECT Id FROM Test_Case_Step__c
                						WHERE Test_Case__r.Id =: testCase.Id]; 
                
        delete steps;        
        delete testCase;
    	return testCase;
    }
}