<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Работа с графиком</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
    <link href="css/style1.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <link href="css/table.css" rel="stylesheet" type="text/css">
    <link rel='stylesheet' href='css/calendar.css' type='text/css'>
    <script type='text/javascript' src='js/calendar.js'></script>
</head>
<body>
<script type="text/javascript">
    var driver = '${driver}';             //информация о водителях
    var jsonDriver = JSON.parse(driver);
    var graphs = '${graphs}';
    var graphics= JSON.parse(graphs);
    var error = '${error}';                 //сообщение об ошибке

    //удалить рабочий день
    var ondelete = function (id) {
        $.ajax({

            type: 'POST',//тип запроса: get,post либо head
            url: 'deletegraph',//url адрес файла обработчика
            data: {'id': id.toString()},//параметры запроса
            dataType: 'json',
            success: function (data) {//возвращаемый результат от сервера
                alert(data);
                location.reload();
            },
            error: function (msg) {
                var error = JSON.parse(msg.responseText);
                alert(error);

            }
        });
    };

    var onadd = function (newDate, newShift) {
        var date = $(newDate).val();
        var shift = $(newShift).val();

        try{
            if (date == "" || shift == ""){
                throw new Error("Пустые строки");
            }

        var cur = new Date();
        var current = new Date(cur.getFullYear(), cur.getMonth(), cur.getDate());

            var dt = new Date(date);

        var addedDate = new Date(dt.getFullYear(), dt.getMonth(), dt.getDate());

        if (addedDate < current){
            alert("Невозможно добавить дату. Измените дату и попробуйте снова");
            return false;
        }
        else {

            var driver = jsonDriver[0];

            $.ajax({

                type: 'POST',//тип запроса: get,post либо head
                url: 'add',//url адрес файла обработчика
                data: {'number': driver['id'], 'date': date, 'shift': shift},//параметры запроса
                dataType: 'json',
                success: function (data) {//возвращаемый результат от сервера
                    alert(data);
                    location.reload();
                },
                error: function (msg) {
                    var error = JSON.parse(msg.responseText);
                    alert(error);
                }

            });
        }
        }
        catch (e){
            alert(e.message);
        }
    };

    $(document).ready(function () {

        if (error.length != 0){
            $("#error").text(error);
            return -1;
        }

        if(jsonDriver.length == 0){
            $("#error").text("Водитель не найден");
            return -1;
        }
        var driver = jsonDriver[0];
        $("#driver").text(driver['id'] + ' ' + driver['firstName'] + ' ' + driver['lastName']);

        if(graphics.length == 0){
            $("#error").text("График не составлен");
        }

            var table = $('<table></table>').addClass('table_blur');
            var row = $('<th>Дата</th><th>Смена</th><th></th>');
            table.append(row);

            for (var j = 0; j < graphics.length; j++) {
                var graph = graphics[j];
                row = $('<tr></tr>');
                var date = new Date(graph['date']);
                var rowData = $('<td>' + graph['date'] + '</td><td>' + graph['shift'] + '</td><td><input id="submit2" name="submit" type="submit" value="-" onclick="ondelete(' + graph['id'] + ')">');
                row.append(rowData);
                table.append(row);
            }
            var data = $('<tr><td><input id = "newDate" name="data1" class="date" type="date"></td><td><select id = "newShift" required><option value="1">1</option><option value="2">2</option></select></td><td><input id="submit2" name="submit" type="submit" value="+" onclick="onadd(newDate, newShift)"></td></tr>');
            table.append(data);
            $('#graph').append(table);

    });
</script>

<div id="wrapper">
    <div id="menubar">
        <div id="menu">
            <ul>
                <li id = "menu0"><a href="../../index"><span>Главная</span></a></li>
                <li id = "menu1"><a href="../../management"><span>Управление</span></a></li>
            </ul>
        </div>
    </div>

        <div id="block">
            <h3>Управление графиком</h3>
            <div id = "error" class="error"></div>
            <div class="spec2" id = "driver"></div>
            <div id = "graph"></div>
            <div class="Stop"></div>
        </div>
   </div>

</div>


</body>
</html>
