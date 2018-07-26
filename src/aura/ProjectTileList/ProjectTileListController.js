({
    doInit : function(component, event, helper) {
        
        var action = component.get("c.getProjects");     
        
        action.setCallback(this, function(data){
            component.set("v.projectList",data.getReturnValue());
        });       
        
        $A.enqueueAction(action);
        
    }
})