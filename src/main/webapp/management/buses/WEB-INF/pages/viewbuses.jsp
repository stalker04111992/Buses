<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Автобусы</title>
    <link href="css/table.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>


<style type="text/css">

    .table_blur {
        font: 12px Tahoma;
        background: #f5ffff;
        border-collapse: collapse;
        text-align: left;
        margin: 10px auto 30px auto;
    }
    .table_blur th {
        border-top: 1px solid #777777;
        border-bottom: 1px solid #777777;
        box-shadow: inset 0 1px 0 #999999, inset 0 -1px 0 #999999;
        background: linear-gradient(#9595b6, #5a567f);
        color: white;
        padding: 10px 15px;
        position: relative;
    }
    .table_blur th:after {
        content: "";
        display: block;
        position: absolute;
        left: 0;
        top: 25%;
        height: 25%;
        width: 100%;
        background: linear-gradient(rgba(255, 255, 255, 0), rgba(255,255,255,.08));
    }
    .table_blur tr:nth-child(odd) {
        background: #ebf3f9;
    }
    .table_blur th:first-child {
        border-left: 1px solid #777777;
        border-bottom:  1px solid #777777;
        box-shadow: inset 1px 1px 0 #999999, inset 0 -1px 0 #999999;
    }
    .table_blur th:last-child {
        border-right: 1px solid #777777;
        border-bottom:  1px solid #777777;
        box-shadow: inset -1px 1px 0 #999999, inset 0 -1px 0 #999999;
    }
    .table_blur td {
        border: 1px solid #e3eef7;
        padding: 10px 15px;
        position: relative;
        transition: all 0.5s ease;
    }

    .table_blur td {
        border: 1px solid #e3eef7;
        padding: 10px 15px;
        position: relative;
        transition: all 0.5s ease;
    }

    .table_blur tbody:hover td {
        color: transparent;
        text-shadow: 0 0 3px #a09f9d;
    }
    .table_blur tbody:hover tr:hover td {
        color: #444444;
        text-shadow: none;
    }
</style>


<div id="wrapper">
    <div id="menubar">
        <div id="menu">
            <ul>
                <li id = "menu0"><a href="../../index"><span>Главная</span></a></li>
                <li id = "menu1"><a href="../../management"><span>Управление</span></a></li>
            </ul>
        </div>
    </div>


    <form action="update" method="post">
        <%--@elvariable id="vacancies" type="antlr"--%>
    <div>${error}</div>

    <c:if test="${vacancies != null && vacancies.size() > 0}">
        <table class="table_blur">
            <tr>
                <th>№</th>
                <th>Рег. номер</th>
                <th>Марка</th>
                <th>Модель</th>
                <th>На ходу</th>
                <th>Описание</th>
                <th>Действие</th>
            </tr>
            <c:forEach var="bus" items="${buses}">
                <tr>
                    <td>${bus.getId()}</td>
                    <td>${bus.getRegNumber()}</td>
                    <td>${bus.getMark()}</td>
                    <td>${bus.getModel()}</td>
                    <td>${bus.isState()}</td>
                    <td>${bus.getDescription()}</td>
                    <td>
                       <a href="updatebus?selected = ${bus.getId()}">Выбрать</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    </form>


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
