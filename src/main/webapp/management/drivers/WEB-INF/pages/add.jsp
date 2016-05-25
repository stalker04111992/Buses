<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Добавить водителя</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
    <link href="css/style1.css" rel="stylesheet" type="text/css">
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
        var error = '${error}';             //сообщение об ошибке

        $(document).ready(function () {
            if (error.length != 0){
                $("#error").text(error);
            }
        });

    </script>

    <section class="container">
        <div id="block">
            <h3>Добавление водителя</h3>

            <div id = "error" class = "error"></div>

            <form method="post" action="add">
                <input type="text" name = "firstName" placeholder="Имя" required pattern="^[A-Za-zА-Яа-яЁё\- ]{1,50}$">
                <input type="text" name = "lastName" placeholder="Фамилия / Отчество" required pattern="^[A-Za-zА-Яа-яЁё\- ]{1,50}$">
                <select name = "driverClass" required>
                    <option disabled selected>Класс вождения</option>
                    <option value="1">1 класс</option>
                    <option value="2">2 класс</option>
                    <option value="3">3 класс</option>
                </select>
                <input type="text" name = "licenseNumber" placeholder="Номер водительского удостоверения в формате '1AB 123456'" pattern="^[0-9]{1}[A-Z]{2} [0-9]{6}$">
                <input id="submit" name="submit" type="submit" value="Добавить водителя">
                <div class="stopForm"/>
            </form>
        </div>

    </section>


    </div>

</div>


</body>
</html>
