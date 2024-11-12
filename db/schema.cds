namespace sap.yash.productsupport;
// sap.yash.productsupport-CustomerMessage
entity CustomerMessage  {
    key customerMessageID : Integer @mandatory;
    customerName : String;
    productName : String;
    customerID: String;
    productID: String;
    originatingCountry: String;
    fullMessageCustomer: String;
}

//productsupport-dev