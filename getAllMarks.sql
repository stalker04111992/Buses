--create procedure
create procedure getAllMarks
as
	select b.mark from bus b;
--drop procedure
drop procedure getAllMarks