<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Добавить вакансию</title>
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
            <h1>Добавление вакансии</h1>

            <div class = "error">${error}</div>

            <form method="post" action="addvacancy">
                <input type="text" name = "title" placeholder="Название вакансии" required pattern="^[A-Za-zА-Яа-яЁё0-9\-(), ]{1,50}$">
                <input type="text" name = "salary" placeholder="Тарифная ставка" required pattern="^[0-9\.]{1,12}$">
                <input type="text" name = "count" placeholder="Количество" required pattern="^[0-9]{1,3}$">
                <textarea type="text" name = "description" placeholder="Описание" pattern="^[A-Za-zА-Яа-яЁё0-9\-(),. ]{0,256}$"></textarea>
                <input type="submit" value="Добавить вакансию">
                <div class="stopForm"/>
            </form>
        </div>

    </section>

    <div id="footer">

    </div>

</div>


</body>
</html>
