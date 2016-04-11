<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Редактирование</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
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
    <select>
        <c:forEach var="bus" items="${buses}">

            <option value="${buses.indexOf(bus)}">${bus.getId()}  Рег. номер: ${bus.getRegNumber()} Автобус: ${bus.getMark()}   ${bus.getModel()}</option>

        </c:forEach>
    </select>

    <div id="footer"></div>

</div>

</body>
</html>
