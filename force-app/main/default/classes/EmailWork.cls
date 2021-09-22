public with sharing class EmailWork {
    public static Messaging.SingleEmailMessage createMail(EmailTemplate template, Id reciverId, String message) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSenderDisplayName('God');  
        mail.setBccSender(false);
        mail.setUseSignature(false);
        mail.setTemplateId(template.Id);
        mail.setTargetObjectId(reciverId);
        return mail;
    }
}
