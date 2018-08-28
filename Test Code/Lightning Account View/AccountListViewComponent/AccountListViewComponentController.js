({
	doInit: function(component, event, helper) {
        console.log('in');
        var action = component.get("c.getAccountlist");
        action.setCallback(this, function(response) {
            if(response.getReturnValue().length > 0){
                console.log(response.getReturnValue());
                console.log('in1');
                component.set("v.accList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action); 
    },
    
    save: function(component, event, helper) {
        
        var action = component.get("c.saveAccList");
        action.setParams({
            accList : component.get("v.accList")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();                
	        if (state == "SUCCESS") { 
            	
                alert('Record saved successfully');
                
            }else {
                var errorMsg = action.getError()[0].message;
                
                alert(errorMsg);
                
            }
            
        });
        $A.enqueueAction(action); 
        //
    },
    closeWindow : function(component,event){
        var urlEvent = $A.get("e.force:navigateToURL");
        if(urlEvent) {
            urlEvent.setParams({
                "url": "/" + component.get("v.recordId")
            });
            urlEvent.fire();
        } 
    },
})