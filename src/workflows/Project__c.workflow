<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_email_to_project_owner_upon_status_change</fullName>
        <description>Send email to project owner upon status change</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Project_status_change_notification_email</template>
    </alerts>
    <rules>
        <fullName>Project Status Change</fullName>
        <actions>
            <name>Send_email_to_project_owner_upon_status_change</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Project__c.Status__c</field>
            <operation>equals</operation>
            <value>Finished,Cancelled</value>
        </criteriaItems>
        <description>Sends email to project owner when status changes to cancelled or finished</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
