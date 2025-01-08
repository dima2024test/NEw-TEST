public class AccountFutureClass {
    
    @Future
    public static void startBatch() {
        //Database.executeBatch(new BatchWithFail(), 1);
    }
    
    public static void startBatch2() {
        System.enqueueJob(new AsyncStartBatch());
    }
    
    public static void startBatch3() {
        System.enqueueJob(new AsyncStartBatch());
    }
    
    public class AsyncStartBatch implements Queueable, Database.AllowsCallouts {
        
        public AsyncStartBatch() {}
        
        public void execute(QueueableContext context) {
            integer i = 10/0;
            //Database.executeBatch(new BatchWithFail(), 1);
        }
    }
}