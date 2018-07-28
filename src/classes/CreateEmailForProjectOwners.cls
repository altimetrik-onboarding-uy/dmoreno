global class CreateEmailForProjectOwners implements Schedulable {
    
    global void execute (SchedulableContext SC){       
        SendEmailToProjectOwner();      
        // CreateEmailForProjectOwners sendDailyEmail = new CreateEmailForProjectOwners();
        // string sch = '0 0 22 ? * *';        
        // System.schedule('Send Daily Email', sch, sendDailyEmail);	
    }
    
    global void SendEmailToProjectOwner()
    {
        
        list <Project__c> projects = [SELECT Id, Name, Status__c, ownerId, owner.email, (SELECT Id FROM Test_Cases__r)
                                      FROM Project__c WHERE Status__c = 'Ongoing'];
        
        List<AggregateResult> ownerId = [SELECT OwnerId, owner.email FROM Project__c WHERE Status__c = 'Ongoing' GROUP BY OwnerId, owner.email];
        
        List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();        
        
        for(AggregateResult oId : ownerId){
            
            Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
            
            List<String> sendTo = new List<String>();        
            string mailAddress =  String.valueof(oId.get('email'));                
            sendTo.add(mailAddress);
            mail.setToAddresses(sendTo);
            
            mail.setSubject('List of Ongoing Projects');
            String email = 'Estimado/a, ' + '<br/> <br/>' +
                'Estos son los proyectos con estado Ongoing al dia de hoy: <br/><br/>';
            
            for(Project__c p : projects)
            {
                if(p.ownerId == oId.get('OwnerId')){                                                                                       
                    email += 'Nombre: ' + p.Name + ' Status: ' + p.Status__c + 'Test Cases: ' + p.Test_Cases__r.size() + '<br/>';                                                                                 
                }                 
            }
            email += '<br/> Saludos.<br/><br/>';
            mail.setHtmlBody(email);                  
        }
        if(mails.size()>0)	Messaging.sendEmail(mails);            
    }
}