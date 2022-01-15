trigger MaintenanceRequest on Case (before update, after update) {
    if(Trigger.isUpdate){
        MaintenanceRequestHelper.updateWorkOrders(Trigger.New);
    }
}