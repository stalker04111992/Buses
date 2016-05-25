use Straeto;
go

---------------------------------------------------
--выбрать сотрудника по id
create procedure findById
@id int
as
	select D.* from driver D where D.id = @id;
	select G.* from graph G where G.driverId = @id and G.date >= GETDATE();

--удалить процедуру
drop procedure findById

---------------------------------------------------
go

--выбрать свободного сотрудника по id
create procedure findFreeById
@id int
as
	select D.* from driver D where D.id = @id and not exists(select G.driverId from graph G where D.id = G.driverId);
--удалить процедуру
drop procedure findFreeById

---------------------------------------------------

go
--поиск по фамилии
create procedure findByLastName
@lastName varchar(50)
as 
	select D.* from driver D where D.lastName = @lastName;
	
go
--удалить процедуру
drop procedure findByLastName
---------------------------------------------------
go
--поиск по фамилии
create procedure findFreeByLastName
@lastName varchar(50)
as 
	select D.* from driver D where D.lastName = @lastName and not exists(select G.driverId from graph G where D.id = G.driverId); 
	
go
--удалить процедуру
drop procedure findFreeByLastName
---------------------------------------------------

go
--удаление сотрудника из базы
create procedure deleteDriver
@id int
as 
	delete driver 
		where id = @id;
	return 0
--удалить процедуру
drop procedure deleteDriver

--------------------------------------------------------

go
--добавить автобус в базу
create procedure saveDriver
@lastName varchar(50), @firstName varchar(50), @driverClass int, @licenseNumber varchar(10)
as 
	insert into driver(lastName, firstName, driverClass, licenseNumber) VALUES (@lastName, @firstName, @driverClass, @licenseNumber)
	return 0
--удалить процедуру
drop procedure saveDriver

---------------------------------------------------------

go
--изменить данные об автобусе
create procedure updateDriver
@id int, @lastName varchar(50), @firstName varchar(50), @driverClass int, @licenseNumber varchar(10)
as 
	update driver
	set lastName = @lastName, firstName = @firstName, driverClass = @driverClass, licenseNumber = @licenseNumber where id = @id
	return 0
--drop procedure
drop procedure updateDriver

----------------------------------------------------------

go
--выбрать все автобусы
create procedure getAllDrivers
as
	select * from driver;

--удалить процедуру
drop procedure getAllDrivers

----------------------------------------------------------

go
--выбрать всех водителей
create procedure getFreeAllDrivers
as
	select D.* from driver D where not exists(select G.driverId from graph G where G.driverId = D.id);
--удалить процедуру
drop procedure getFreeAllDrivers

----------------------------------------------------------

go


create procedure findToday
@date Date, @shift int
as
	select D.* from driver D join graph G on D.id = G.driverId and G.[date] = @date and G.[shift] = @shift;
--удалить процедуру
drop procedure findToday


create procedure findGraphToday
@date Date, @shift int
as
	select G.* from graph G where G.[date] = @date and DATEDIFF(day, GETDATE(),@date) >= 0 and G.[shift] = @shift;
--удалить процедуру
drop procedure findGraphToday

create procedure addShift
@driverId int, @startDate Date, @shift int
as begin

	if ((select count(*) from graph where @driverId = driverId and @startDate = [date]) = 0 and DATEDIFF(day, GETDATE(), @startDate) > 0)
	begin
		insert into graph(driverId, [date], [shift]) values(@driverId, @startDate, @shift);
	end
end

drop procedure addShift

create procedure deleteGraphic
@id int 
as begin
	delete graph
		where driverId = @id;
end

create procedure selectGraph
@driverId int
as begin
	select G.* from graph G where G.driverId = @driverId and abs(DATEDIFF(day, GETDATE(),[date])) >= 0 order by G.[date];
end

drop procedure selectGraph

create procedure selectMonth
@driverId int, @month int
as begin
	select G.* from graph G where G.driverId = @driverId and @month = MONTH(G.[date]) and abs(DATEDIFF(day, GETDATE(),G.[date])) >= 0 order by [date];
end

drop procedure selectMonth
go

create procedure selectGraphFull
@driverId int
as begin
	select G.* from graph G where G.driverId = @driverId and Month(G.[date]) = MONTH(G.[date]) order by [date];
end

drop procedure selectGraphFull

go

create procedure selectMonth
@driverId int, @month int
as begin
	select G.* from graph G where G.driverId = @driverId and @month = MONTH(G.[date]) and abs(DATEDIFF(day, GETDATE(),G.[date])) >= 0 order by [date];
end

drop procedure selectMonth

go

create procedure findGraphByNumber
@number int
as begin
	select G.* from graph G where G.id = @number;
end

go

create procedure deleteGraph
@number int
as begin
	delete graph
		where id = @number and [date] >= GETDATE();
end

drop procedure deleteGraph