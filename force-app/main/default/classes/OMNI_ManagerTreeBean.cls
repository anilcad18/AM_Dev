/**
 * @description Bean Class to process Manager Tree Payload Response.
 * @author      Anil Mannem
 * @date        20-Jan-2021
 */
global class OMNI_ManagerTreeBean{
    global String trackingNumber {get; set;}
    global String requestTime {get; set;}
    global String processingTime {get; set;}
    global List<EmployeeManagerTree> employeeManagerTree {get; set;}

    global class EmployeeManagerTree{
        global String employeeID {get; set;}
        global String supervisorID {get; set;}
    }
}