use BusDepot;

go
--добавить вакансию в базу
create procedure saveVacancy
@title varchar(50), @salary float, @count int, @description varchar(256)
as 
	insert into vacancy (title, salary, [count], description) VALUES (@title, @salary, @count, @description)
	return 0
--удалить процедуру
drop procedure saveVacancy

----------------------------------------------

go
--все вакансии
create procedure getAllVacancies
as 
	select V.* from vacancy V;
--удалить процедуру
drop procedure getAllVacancies

----------------------------------------------

go
--все вакансии
create procedure findVacancyByNumber
@number int
as 
	select V.* from vacancy V where V.id = @number;
--удалить процедуру
drop procedure findVacancyByNumber

----------------------------------------------

go
--все вакансии
create procedure findVacancyByCount
@count int
as 
	select V.* from vacancy V where V.[count] >= @count;
--удалить процедуру
drop procedure findVacancyByCount

-------------------------------------------------------

go
--удаление вакансии из базы
create procedure deleteVacancy
@id int
as 
	delete vacancy 
		where id = @id;
	return 0
--удалить процедуру
drop procedure deleteVacancy

--------------------------------------------------------

go
--изменить данные о вакансии
create procedure updateVacancy
@id int, @title varchar(50), @salary float, @count int, @description varchar(256)
as 
	update vacancy
	set title = @title, salary = @salary, [count] = @count, [description] = @description where id = @id
	return 0
--drop procedure
drop procedure updateVacancy

----------------------------------------------------------