--create procedure
use BusDepot;
go

create procedure saveBus
@regNumber varchar(10), @mark varchar(30), @model varchar(20), @state bit, @description varchar(64)
as 
	insert into bus (regNumber, mark, model, [state], [description]) VALUES (@regNumber,@mark,@model,@state,@description)
	return 0
--drop procedure
drop procedure saveBus

declare @i int
exec @i = saveBus '12asds', '12as', '12as', '123242', true
print @i