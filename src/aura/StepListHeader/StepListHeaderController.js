({
    CreateNewStepTestCase : function(component, event, helper) {
        var newStep = component.getEvent("CreateNewStepTestCase");   
        newStep.setParams({
            "message": "Create New Step"
        });
        newStep.fire();                
    }
})