use BusDepot;
go

create procedure updateBus
@id int, @regNumber varchar(10), @mark varchar(30), @model varchar(20), @state bit, @description varchar(64)
as 
	update bus
	set regNumber = @regNumber, mark = @mark, model = @model, [state] = @state, [description] = @description where id = @id
	return 0
--drop procedure
drop procedure updateBus

declare @i int
exec @i = updateBus 19, '124fd', '12as', '12as', true, '123242'
print @i