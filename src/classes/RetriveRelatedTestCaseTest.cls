@isTest
public class RetriveRelatedTestCaseTest {

	@isTest	    
    static void getRelatedTestCases() 
	{				
		Project__c proj = new Project__c();
        proj.Name = 'TestProject';
        proj.Status__c = 'Ongoing';        
		Test_Case__c testCase = new Test_Case__c();
        insert proj;
        testCase.Project__c = proj.Id;
        testCase.Description__c = 'Description for Test unit';
        insert testCase;
                
        List <Test_Case__c> testCases = RetriveRelatedTestCase.getRelatedTestCases(proj.Id);                   
        Test_Case__c TC = testCases.get(0);            
        System.assert(TC.Id == testCase.Id);
	}
    
    @isTest	    
    static void	 deleteTestCase() 
	{				
		Project__c proj = new Project__c();
        proj.Name = 'TestProject';
        proj.Status__c = 'Proposed';
        insert proj;
		Test_Case__c testCase = new Test_Case__c();
        testCase.Project__c = proj.Id;
        testCase.Description__c = 'Description for Test unit';
        insert testCase;
                
        Test_Case__c testC = RetriveRelatedTestCase.deleteTestCase(testCase);        
        List <Test_Case__c> testCases = RetriveRelatedTestCase.getRelatedTestCases(proj.Id);
		                  
        System.assert(testCases.IsEmpty());        
	}
    
}