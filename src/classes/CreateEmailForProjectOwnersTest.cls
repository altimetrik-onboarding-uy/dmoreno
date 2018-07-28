@isTest
private class CreateEmailForProjectOwnersTest {
    public static String CRON_EXP = '0 0 22 ? * *';
    
    
    static testMethod void testScheduledJob(){
        List<Project__c> proj = new List<Project__c>();
        List<Test_Case__c> TC = new List<Test_Case__c>();
        
        for(Integer i=0; i<4; i++){
            Project__c p = new Project__c(
                Name = 'ProjectTest' + i,
                Status__c = 'Ongoing'
            );
            proj.add(p);           
        }
        insert proj;
        
        for (Project__c p : proj){
            for(Integer i=0; i<2; i++){
                Test_Case__c t = new Test_Case__c(
                    Title__c = 'TestCase ' + p.Name + ' - ' + i,
                    Project__c = p.Id
                );
                TC.add(t);	                
            }
        }
        insert TC;
        
        
        Map<Id, Project__c> projMap = new Map<Id, Project__c>(proj);
        List<Id> projIds = new List<Id>(projMap.keySet());
        Test.startTest();
        
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new CreateEmailForProjectOwners());
        
        System.debug('**********');
        
        System.assert(TC.size() >0);
 	 }
}