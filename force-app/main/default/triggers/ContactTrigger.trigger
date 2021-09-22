trigger ContactTrigger on Contact (after insert) {
    ContactTriggerHandler.sendWelcom(Trigger.new);
}