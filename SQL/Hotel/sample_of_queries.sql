select *
from employee 
where E_DOB>1980;

select DISTINCT EMP_ID, FNAME||' '|| LNAME "Name", SALARY "month_Salary_Before", 12* (SALARY+100) "annual_Salary After"
from employee;
select CUST_SSN,concat(FNAME, LNAME) "Name", CUST_ADDRESS, instr (FNAME, 'a') "a in name"
from customer;

select *
from employee 
where E_DOB >= 1980
order by E_DOB DESC;

select EMP_ID, FNAME, SALARY, DEP_ID from employee
where SALARY between 3000 and 4000;


select *
from invoice
where lower (PAY_METHOD) = 'cash' 
and INVOICE_COST >= 1000;

select *
from employee
where FNAME like '%n%'
and EMP_ID in (602,603,610);

SELECT e.emp_id e.fname,st.email
FROM Staff account st
JOIN employee e on st.emp id = e.emp id;

SELECT c.cust ssn,c.fnamellc.1name AS name, r.rating*20|| '%' AS "rate percent"
FROM report r
JOIN customer c
ON r.cust ssn = c.cust ssn;

CREATE INDEX invoice_cost_idx
ON invoice (invoice cost);

SELECT c.fname ||' '|| c.lname AS "CUSTOMER NAME",i.invoice date,i.invoice cost
FROM Customer c
JOIN INVOICE i 
On c.PAY_ID = I.PAY_ID 
ORDED BY 3 DESC
