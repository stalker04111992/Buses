--������� ������ � ����������
use Straeto;
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
@regNumber varchar(10), @mark varchar(30), @model varchar(20), @state bit, @category varchar(2), @description varchar(64)
as 
	insert into bus (regNumber, mark, model, [state], bus.[category], [description]) VALUES (@regNumber,@mark,@model,@state, @category, @description)
	return 0
--������� ���������
drop procedure saveBus

---------------------------------------------------------

go
--�������� ������ �� ��������
create procedure updateBus
@id int, @regNumber varchar(10), @mark varchar(30), @model varchar(20), @state bit, @category varchar(2), @description varchar(64)
as 
	update bus
	set regNumber = @regNumber, mark = @mark, model = @model, [state] = @state, bus.[category] = @category, [description] = @description where id = @id
	
	if (@state = 0)
	begin
		update graph
		set busId = null 
			 where busId = @id and not exists(select busId from graph G where @id = G.busId and DATEDIFF(day, GETDATE(), G.[date]) < 0); 
	end	
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
--������� ��� ��������
create procedure findFreeToday
@date Date, @shift int
as
	select B.* from bus B where not exists(select G.busId from graph G where B.id = G.busId and G.[date] = @date and G.[shift] = @shift) and B.state = 1;
--������� ���������
drop procedure findFreeToday

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

go

create procedure getCountsBuses @number int, @regNumber varchar(10)
as
begin	
	(select count(*) from bus where regNumber = @regNumber and @number != id);
end
drop procedure getCountsBuses

create procedure setBus
@graph int, @bus int
as 
	update graph
	set busId = @bus where id = @graph
	return 0
--drop procedure
drop procedure setBus

create procedure setBusNull
@graph int
as 
	update graph
	set busId = null where id = @graph
	return 0
--drop procedure
drop procedure setBusNull