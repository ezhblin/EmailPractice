@isTest
public with sharing class NewRecordsForAdminTest {
    @isTest
    public static void executeTest(){
        Account newAccount = new Account(Name = 'Canistra');
        insert newAccount;


        Test.startTest();
        String jobId = System.schedule('testBasicScheduledApex', '0 0 0 23 9 ? 2022', new NewRecordsForAdmin());
  
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
  
        System.assertEquals(0, ct.TimesTriggered);
  
        System.assertEquals('2022-09-23 00:00:00', String.valueOf(ct.NextFireTime));
        System.assertNotEquals('testScheduledApexFromTestMethodUpdated', [SELECT id, name FROM account WHERE Id = :newAccount.Id].name);
        Test.stopTest();
    }
}
