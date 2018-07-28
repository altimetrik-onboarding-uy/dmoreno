({
	 newTestCase: function(component, event, helper) {        
        var newTestCase = $A.get("e.force:createRecord");                
        newTestCase.setParams({
            "entityApiName": "Test_Case__c",
            "defaultFieldValues": {                
                'Project__c': component.get("v.recordIdh")
            }
        });                        
        newTestCase.fire();
    },
})