public class RetreiveRelatedSteps {
	    @AuraEnabled
    public static List<Test_Case_Step__c> GetRelatedSteps(string testCaseId){       
		        
        return [SELECT Description__c,Expected_Result__c,Id,Name, Test_Case__r.Id FROM Test_Case_Step__c
                WHERE Test_Case__r.Id =: testCaseId];               
    }
}