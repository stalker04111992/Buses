use BusDepot;
go
--create procedure findResultSetByRegNumber
create procedure findByRegNumber
@regNumber varchar(10)
as 
	select * from bus b where b.regNumber = @regNumber
	
go
--drop procedure
drop procedure findByRegNumber


exec findByRegNumber '23efd'