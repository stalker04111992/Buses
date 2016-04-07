<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 21.03.2016
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="js/calendar.js" type="text/javascript"></script>
    <title>Добавление сотрудника</title>
</head>
<body>
    <input type="text" name = "lastName" pattern="[A-Za-zА-Яа-яЁё]" placeholder="Фамилия (не более 50 букв)" required = "required" maxlength="50" min="1">
    <input type="text" name = "firstName" pattern="[A-Za-zА-Яа-яЁё]" placeholder="Имя (не более 50 букв)" required = "required" maxlength="50" min="1">
    <input type="text" name = "patronymic" pattern="[A-Za-zА-Яа-яЁё]" placeholder="Отчество (не более 50 букв)" required = "required" maxlength="50" min="1">
    <input type="date" name = "birthDate" pattern="[0-9]{2}-[0-9]{2}-[0-9]{4}" placeholder="Дата рождения в формате dd-mm-yyyy" required = "required" maxlength="50" min="1">

    <input type="text" value="dd-mm-yy" onfocus="this.select();_Calendar.lcs(this)"
           onclick="event.cancelBubble=true;this.select();_Calendar.lcs(this)">

</body>
</html>
