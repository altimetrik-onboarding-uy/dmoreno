public class RetreiveRelatedSteps {
	    @AuraEnabled
    public static List<Test_Case_Step__c> GetRelatedSteps(string testCaseId){       
		RETURN [SELECT Description__c, Index__c, Expected_Result__c,Id,Name, Test_Case__r.Id FROM Test_Case_Step__c
                WHERE Test_Case__r.Id =: testCaseId ORDER BY Index__c];      
       /* return [SELECT Description__c,Expected_Result__c,Id,Name, Test_Case__r.Id FROM Test_Case_Step__c
                WHERE Test_Case__r.Id =: testCaseId];               */
    }
    
     @AuraEnabled
    public static void SetIndexInStep(List<Test_Case_Step__c> stepList){
        List<Test_Case_Step__c> auxLst = new List<Test_Case_Step__c>();
        Integer indx = 0;
        for(Test_Case_Step__c stp: stepList){
            stp.Index__c = indx;
            auxLst.add(stp);
            indx++;
        }
        update auxLst;
    }
}