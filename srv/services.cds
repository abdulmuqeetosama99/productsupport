using { sap.yash.productsupport as ps } from '../db/schema';

service SupportService {
    
    // Customer Message
    entity CustomerMessages as projection on ps.CustomerMessage {
        customerMessageID,
        customer,
        product.Name as product,
        originatingCountry,
        fullMessageCustomer
    };

    // Categories
    entity Categories as projection on ps.Category {
        ID,
        Name
        // Products.ID as Products 
    };

    
    entity Products as projection on ps.Product {
        ID,
        Name,
        Description,
        ReleaseDate,
        DiscontinuedDate,
        Rating,
        Price,
        Categories,
        Supplier
    };

    // Product Details
    entity ProductDetails as projection on ps.ProductDetail {
        ID,
        Product,
        DetailDescription,
        Specifications
    };

    // Suppliers
    entity Suppliers as projection on ps.Supplier {
        ID,
        Name,
        Address,
        Location,
        Concurrency
        // ,
        // Products {
        //     product,
        //     quantity
        // }
    };

    // Addresses
    entity Addresses as projection on ps.CT_Address {
        ID,
        Street,
        City,
        State,
        ZipCode,
        Country
    };

    // Customers
    entity Customers as projection on ps.Customer {
        ID,
        TotalExpense
    };

    // Employees
    entity Employees as projection on ps.Employee {
        ID,
        EmployeeID,
        HireDate,
        Salary
    };

    // Featured Products
    entity FeaturedProducts as projection on ps.FeaturedProduct {
        ID,
        Product,
        Advertisement
    };

    // Advertisements
    entity Advertisements as projection on ps.Advertisement {
        ID,
        Title,
        Content,
        StartDate,
        EndDate
    };

    // Persons
    entity Persons as projection on ps.Person {
        ID,
        FirstName,
        LastName,
        Email
    };

    // Person Details
    entity PersonDetails as projection on ps.PersonDetail {
        ID,
        PhoneNumber,
        Age,
        Address,
        DateOfBirth,
        Person
    };

    // Orders
    entity Orders as projection on ps.Order {
        ID,
        Customer,
        OrderDate,
        TotalAmount
    };
}
