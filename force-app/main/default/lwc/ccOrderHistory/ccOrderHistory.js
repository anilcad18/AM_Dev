import { LightningElement, api, track, wire } from 'lwc';
import getOrderDetails from '@salesforce/apex/CcOrderHistory.getOrderDetails';

const orderCol = [
    { type: 'button', initialWidth: 130, typeAttributes: {label: 'More Details', name: 'More_Details', title: 'More Details'}},
    { label: 'Order No', fieldName: 'order_no', type: 'text', initialWidth: 100, sortable: true},
    { label: 'Created Date', fieldName: 'creation_date', type: 'text', sortable: true},
    { label: 'Site', fieldName: 'site_id', type: 'text', initialWidth: 80, sortable: true},
    { label: 'Status', fieldName: 'status', type: 'text', initialWidth: 100, sortable: true},
    { label: 'Shipping Status', fieldName: 'shipping_status', type: 'text', initialWidth: 150, sortable: true},
    { label: 'Total', fieldName: 'order_total', type: 'text', initialWidth: 100, sortable: true}
];
const productCol = [
    { label: 'Product Id', fieldName: 'product_id', type: 'text', initialWidth: 180},
    { label: 'Product Name', fieldName: 'product_name', type: 'text'},
    { label: 'Unit Price', fieldName: 'base_price', type: 'text', initialWidth: 100, cellAttributes: { alignment: 'right' }},
    { label: 'Quantity', fieldName: 'quantity', type: 'text', initialWidth: 100, cellAttributes: { alignment: 'center' }},
    { label: 'Total Price', fieldName: 'price', type: 'text', initialWidth: 120, cellAttributes: { alignment: 'right' }},
    { label: 'Total Price After Discount', fieldName: 'price_after_order_discount', type: 'text', initialWidth: 200, cellAttributes: { alignment: 'right' }}
];
export default class CcOrderHistory extends LightningElement {
    @api recordId;
    @track errMsg = '';
    @track caseView;
    @track shipmentAddress;
    @track paymentInstruments;
    @track orderList;
    @track productList;
    @track orderColumns = orderCol;
    @track productColumns = productCol;
    @track showModal = false;
    @track loading = true;

    @wire(getOrderDetails, { caseId : '$recordId'}) 
    processCcOrderHistory(result) { 

        if(result.data){
            let ccCaseOb = result.data;
            if (ccCaseOb.hasOwnProperty('orderList') && ccCaseOb.orderList.length > 0) {
                this.orderList = ccCaseOb.orderList;
                this.errMsg = undefined;
            } else if (ccCaseOb.msg) {
                this.errMsg = ccCaseOb.msg;
                this.orderList = undefined;
            }
            this.loading = false;
        } else if (result.error) {
            this.errMsg = result.error;
            this.orderList = undefined;
            this.loading = false;
        }
    }

    onClickOrdersToSort(event) {
        let fieldName = event.detail.fieldName;
        let sortDirection = event.detail.sortDirection;
        this.sortedBy = fieldName;
        this.sortedDirection = sortDirection;
        this.orderList = this.sortData(fieldName, sortDirection, this.orderList);
        this.orderList = JSON.parse(JSON.stringify(this.orderList));
    }

    sortData(fieldName, sortDirection, dataList) {
        let dataToSort = dataList;
        let reverse = sortDirection !== 'asc';
        dataToSort = JSON.parse(JSON.stringify(dataToSort));
        dataToSort.sort(this.sortBy(fieldName, reverse));
        return dataToSort;
    }

    sortBy(field, reverse, primer) {
        let key = primer ? function(x) { return primer(x[field]) } :
        function(x) { return x[field] };
        reverse = !reverse ? 1 : -1;
        return function (a, b) {
            return a = key(a),
            b = key(b),
            reverse * ((a > b) - (b > a));
        }
    }

    doSelectedRow(event) {
//        let selectedRow = this.template.querySelector('lightning-datatable').getSelectedRows();
        this.caseView = event.detail.row;
        this.productList = event.detail.row.product_items;

        if (event.detail.row.shipments && event.detail.row.shipments.length > 0) {
            this.shipmentAddress = event.detail.row.shipments[0];
        }
        if (event.detail.row.payment_instruments && event.detail.row.payment_instruments.length > 0) {
            this.paymentInstruments = event.detail.row.payment_instruments[0];
        }
        this.showModal = true;
    }

    doCloseModal() {
        this.showModal = false;
    }
}