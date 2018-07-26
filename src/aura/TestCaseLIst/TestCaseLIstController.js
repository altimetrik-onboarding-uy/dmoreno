({
    doInit : function(component, event, helper) {       
        var action = component.get("c.getRelatedTestCases");       
        var projectIdFrontEnd = component.get("v.recordId");
        action.setParams({projectId: projectIdFrontEnd});
        
        action.setCallback(this, function(data){
            
            component.set("v.TestCaseList",data.getReturnValue());
            
        });       
        
        $A.enqueueAction(action);
        
    },
    
    deleteEvent: function(component, event, helper) {               
        var testCase = event.getParam("testCase");                       
        helper.deleteTestCaseHelper(component, testCase);        
    }
    
})