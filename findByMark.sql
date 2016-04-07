--
use BusDepot;
go
--create procedure findResultSetByMark
create procedure findByMark
@mark varchar(30)
as 
	select * from bus b where b.mark = @mark
	
go
--drop procedure
drop procedure findByMark


exec findByMark '123'