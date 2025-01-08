public class FailingBatch implements Database.Batchable<SObject> {
    
    // Start method to define the records to process
    public Database.QueryLocator start(Database.BatchableContext BC) {
        // This example fetches Accounts, but can be any SObject
        return Database.getQueryLocator([SELECT Id FROM Account LIMIT 10]);
    }

    // Execute method where the failure occurs
    public void execute(Database.BatchableContext BC, List<SObject> scope) {
        // Intentionally throw an exception to simulate failure
        throw new CustomException('This is a deliberate failure for testing purposes.');
    }

    // Finish method to perform any final actions after processing
    public void finish(Database.BatchableContext BC) {
        // Optional: Log the completion or cleanup
        System.debug('Batch processing has finished.');
    }
    
    // Custom exception class
    public class CustomException extends Exception {}
}