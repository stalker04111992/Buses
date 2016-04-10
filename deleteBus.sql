--create procedure
use BusDepot;
go

create procedure deleteBus
@id int
as 
	delete bus 
		where id = @id;
	return 0
--drop procedure
drop procedure deleteBus

declare @i int
exec @i = deleteBus 0
print @i