trigger ContactTrigger on Contact (after update) {
    AccountFutureClass.startBatch2();
}