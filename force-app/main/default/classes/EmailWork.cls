public with sharing class EmailWork {
    public static Messaging.SingleEmailMessage createMail(EmailTemplate template, Id reciverId, String message) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSenderDisplayName('God');  
        mail.setBccSender(false);
        mail.setUseSignature(false);
        mail.setSaveAsActivity(false);
        mail.setTemplateId(template.Id);
        mail.setTargetObjectId(reciverId);
        mail.setPlainTextBody(message);
        return mail;
    }
}
