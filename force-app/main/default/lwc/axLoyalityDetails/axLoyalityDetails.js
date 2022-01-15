import { LightningElement, api, track, wire } from 'lwc';
import getAxLoyalityDetails from '@salesforce/apex/AxLoyalityDetails.getLoyalityDetails';

const cardCol = [
    { label: 'Card Id', fieldName: 'cardId', type: 'text', sortable: true},
    { label: 'Active', fieldName: 'active', type: 'text', initialWidth: 100, sortable: true},
    { label: 'Activated At Store', fieldName: 'activatedAtStore', type: 'text', sortable: true},
];
const programCol = [
    { label: 'Program Id', fieldName: 'programId', type: 'text', sortable: true},
    { label: 'Status', fieldName: 'status', type: 'text', sortable: true},
    { label: 'Start Date', fieldName: 'startDate', type: 'text', sortable: true},
    { label: 'End Date', fieldName: 'endDate', type: 'text', sortable: true},
];
const offerCol = [
    { label: 'Offer Id', fieldName: 'offerId', type: 'text', initialWidth: 150, sortable: true},
    { label: 'Status', fieldName: 'redeemed', type: 'text', initialWidth: 120, sortable: true},
    { label: 'Description English', fieldName: 'descriptionEn', type: 'text', sortable: true},
    { label: 'Description French', fieldName: 'descriptionFr', type: 'text', sortable: true},
    { label: 'Start Date', fieldName: 'startDate', type: 'text', initialWidth: 100, sortable: true},
    { label: 'End Date', fieldName: 'endDate', type: 'text', initialWidth: 100, sortable: true},
];

export default class AxLoyalityDetails extends LightningElement {
    @api recordId;
    @track errMsg;
    @track cardList;
    @track offerList;
    @track programList;
    @track sortedBy;
    @track sortedDirection;
    @track cardColumns = cardCol;
    @track offerColumns = offerCol;
    @track programColumns = programCol;
    @track loading = true;

    @wire(getAxLoyalityDetails, { caseId : '$recordId'})
    processAxLoyalityDetails(result) {
        if (result.data) {
            if (result.data.hasOwnProperty('cards') && result.data.cards.length > 0) {
               this.cardList = result.data.cards;
            }
            if (result.data.hasOwnProperty('offers') && result.data.offers.length > 0) {
                this.offerList = result.data.offers;
            }
            if (result.data.hasOwnProperty('programs') && result.data.programs.length > 0) {
                this.programList = result.data.programs;
            }
            this.errMsg = result.data.msg;
            this.loading = false;
        } else if (result.error) {
            this.errMsg = result.error;
            this.cards = undefined;
            this.orderList = undefined;
            this.programs = undefined;
            this.loading = false;
        }
    }

    onClickCardsToSort(event) {
        let fieldName = event.detail.fieldName;
        let sortDirection = event.detail.sortDirection;
        this.sortedBy = fieldName;
        this.sortedDirection = sortDirection;
        this.cardList = this.sortData(fieldName, sortDirection, this.cardList);
        this.cardList = JSON.parse(JSON.stringify(this.cardList));
    }

    onClickOffersToSort(event) {
        let fieldName = event.detail.fieldName;
        let sortDirection = event.detail.sortDirection;
        this.sortedBy = fieldName;
        this.sortedDirection = sortDirection;
        this.offerList = this.sortData(fieldName, sortDirection, this.offerList);
        this.offerList = JSON.parse(JSON.stringify(this.offerList));
    }

    onClickProgramsToSort(event) {
        let fieldName = event.detail.fieldName;
        let sortDirection = event.detail.sortDirection;
        this.sortedBy = fieldName;
        this.sortedDirection = sortDirection;
        this.programList = this.sortData(fieldName, sortDirection, this.programList);
        this.programList = JSON.parse(JSON.stringify(this.programList));
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
}