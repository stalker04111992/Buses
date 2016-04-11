--������� ������ � ����������
use BusDepot;
go;

---------------------------------------------------
--������� ������� �� id
create procedure findByNumber
@number int
as
	select b.* from bus b where b.id = @number;
--������� ���������
drop procedure findByNumber

---------------------------------------------------
go
--����� �� ���������������� ������
create procedure findByRegNumber
@regNumber varchar(10)
as 
	select * from bus b where b.regNumber = @regNumber
	
go
--������� ���������
drop procedure findByRegNumber
---------------------------------------------------

go
--������� �������� ������������ �����
create procedure findByMark
@mark varchar(30)
as 
	select * from bus b where b.mark = @mark
	
go
--������� ���������
drop procedure findByMark

-----------------------------------------------------

go
--������� ��������� �� ������
create procedure findByModel
@model varchar(30)
as 
	select * from bus b where b.mark = @model
	
go
--������� ���������
drop procedure findByModel

-------------------------------------------------------

go
--�������� �������� �� ����
create procedure deleteBus
@id int
as 
	delete bus 
		where id = @id;
	return 0
--������� ���������
drop procedure deleteBus

--------------------------------------------------------

go
--�������� ������� � ����
create procedure saveBus
@regNumber varchar(10), @mark varchar(30), @model varchar(20), @state bit, @description varchar(64)
as 
	insert into bus (regNumber, mark, model, [state], [description]) VALUES (@regNumber,@mark,@model,@state,@description)
	return 0
--������� ���������
drop procedure saveBus

---------------------------------------------------------

go
--�������� ������ �� ��������
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
--������� ��� ��������
create procedure getAllBuses
as
	select * from bus;
--������� ���������
drop procedure getAllBuses

----------------------------------------------------------

go
--������� ��� ����� ���������
create procedure getAllMarks
as
	select b.mark from bus b;
--������� ���������
drop procedure getAllMarks

-----------------------------------------------------------

go
--������� ��� id
create procedure getAllNumbers
as
	select b.id from bus b order by b.id;
--������� ���������
drop procedure getAllNumbers