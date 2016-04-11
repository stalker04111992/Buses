--функции работы с автобусами
use BusDepot;
go;

---------------------------------------------------
--выбрать автобус по id
create procedure findByNumber
@number int
as
	select b.* from bus b where b.id = @number;
--удалить процедуру
drop procedure findByNumber

---------------------------------------------------
go
--поиск по регистрационному номеру
create procedure findByRegNumber
@regNumber varchar(10)
as 
	select * from bus b where b.regNumber = @regNumber
	
go
--удалить процедуру
drop procedure findByRegNumber
---------------------------------------------------

go
--выбрать автобусы определенной марки
create procedure findByMark
@mark varchar(30)
as 
	select * from bus b where b.mark = @mark
	
go
--удалить процедуру
drop procedure findByMark

-----------------------------------------------------

go
--выборка автобусов по модели
create procedure findByModel
@model varchar(30)
as 
	select * from bus b where b.mark = @model
	
go
--удалить процедуру
drop procedure findByModel

-------------------------------------------------------

go
--удаление автобуса из базы
create procedure deleteBus
@id int
as 
	delete bus 
		where id = @id;
	return 0
--удалить процедуру
drop procedure deleteBus

--------------------------------------------------------

go
--добавить автобус в базу
create procedure saveBus
@regNumber varchar(10), @mark varchar(30), @model varchar(20), @state bit, @description varchar(64)
as 
	insert into bus (regNumber, mark, model, [state], [description]) VALUES (@regNumber,@mark,@model,@state,@description)
	return 0
--удалить процедуру
drop procedure saveBus

---------------------------------------------------------

go
--изменить данные об автобусе
create procedure updateBus
@id int, @regNumber varchar(10), @mark varchar(30), @model varchar(20), @state bit, @description varchar(64)
as 
	update bus
	set regNumber = @regNumber, mark = @mark, model = @model, [state] = @state, [description] = @description where id = @id
	return 0
--drop procedure
drop procedure updateBus

----------------------------------------------------------

go
--выбрать все автобусы
create procedure getAllBuses
as
	select * from bus;
--удалить процедуру
drop procedure getAllBuses

----------------------------------------------------------

go
--выбрать все марки автобусов
create procedure getAllMarks
as
	select b.mark from bus b;
--удалить процедуру
drop procedure getAllMarks

-----------------------------------------------------------

go
--выбрать все id
create procedure getAllNumbers
as
	select b.id from bus b order by b.id;
--удалить процедуру
drop procedure getAllNumbers