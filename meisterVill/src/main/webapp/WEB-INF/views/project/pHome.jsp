<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project Home</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
        body {
            margin: 0px;
        }

        .project-header {
            color: #272e38;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 87px;
            line-height: 87px;
        }

        .project-header>div {
            padding-left: 30px;
            font-weight: bold;
            font-size: 28px;
            width: 300px;
            border-bottom: 3px solid #FFBC42;
        }

        .project-container {
            margin-top: 100px;
        }

        .project-nav {
            padding: 0px;
            margin: 0px;
            list-style: none;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .project-navtab {
            float: left;
            width: 20%;
            height: 120px;
            background-color: #272e38;
            cursor: pointer;
            color: #5b6c83;
            box-sizing: border-box;
            border-right: 1px solid #5b6c83;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .project-navtab:hover {
            background: #232932;
            box-shadow: 0 0 2rem rgba(0, 0, 0, 0.3) inset;
            color: #929fb3
        }

        .project-navtab>i {
            font-size: 30px;
        }

        .nav_selected {
            background-color: #FFBC42;
            color: white;
        }

        .nav_selected:hover {
            background-color: #FFBC42;
            color: white;
            box-shadow: none;
        }
    </style>
</head>
<body>
 <div class="project-header">
        <div>PROJECT ROOM</div>
    </div>
    <div class="project-container" style="height: 3000px;">

    </div>
    <ul class="project-nav">
        <li class="project-navtab nav_selected">
            <i class="fas fa-home"></i>
            <span>Home</span> </li>
        <li class="project-navtab">2</li>
        <li class="project-navtab">3</li>
        <li class="project-navtab">4</li>
        <li class="project-navtab">5</li>
    </ul>
</body>
</html>