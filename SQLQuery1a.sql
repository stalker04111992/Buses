
create procedure test
as
begin
	Return 0;
end
go

create procedure addNewPersonnel
@depId int, @lastName nvarchar(50), @firstname nvarchar(50), @patronymic nvarchar(50),
@telephone nvarchar(15), @post nvarchar(30), @salary float, @raiting int, @setter int output
as
begin
	print 'ZiL krut'
	--создание временной таблицы
	create table #current (id int not null, countPersonnels int not null);
	--заполенение данными о проектах
	insert into #current
		select projectId, count(*) from active group by projectId;

		select * from #current
	--поиск id проекта с наименьшем числом сотрудников
	declare @minProj int;
	select @minProj = C.id from #current C where (select min(countPersonnels) from #current) = C.countPersonnels ; 
	print @minProj

	declare @userId int;
	(select @userId = E.id from employee E where E.lastName = @lastName and E.firstName = @firstname and E.patronymic = @patronymic)
	print @userId;

	insert into employee values(@depId, @lastName, @firstname, @patronymic, @telephone, @post, @salary, @raiting)

	insert into active
		values(@minProj, @userId) 

	update employee
		set raiting = (select count(*) from active A where A.emploeeId = @userId) where id = @userId

	drop table #current





	print @depId
	set @setter = 25
	Return;
end
go

declare @res int;

EXEC addNewPersonnel 1, '1', '1', '1', '1', '1', 13580000, 0, @res output
print @res

drop procedure addNewPersonnel