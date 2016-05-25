create trigger Zil
on personnel after update
as begin
	declare @id int
	set @id = (select id from inserted where [enabled] = 0)
	delete from work where personId = @id
end

drop trigger Zil