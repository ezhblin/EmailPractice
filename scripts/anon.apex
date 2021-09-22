
String search = '%' + 'practice' + '%';
System.debug('THIS ==> ' + [SELECT Id, Name FROM EmailTemplate WHERE Name LIKE: search]);


List<SObject> newRecords = new List<SObject>();
for (String sObjectName : new List<String>{'Contact', 'Account', 'Case'}) {
    newRecords.addAll(Database.query('SELECT Id FROM ' + sObjectName + ' WHERE DAY_ONLY(CreatedDate) = TODAY'));
}
System.debug('THIS ==> ' + newRecords);