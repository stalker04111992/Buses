<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Добавить сотрудника</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
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

    <section class="container">
        <div class="bus">
            <h1>Добавление сотрудника</h1>

            <div class = "error">${error}</div>

            <form method="post" action="addpersonnel">
                <input type="text" name = "lastName" placeholder="Фамилия" required pattern="^[A-Za-zА-Яа-яЁё0-9\-(), ]{1,50}$">
                <input type="text" name = "firstName" placeholder="Имя" required pattern="^[A-Za-zА-Яа-яЁё0-9\-(), ]{1,50}$">
                <input type="text" name = "patronymic" placeholder="Отчество" pattern="^[A-Za-zА-Яа-яЁё0-9\-(), ]{0,50}$">
                <input type="text" name = "birthDate" placeholder="Дата рождения" pattern="^[A-Za-zА-Яа-яЁё0-9\-(), ]{0,50}$">
                <textarea type="text" name = "address" placeholder="Адрес" pattern="^[A-Za-zА-Яа-яЁё0-9\-(),. ]{0,256}$"></textarea>
                <input type="text" name = "telephone" placeholder="Телефон" pattern="^[0-9\-]{0,15}$">
                <input type="submit" value="Добавить сотрудника">
                <div class="stopForm"/>
            </form>
        </div>

    </section>

    <div id="footer">

    </div>

</div>


</body>
</html>
