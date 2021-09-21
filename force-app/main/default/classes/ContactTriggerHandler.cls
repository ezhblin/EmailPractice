public with sharing class ContactTriggerHandler {
    public static void sendWelcom(List<Contact> newcomers) {
        System.Messaging.reserveSingleEmailCapacity(newcomers.size());
        EmaiilTemplate template = [SELECT Id FROM EmailTemplate WHERE Name = 'Letterhead_for_practice_s11' LIMIT 1];
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

        for (Contact newcomersItem : newcomers) {
            emails.add(createMail(template, newcomersItem));
        }

        System.Messaging.sendEmail(emails);
    }

    private static Messaging.SingleEmailMessage createMail(EmaiilTemplate template, Contact contact) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSenderDisplayName('God');  
        mail.setBccSender(false);
        mail.setUseSignature(false);
        mail.setTemplateId(template.Id);
        mail.setTargetObjectId(contact.Id);
        return mail;
    }
}
