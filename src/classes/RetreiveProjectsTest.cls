@isTest
public class RetreiveProjectsTest {
    
    @isTest	    
    static void getProjects() 
    {				
        List<Project__c> projects = new List<Project__c>();
                                
        for(Integer i=3; i>0;i--){
            Project__c proj = new Project__c();
            if(i != 1){            
            proj.Name = 'TestProject'+i;
        	proj.Status__c = 'Ongoing'; 
            }else{
                proj.Status__c = 'Finished'; 
            }
            projects.add(proj);
        }
        insert projects;
		
        List <Project__c> projects2 = RetreiveProjects.getProjects();		
        System.debug('*******' + projects2);
        
        System.assert(projects2.size() == 2);
    }
    
}