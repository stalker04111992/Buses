<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Автобусы</title>
    <link href="css/table.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
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

    <div>${error}</div>

<table id="table11" class="simple-little-table" cellspacing="0">
    <tr>
        <th>№</th>
        <th>Рег. номер</th>
        <th>Марка</th>
        <th>Модель</th>
        <th>На ходу</th>
        <th>Описание</th>
    </tr>
    <c:forEach var="bus" items="${buses}">
        <tr>
            <td>${bus.getId()}</td>
            <td>${bus.getRegNumber()}</td>
            <td>${bus.getMark()}</td>
            <td>${bus.getModel()}</td>
            <td>${bus.isState()}</td>
            <td>${bus.getDescription()}</td>
        </tr>
    </c:forEach>
</table>

<form action="viewbuses" method="get">
    <label>Поиск по марке автобуса</label>
    <select name = "mark">
        <option value="">Марка автобуса</option>
        <c:forEach var="mark" items="${marks}">
            <option value="${mark}">${mark}</option>
        </c:forEach>
    </select>
    <input type="hidden" name = "search" value="marks">
    <input type="submit" value="Поиск">
</form>

<form action="viewbuses" method="get">
    <input type="hidden" name = "search" value="all">
    <input type="submit" value="Все автобусы">
</form>

<form action="viewbuses" method="get">
    <input type="hidden" name = "search" value="numbers">
    <input type="text" name = "number" required pattern="^[a-zA-Z0-9\-]{5,10}$">
    <input type="submit" value="Все автобусы">
</form>

    </div>

</body>
</html>
