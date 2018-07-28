({
    deletes : function(component, event, helper) {        
        var testCase = component.get("v.testCase");                 
        var deleteEvent = component.getEvent("deleteTestCaseEvent");                
        deleteEvent.setParams({ "testCase": testCase });    
        deleteEvent.fire();                
    },    
    
    editTestCase : function(component, event, helper) {
        var editTestCase = $A.get("e.force:editRecord");  
        //var editSave = $A.get("e.force:recordSaveSuccess");
        
        editTestCase.setParams({
            "recordId": component.get("v.testCase.Id")
        });    	
        editTestCase.fire();            
        //editSave.fire();
    },
    
    updateViewList:  function(component, event, helper){
        var updateView = component.getEvent("updateTestCaseViewEvent");   
        updateView.setParams({
            "message": "Update the TestCaseViewLIst"
        });
        updateView.fire();
    }
    
    
})