public with sharing class DeleteTestCase {
	//ESTA CLASE NO VA
    @AuraEnabled   
    public static Test_Case__c deleteTestCase(Test_Case__c testCase){                    
        delete testCase;
    	return testCase;
    }
}