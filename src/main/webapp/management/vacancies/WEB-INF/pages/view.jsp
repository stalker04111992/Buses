<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Автобусы</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
    <link href="css/table.css" rel="stylesheet" type="text/css">
</head>
<body>


<div id="wrapper">
    <div id="menubar">
        <div id="menu">
            <ul>
                <li id = "menu0"><a href="../../index"><span>Главная</span></a></li>
                <li id = "menu1"><a href="../../management"><span>Управление</span></a></li>
            </ul>
        </div>
    </div>

    <section class="container">
        <div class="bus">
            <h1>Просмотр списка автобусов</h1>
            <%--@elvariable id="error" type="antlr"--%>
            <c:if test="${error != null}">
                <div class = "error">${error}</div>
            </c:if>
            <form method="get" action="search">
                <input id = "searchLine" type="text" name = "line" value="" title="">
                <p><input type="radio" onclick="Show()" name = "search" value="0" title="">Поиск по номеру</p>
                <p><input type="radio" onclick="Show()" name = "search" value="1" title="">Поиск по регистрационному номеру</p>
                <p><input type="radio" onclick="Show()" name = "search" value="2" title="">Поиск по марке</p>
                <p><input type="radio" checked onclick="Hidden()" name = "search" value="3" title="">Все автобусы</p>
                <input type="submit" value="Поиск">
                <div class="stopForm"></div>
            </form>
        </div>
    </section>

    <form action="update" method="post">
        <%--@elvariable id="vacancies" type="antlr"--%>
    <div>${error}</div>

    <c:if test="${buses != null && buses.size() > 0}">
        <table class="table_blur">
            <tr>
                <th>№</th>
                <th>Рег. номер</th>
                <th>Марка</th>
                <th>Модель</th>
                <th>На ходу</th>
                <th>Профиль</th>
            </tr>
            <c:forEach var="bus" items="${buses}">
                <tr>
                    <td>${bus.getId()}</td>
                    <td>${bus.getRegNumber()}</td>
                    <td>${bus.getMark()}</td>
                    <td>${bus.getModel()}</td>
                    <td>${bus.isState()}</td>
                    <td>
                        <a href="profile?selected=${bus.getId()}">Перейти</a><br>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    </form>


    </div>

</body>
</html>
