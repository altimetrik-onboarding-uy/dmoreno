global class SendDailyEmailToProjectOwner implements Schedulable {
 //ESTA CLASE NO VA!    
    global void execute (SchedulableContext SC){
        SendDailyEmailToProjectOwner sendDailyEmail = new SendDailyEmailToProjectOwner();
        string sch = '0 0 23 ? * ? ?';
        System.schedule('Owner', sch, sendDailyEmail);	
    }
    
}