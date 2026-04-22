create database project_2;
use project_2;

desc branch;
alter table branch
modify branch_id varchar(10) primary key,
modify manager_id varchar(10),
modify branch_address varchar(100),
modify contact_no varchar(15);

desc books;
alter table books
modify isbn varchar(17) primary key,
modify book_title varchar(53),
modify category varchar(16),
modify rental_price	float,
modify status text,
modify author varchar(22),
modify publisher varchar(25);

desc employees;
alter table employees
modify emp_id varchar(10) primary key,
modify emp_name varchar(50),
modify position varchar(20),
modify salary int,
modify branch_id varchar (10);

desc issued_status;
alter table issued_status
modify issued_id varchar(10) primary key,
modify issued_member_id varchar(10),				-- FK
modify issued_book_name varchar(53),
modify issued_date date,
modify issued_book_isbn varchar(50),			    -- FK
modify issued_emp_id varchar(10);					-- FK

desc members;
alter table members
modify member_id varchar(10) primary key,
modify member_name varchar(25),
modify member_address varchar(100),
modify reg_date date;

desc return_status;
alter table return_status
modify return_id varchar(10) primary key,
modify issued_id varchar(10),					-- FK
modify return_book_name varchar(53),
modify return_date date,
modify return_book_isbn varchar(50);

-- implementing the Foreign Key wherever required

alter table issued_status
add constraint fk_member 
foreign key (issued_member_id)
references members(member_id);

alter table issued_status
add constraint fk_book 
foreign key (issued_book_isbn)
references books(isbn);

alter table issued_status
add constraint fk_emp 
foreign key (issued_emp_id)
references employees(emp_id);

alter table return_status
add constraint fk_issued
foreign key (issued_id)
references issued_status(issued_id);

alter table employees
add constraint fk_branch
foreign key (branch_id)
references branch(branch_id);


