public with sharing class ContactTriggerHandler {
    public static void sendWelcom(List<Contact> newcomers) {
        System.Messaging.reserveSingleEmailCapacity(newcomers.size());
        EmailTemplate mailTemplate = [SELECT Id FROM EmailTemplate WHERE Name = 'Email template for practice s11' LIMIT 1];
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

        for (Contact newcomersItem : newcomers) {
            emails.add(EmailWork.createMail(mailTemplate, newcomersItem.Id, ''));
        }

        System.Messaging.sendEmail(emails);
    }
}
