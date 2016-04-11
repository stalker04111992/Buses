use BusDepot;

go
--�������� �������� � ����
create procedure saveVacancy
@title varchar(50), @salary float, @count int, @description varchar(256)
as 
	insert into vacancy (title, salary, [count], description) VALUES (@title, @salary, @count, @description)
	return 0
--������� ���������
drop procedure saveVacancy

----------------------------------------------

go
--��� ��������
create procedure getAllVacancies
as 
	select V.* from vacancy V;
--������� ���������
drop procedure getAllVacancies

----------------------------------------------

go
--��� ��������
create procedure findVacancyByNumber
@number int
as 
	select V.* from vacancy V where V.id = @number;
--������� ���������
drop procedure findVacancyByNumber

----------------------------------------------

go
--��� ��������
create procedure findVacancyByCount
@count int
as 
	select V.* from vacancy V where V.[count] >= @count;
--������� ���������
drop procedure findVacancyByCount

-------------------------------------------------------

go
--�������� �������� �� ����
create procedure deleteVacancy
@id int
as 
	delete vacancy 
		where id = @id;
	return 0
--������� ���������
drop procedure deleteVacancy

--------------------------------------------------------

go
--�������� ������ � ��������
create procedure updateVacancy
@id int, @title varchar(50), @salary float, @count int, @description varchar(256)
as 
	update vacancy
	set title = @title, salary = @salary, [count] = @count, [description] = @description where id = @id
	return 0
--drop procedure
drop procedure updateVacancy

----------------------------------------------------------