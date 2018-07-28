trigger SendEmailTimeTrigger on Project__c (before insert, before update) {
    for(Project__c proj : trigger.new){
        list <Project__c> projects = [SELECT Id, Name, Status__c, ownerId, owner.email, (SELECT Id FROM Test_Cases__r)
                                      		FROM Project__c WHERE Id =: proj.Id];
        User u = [SELECT email FROM User WHERE Id =: proj.OwnerId];
        
        if(proj.Status__c == 'Cancelled' || proj.Status__c == 'Finished'){                        
            List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();
            Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
            
            List<String> sendTo = new List<String>();        
            string mailAddress = u.email;                
            sendTo.add(mailAddress);
            mail.setToAddresses(sendTo);
            
            mail.setSubject('Cambio de estado de proyecto a ' + proj.Status__c);
            String email = 'Estimado/a, ' + '<br/> <br/>';
            
            for(Project__c p : projects)
            {                               
                email += 'El proyecto ' + p.Name + ' cambio su estado a ' + proj.Status__c + '. Tiene ' + p.Test_Cases__r.size() + ' Test Cases asociados a el.<br/><br/>';               
            }                                               
            email += 'Saludos.<br/><br/>';
            mail.setHtmlBody(email);                                
            mails.add(mail);                              
            if(mails.size()>0)	Messaging.sendEmail(mails);    
        }
    }
}