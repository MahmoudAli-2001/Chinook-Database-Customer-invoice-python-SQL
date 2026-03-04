create database customer

select * from Customer
select * from Invoice
select * from InvoiceLine

--1. Retrieve all records from the Customer table.
select * from Customer


--2. Retrieve all invoices for a specific customer.
select *from Invoice
where CustomerID = 20


--3. List all invoice lines along with their corresponding invoice and customer information.
select Invoice.InvoiceId ,Invoice.Total ,Invoice.InvoiceDate,Customer.CustomerId,Customer.FirstName,Customer.LastName
from Customer
join Invoice
on Invoice.CustomerId = Customer.CustomerId
 
--4. Calculate total invoice amount per customer.
select Customer.CustomerId,Customer.FirstName,Customer.LastName , sum(Invoice.Total) as total_invoice from Customer
join Invoice
on  Customer.CustomerId = Invoice.CustomerId
group by Customer.CustomerId,Customer.FirstName,Customer.LastName

--5. Retrieve the top 5 customers by total spending.
select top(5) Customer.CustomerId,Customer.FirstName,Customer.LastName , sum(Invoice.Total) as total_invoice from Customer
join Invoice
on  Customer.CustomerId = Invoice.CustomerId
group by Customer.CustomerId,Customer.FirstName,Customer.LastName
order by total_invoice desc

--6. Count the number of invoices per customer.
select CustomerId,count(InvoiceID) as invoices_number from Invoice
group by CustomerId
order by invoices_number desc

--7. Calculate total quantity of tracks sold per invoice.
select InvoiceID,TrackId ,sum(Quantity) as total_quantity from InvoiceLine
group by  InvoiceID , TrackId

--8. Retrieve all invoices where the total amount exceeds $50.
select * from Invoice
where Total > 50

--9. Identify the customer who purchased the most tracks overall.
select Customer.CustomerId , sum(InvoiceLine.Quantity) from Customer
join Invoice
on Customer.CustomerId = Invoice.CustomerId
join InvoiceLine
on Invoice.Invoiceid = InvoiceLine.Invoiceid
group by Customer.CustomerId
order by sum(Invoice.Total) desc

--10. List all invoices along with the number of items in each invoice.
SELECT Invoice.InvoiceID,COUNT(InvoiceLine.InvoicelineID) AS number_of_items FROM invoice 
JOIN InvoiceLine 
on Invoice.InvoiceID = InvoiceLine.InvoiceID
group by Invoice.InvoiceID