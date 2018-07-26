({
    editStepTestCase : function(component, event, helper) {
        var editStepTestCase = $A.get("e.force:editRecord");          
        
        editStepTestCase.setParams({
            "recordId": component.get("v.stepTestCase.Id")
        });    	
        editStepTestCase.fire();                    
    },
    
    onDragStart : function(component, event, helper) {        
        event.dataTransfer.dropEffect = "move";
        event.dataTransfer.setData("Id", component.get('v.index'));
        
        var item = component.get('v.stepTestCase');          		       
    },
    
    allowDrop : function(component, event, helper) {
        event.preventDefault();
        event.dataTransfer.dropEffect = 'move';
    },
    
    onDrop : function(component, event, helper) {
        event.preventDefault();        
        var startInd = event.dataTransfer.getData('Id');
        var dropInd = component.get('v.index');         
        var stepEvent = component.getEvent('StepListEvent');
    	stepEvent.setParam('startIndex', startInd);
        stepEvent.setParam('dropIndex', dropInd);
        stepEvent.fire();                
    }    
    
})