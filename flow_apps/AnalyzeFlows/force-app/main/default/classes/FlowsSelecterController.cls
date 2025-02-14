public with sharing class FlowsSelecterController {
    @AuraEnabled
    public static List<FlowVersionView> getFlowVersions(String flowAPIName){
        try {
            List<FlowVersionView> flowVersionViewList = [
            SELECT  Id, 
                    Label, 
                    FlowDefinitionViewId, 
                    Description, 
                    Status, 
                    VersionNumber, 
                    ProcessType, 
                    IsTemplate, 
                    RunInMode, 
                    LastModifiedDate, 
                    IsSwingFlow, 
                    ApiVersion, 
                    ApiVersionRuntime 
            FROM    FlowVersionView WHERE FlowDefinitionView.APIName = :flowAPIName
            ORDER BY VersionNumber];
            
            return flowVersionViewList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
