namespace sap.yash.productsupport;

entity CustomerMessage {
    key customerMessageID   : Integer @unique;
        customer          : Association to Customer @mandatory;
        product           : Association to Product @mandatory;
        originatingCountry  : String @validCountry; // Custom validation for country
        fullMessageCustomer : String(500) @mandatory; // Required and length validation
} 

entity Category {
    key ID       : Integer @unique;
        Name     : String(40)  @mandatory; // Required and length validation
        Products : Composition of many Product on Products.Categories  = $self;
} 

entity Product {
    key ID               : Integer @unique;
        Name             : String(40)  @mandatory; // Required and length validation
        Description      : String(255);
        ReleaseDate      : Date @assert.notFuture; // Must not be in the future
        DiscontinuedDate : Date@assert.greaterThan:ReleaseDate; // Must be after ReleaseDate if provided
        Rating           : Integer @assert.range: [1, 5]; // Rating must be between 1 and 5
        Price            : Decimal default(0.0); // Must be a positive value
        Categories       : Association to Category @mandatory;
        Supplier         : Association to Supplier @mandatory;
}

entity ProductDetail {
    key ID                : Integer @unique;
        Product           : Association to one Product @mandatory;
        DetailDescription : String(255);
        Specifications    : String(255);
}

entity Supplier {
    key ID          : Integer @unique;
        Name        : String(40) @mandatory; // Required and length validation
        Address     : Association to CT_Address @mandatory;
        Location    : String(40);
        Concurrency : Integer default(0); // Must be non-negative
        Products    : Composition of many {
                          product  : Association to Product;
                          quantity : Integer default(1); // Quantity must be positive
                      };
}

entity CT_Address {
    key ID      : Integer @unique;
        Street  : String(40)   @mandatory; // Required and length validation
        City    : String(40)  @mandatory; // Required and length validation
        State   : String(40)   @mandatory; // Required and length validation
        ZipCode : String(10)   @mandatory; // Required and length validation
        Country : String(40)  @mandatory @validCountry; // Custom validation for country
}

entity Customer {
    key ID           : Integer @unique;
        TotalExpense : Decimal default(0); // Must be non-negative
}

entity Employee {
    key ID         : Integer @unique;
        EmployeeID : Integer @unique;
        HireDate   : Date @assert.notFuture; // Must not be in the future
        Salary     : Decimal default(0); // Must be positive
}

entity FeaturedProduct {
    key ID            : Integer @unique;
        Product       : Association to Product @mandatory;
        Advertisement : Association to Advertisement @mandatory;
}

entity Advertisement {
    key ID        : Integer @unique;
        Title     : String(100)   @mandatory; // Required and length validation
        Content   : String(255);
        StartDate : Date @assert.notFuture; // Must not be in the future
        EndDate   : Date @assert.greaterThan:StartDate; // Must be after StartDate
}

entity Person {
    key ID        : Integer @unique;
        FirstName : String(40)   @mandatory; // Required and length validation
        LastName  : String(40)  @mandatory; // Required and length validation
        Email     : String(100) @mandatory @validEmail; // Required and valid email format
}

entity PersonDetail {
    key ID          : Integer @unique;
        PhoneNumber : String(15) @validPhoneNumber; // Custom validation for phone format
        Age         : Integer default(0); // Must be non-negative
        Address     : Association to CT_Address @mandatory;
        DateOfBirth : Date @assert.notFuture; // Must not be in the future
        Person      : Association to Person @mandatory;
}

entity Order {
    
    key ID            : Integer @unique;
        Customer       : Association to Customer @mandatory;
        OrderDate      : Date @assert.notFuture; // Must not be in the future
        TotalAmount    : Decimal default(0); // Must be non-negative
}