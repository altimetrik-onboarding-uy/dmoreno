({
	doInit : function(component, event, helper) {       
        var action = component.get("c.GetRelatedSteps");       
        var testCaseIdFrontEnd = component.get("v.recordId");        
        action.setParams({testCaseId: testCaseIdFrontEnd});
        
        action.setCallback(this, function(data){
            
            component.set("v.StepTestCaseList",data.getReturnValue());
            
        });       
        
        $A.enqueueAction(action);        
    },       
    
      CreateNewStep: function(component, event, helper) {            
        var testCaseIdFrontEnd = component.get("v.recordId");
        var newStep = $A.get("e.force:createRecord");                
        newStep.setParams({
            "entityApiName": "Test_Case_Step__c",
            "defaultFieldValues": {                
                'Test_Case__c': testCaseIdFrontEnd
            }
        });               
        newStep.fire();
    },
    
     onDrop : function(component, event, helper) {
    	event.preventDefault();        
        var startIndex = event.getParam('startIndex');
        var dropIndex = event.getParam('dropIndex');                 
        var steps = component.get("v.StepTestCaseList");
        var step = steps[startIndex];
        if(/*dropIndex != '' &&*/ dropIndex != 'undefined' && startIndex != dropIndex){
        steps.splice(startIndex, 1);
        steps.splice(dropIndex, 0, step);        
        component.set("v.StepTestCaseList", steps);
        var action = component.get("c.SetIndexInStep");
        action.setParams({stepList :steps});
        $A.enqueueAction(action);   
        }       
    }  
})