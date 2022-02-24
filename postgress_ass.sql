-- create customer table
CREATE TABLE Customer
    (
        Customer_id VARCHAR(6) NOT NULL,
        Name VARCHAR(20) NOT NULL,
        PRIMARY KEY (Customer_id)
        
    )
	-- create product details table
create table product(
     pid varchar(6) not null,
	pname varchar(20) not null,
	primary key (pid),
	p_catagory varchar(10)
)
-- create invoice details table
create table invoice(
   inv_id varchar(10) not null,
	pid varchar(6),
	FOREIGN KEY (pid) REFERENCES product(pid),
	Customer_id VARCHAR(6),
	FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
	
)
-- inserting data into all the table
insert into Customer values('c103', 'rakesh');
select * from Customer
insert into product values('p103', 'shirt','clothing');
select * from product
insert into invoice values('i103', 'p103','c102');
select * from invoice

-- create a view for just like a dummy of invoice
create or replace view invoicedetails as
	select invoice.*, Customer.name, Customer.Customer_id from invoice
	inner join Customer
	on invoice.Customer_id = Customer.Customer_id
	And 
	select invoice.*, product.* from invoice
	inner join product
	on invoice.pid = product.pid
 
 -- create an trigger for adding into invoice  but before that create a function 
 create or replace function fn_invoice_log()
returns trigger
language PLPGSQL
as 
$$
  begin 
       
	   if new.pid <> old.pid  then 
	        insert into invoice(pid) values (old.pid);
       end if;
  
  return new;
  end;
$$
-- finally create a trigger for the same
create trigger trigger_product_add
before update
on invoice
for each row
  execute procedure fn_invoice_log();
  
  -- finally update the trigger
  select * from product;
select * from invoice;
update invoice set name = 'c104' where pid = 'p104'

