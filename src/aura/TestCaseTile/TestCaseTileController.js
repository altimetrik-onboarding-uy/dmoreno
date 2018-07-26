({
    deletes : function(component, event, helper) {        
        var testCase = component.get("v.testCase");                 
        var deleteEvent = component.getEvent("deleteTestCaseEvent");                
        deleteEvent.setParams({ "testCase": testCase });    
        deleteEvent.fire();                
    },
    
    newTestCase: function(component, event, helper) {        
        var newTestCase = $A.get("e.force:createRecord");                
        newTestCase.setParams({
            "entityApiName": "Test_Case__c",
            "defaultFieldValues": {                
                'Project__c': component.get("v.testCase.Project__c")
            }
        });               
        newTestCase.fire();
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
  //      console.log("updateViewLIst");
    }
    
    
})