trigger repAccountUpdate on Account (before insert) {

    List<Account> acc = [SELECT Account.Type FROM Account WHERE Name = 'Test' ];

    System.enqueuejob(new UpdateAccountTrigger(acc));

}