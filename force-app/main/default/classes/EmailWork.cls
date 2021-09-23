public with sharing class EmailWork {
    public static Messaging.SingleEmailMessage createMail(EmailTemplate template, Id receiverId, String message) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSenderDisplayName('God');  
        mail.setBccSender(false);
        mail.setUseSignature(false);
        mail.setSaveAsActivity(false);
        mail.setTemplateId(template.Id);
        mail.setTargetObjectId(receiverId);
        mail.setPlainTextBody(message);
        return mail;
    }
}
