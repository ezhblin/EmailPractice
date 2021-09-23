public with sharing class NewRecordsForAdmin implements Schedulable {
    public void execute(SchedulableContext context) {
        User[] admins = [SELECT Id FROM User WHERE ProfileId = '00e5g000004ehcwAAA'];

        System.Messaging.reserveSingleEmailCapacity(admins.size());
        EmailTemplate mailTemplate = [SELECT Id FROM EmailTemplate WHERE Name = 'Email template for practice s11' LIMIT 1];
       
        Messaging.SingleEmailMessage[] mails = new Messaging.SingleEmailMessage[]{};
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        

        String mailTextBody = '';
        for (String sObjectName : new String[]{'Contact', 'Account', 'Case'}) {
            mailTextBody += sObjectName + ':\n';
            for(SObject record : Database.query('SELECT Id FROM ' + sObjectName + ' WHERE DAY_ONLY(CreatedDate) = TODAY')) {
                mailTextBody += record.Id + '\n';
            }
        }

        for (User adminItem : admins) {
            mails.add(EmailWork.createMail(mailTemplate, adminItem.Id, mailTextBody));
        }
        
        System.Messaging.sendEmail(mails);
    }
}
