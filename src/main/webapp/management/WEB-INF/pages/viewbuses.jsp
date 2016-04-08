<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Автобусы</title>
    <link href="css/table1.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="wrapper">
    <div id="menubar">
        <div id="menu">
            <ul>
                <li><a href="../index"><span>Главная</span></a></li>
                <li><a href="../management"><span>Управление</span></a></li>
            </ul>
        </div>
    </div>

    <section class="container">
        <div class="bus">
            <h1>Просмотр списка автобусов</h1>
            <div class = "error">${error}</div>

            <form method="get" action="viewbuses">
                <input type="hidden" name = "search" value="all">
                <input type="submit" value="Все автобусы">
                <div class="stop"/>
            </form>
        </div>
    </section>

<c:if test="${buses != null}">
<table id="table11" class="simple-little-table" cellspacing="0">
    <tr>
        <th>№</th>
        <th>Номер</th>
        <th class="mark">Марка</th>
        <th class="model">Модель</th>
        <th class="state">Состояние</th>
        <th>Описание</th>
    </tr>
    <c:forEach var="bus" items="${selectedBuses}">
        <tr>
            <td>${bus.getId()}</td>
            <td>${bus.getRegNumber()}</td>
            <td class="mark">${bus.getMark()}</td>
            <td class="model">${bus.getModel()}</td>
            <td class="state">${bus.isState()}</td>
            <td>${bus.getDescription()}</td>
        </tr>
    </c:forEach>
</table>
</c:if>
    </div>

</body>
</html>
