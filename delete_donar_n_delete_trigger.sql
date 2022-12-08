clear screen;

set serveroutput on;
set verify off;

declare

	id DONOR.DID%TYPE := '&DonorID';
	
begin
	
	delete from DONOR where DID=id;
	dbms_output.put_line('data deleted from blood_inventory');
end;
/


create or replace trigger trigDonorDelete
after delete on DONOR
for each row

declare

	id1 DONOR.DID%TYPE := :old.DID;
	
begin

	delete from RECIPIENT where DID=id1;
	delete from BLOOD_INVENTORY where DID=id1;
	delete from DONATION_DETAILS where DID=id1;

end;
/