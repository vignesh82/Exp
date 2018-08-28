trigger ContactTrigger on Contact (after INSERT, after DELETE ,After undelete ){
	
    ContactTriggerHandler handler = new ContactTriggerHandler();
    
    if(Trigger.isInsert || Trigger.IsUndelete){
        handler.onAfterInsert(trigger.new,Trigger.oldMap,Trigger.newMap );
    }
    
    if(Trigger.isDelete){
         handler.onAfterUpdateDelete(trigger.new,Trigger.oldMap,Trigger.newMap );
    }
}