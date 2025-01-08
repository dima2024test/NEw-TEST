global class AccountUpdateBatchJobNew1 implements Database.Batchable<sObject> 
{    
    global Database.QueryLocator start(Database.BatchableContext BC)     {
         // collect the batches of records or objects to be passed to execute         
        String query = 'SELECT Id,Name FROM Account limit 10'  ;         
        return Database.getQueryLocator(query);       
    }
     
    global void execute(Database.BatchableContext BC, List<Account> scope) {
        List<Account> accList = new List<Account>();
        // process each batch of records
          for (integer i=0;i<1000;i++)
                {
        Account anew= new Account(Name ='theanu'+i,BillingCity='SA port'+i,Phone='1212'+i);
        accList.add(anew);         
            
               }
         
        try {
            // Update the Account Record
            insert accList;
            
         
         
        } catch(Exception e) {
            System.debug(1/0);
        }
         
    }        
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations
        AccountUpdateBatchJobNew batchObj = new AccountUpdateBatchJobNew();
Id batchId = Database.executeBatch(batchObj, 100);

       
  }
}