set serveroutput on;

declare

    bg DONOR.Dbloodgroup%TYPE := '&BloodGroup';
	res number;
	
begin

	res := countBagNums(bg);
	dbms_output.put_line('Total bags of blood group ' ||bg|| ' = '||res);
	
end;
/
create or replace function countBagNums(matchBloodGroup DONOR.Dbloodgroup%TYPE)
  return number
  is
  
  totalBags number;

begin
	
	 select count(bagnumber) into totalBags from BLOOD_INVENTORY
	 where DID in ( select DID from DONOR where Dbloodgroup = matchBloodGroup);
	 
	return totalBags;

end countBagNums;
/
