@isTest
public class RetreiveRelatedStepsTest {
    
    @isTest	    
    static void GetRelatedSteps() 
    {				
        Project__c proj = new Project__c();
        proj.Name = 'TestProject';
        proj.Status__c = 'Ongoing';        
        Test_Case__c testCase = new Test_Case__c();
        insert proj;
        testCase.Project__c = proj.Id;
        testCase.Description__c = 'Description for Test unit';
        insert testCase;
        Test_Case_Step__c step = new Test_Case_Step__c();
        step.Description__c = 'TestDescription';
        step.Test_Case__c = testCase.Id;
        insert step;
                                            
        List <Test_Case_Step__c> steps = RetreiveRelatedSteps.GetRelatedSteps(testCase.Id);                
        Test_Case_Step__c stp = steps.get(0);                
        System.assert(stp.Id == step.Id);
    }
    
}