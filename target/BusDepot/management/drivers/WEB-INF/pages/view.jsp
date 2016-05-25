<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Водители</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
    <link href="css/style1.css" rel="stylesheet" type="text/css">
    <link href="css/table.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
</head>
<body>

<div id="wrapper">
    <div id="menubar">
        <div id="menu">
            <ul>
                <li><a href="../../index"><span>Главная</span></a></li>
                <li><a href="../../management"><span>Управление</span></a></li>
            </ul>
        </div>
    </div>


    <script type="text/javascript">

        $(document).ready(function () {

            var error = '${error}';             //сообщение об ошибке
            if (error.length != 0){
                $("#error").text(error);
            }
        });

        var search = function () {

            var result = $("#result");
            if (result != null){
                result.remove();
            }
            $("#error").text("");

            var param = $("#search").val();

            $.ajax({

                type: 'get',//тип запроса: get,post либо head
                url: 'search',//url адрес файла обработчика
                data: {'param': param},//параметры запроса
                dataType: 'json',
                success: function (data) {//возвращаемый результат от сервера
                    if(data.length == 0){
                        $("#error").text("Не найдены водители");
                        return -1;
                    }
                    print(data);
                },
                error: function (rsp) {
                    var error = JSON.parse(rsp.responseText);
                    exception(error);
                }

            });
        };

        var exception = function (msg) {
            $("#error").text(msg);
            alert(msg);
        };


        var print = function (jsonData) {
            var table = $('<table id = "result"></table>').addClass('table_blur');
            var row = $('<th>Таб. номер</th><th>Фамилия</th><th>Имя</th>');
            table.append(row);
            for (var j = 0; j < jsonData.length; j++) {
                var driver = jsonData[j];
                row = $('<tr></tr>');
                var rowData = $('<td><a class="spec" href = "profile?number=' + driver['id'] + '">' + driver['id'] + '</a></td><td>' + driver['lastName'] + '</td><td>' + driver['firstName'] + '</td>');

                row.append(rowData);
                table.append(row);
            }
            $('#someContainer').append(table);
        };
    </script>

    <div id="block">
            <div class = "error">Список водителей</div>
            <div id = "error" class = "error"></div>

        <input type="text" placeholder="Табельный номер или фамилия" id = "search">
        <input id="submit" name="submit" type="submit" value="Поиск" onclick="search()">

        </div>


    <div id = "someContainer"></div>

    <div class="Stop"></div>
</div>
</body>
</html>
