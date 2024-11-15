namespace sap.yash.productsupport;

entity CustomerMessage {
    key customerMessageID   : Integer;
        customerID          : Association to Customer;
        productID           : Association to Product;
        originatingCountry  : String;
        fullMessageCustomer : String @mandatory;
}

entity Category {
    key ID       : Integer;
        Name     : String(40);
        Products : Composition of many {
                       product  : Association to Product;
                       quantity : Integer;
                   };
}

entity Product {
    key ID               : Integer;
        Name             : String(40);
        Description      : String(255);
        ReleaseDate      : Date;
        DiscontinuedDate : Date;
        Rating           : Integer;
        Price            : Decimal;
        Categories       : Association to Category;
        Supplier         : Association to Supplier;
}


entity ProductDetail {
    key ID                : Integer;
        Product           : Association to one Product;
        DetailDescription : String(255);
        Specifications    : String(255);
}

entity Supplier {
    key ID          : Integer;
        Name        : String(40);
        Address     : Association to CT_Address;
        Location    : String(40);
        Concurrency : Integer;
        Products    : Composition of many {
                          product  : Association to Product;
                          quantity : Integer;
                      };
}

entity CT_Address {
    ID      : Integer;
    Street  : String(40);
    City    : String(40);
    State   : String(40);
    ZipCode : String(10);
    Country : String(40);
}

entity Customer {
    key ID           : Integer;
        TotalExpense : Decimal;
}

entity Employee {
    key ID         : Integer;
        EmployeeID : Integer;
        HireDate   : Date;
        Salary     : Decimal;
}

entity FeaturedProduct {
    key ID            : Integer;
        Product       : Association to Product;
        Advertisement : Association to Advertisement;
}

entity Advertisement {
    key ID        : Integer;
        Title     : String(100);
        Content   : String(255);
        StartDate : Date;
        EndDate   : Date;
}

entity Person {
    key ID        : Integer;
        FirstName : String(40);
        LastName  : String(40);
        Email     : String(100);
}

entity PersonDetail {
    key ID          : Integer;
        PhoneNumber : String(15);
        Age         : Integer;
        Address     : Association to CT_Address;
        DateOfBirth : Date;
        Person      : Association to Person;
}


entity Order {
    key ID          : Integer;
        Customer    : Association to Customer;
        OrderDate   : Date;
        TotalAmount : Decimal;
        Products    : Association to Product;
}
