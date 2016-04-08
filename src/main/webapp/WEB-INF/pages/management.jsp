<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Управление</title>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
</head>
<body>
<div id = "wrapper">
    <div id="menubar">
        <div id="menu">
            <ul>
                <li id = "menu0"><a href="index"><span>Главная</span></a></li>
            </ul>
        </div>
    </div>

    <div id="managementBuses">
        <ul>
            <li><a href="management/addbus">Добавить автобус</a></li>
            <li><a href="management/editbus">Редактировать данные об автобусах</a></li>
            <li><a href="management/viewbuses">Просмотр списка автобусов</a></li>
            <li><a href="management/deletebus">Удаление автобуса</a></li>
        </ul>
    </div>

    <div id="managementPersonnel">
        <ul>
            <li><a href="management/addpersonnel">Добавить сотрудника</a></li>
            <li><a href="management/editpersonnel">Редактировать данные о сотрудниках</a></li>
            <li><a href="management/viewpersonnels">Просмотр списка сотрудников</a></li>
            <li><a href="management/deletepersonnels">Удаление сотрудника</a></li>
        </ul>
    </div>

    <div id="footer">

    </div>

</div>

</body>
</html>
