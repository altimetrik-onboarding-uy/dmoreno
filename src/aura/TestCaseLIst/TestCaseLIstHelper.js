({
    deleteTestCaseHelper : function(component, testCase, callback) {    
        //Call apex method        
        var action = component.get("c.deleteTestCase");        
        var testCaseFronEnd = testCase;
        action.setParams({ "testCase" : testCaseFronEnd });        
        
        action.setCallback(this, function(response) {        
            var state = response.getState();        
            if (state === "SUCCESS") {            
                var tCases = component.get("v.TestCaseList");
                var items = [];
                for (var  i = 0; i < tCases.length; i++) {
                    if(tCases[i].Id === testCase.Id) {                    
                        tCases.splice(i, 1);                     
                    }
                }
                component.set("v.TestCaseList", tCases);               
            }
        });
        $A.enqueueAction(action);
    }
})