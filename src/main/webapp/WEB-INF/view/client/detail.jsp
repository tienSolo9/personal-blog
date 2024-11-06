<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!doctype html>
        <html lang="en">

        <head>
            <!-- Required meta tags -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
                integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
                integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link rel="stylesheet" href="/css/style.css">

            <title>Detail</title>
        </head>

        <body>
            <!-- sidebar -->
            <div class="nav"
                style="box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;">
                <div class="container">
                    <div class="inner-wrap">
                        <ul class="items">
                            <a href="/">
                                <li class="item">
                                    Home
                                </li>
                            </a>
                            <c:if test="${empty username}">
                                <a href="/login">
                                    <li class="item">
                                        Login
                                    </li>
                                </a>
                            </c:if>

                            <c:if test="${not empty username}">
                                <a href="#">
                                    <li class="item">
                                        <small>welcome: ${username}</small>
                                    </li>
                                </a>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- sidebar -->

            <!-- data-->
            <div class="user-detail">
                <div class="container">
                    <div class="inner-wrap">
                        <div style="margin-top:30px;text-align: left;">
                            <h1 style="font-size:52px">${article.title}</h1>
                            <h4>${article.publishingDate}</h4>
                        </div>
                        <div class="content mt-5" style="font-size:24px">
                            ${article.content}
                        </div>
                    </div>
                    <a class="btn btn-warning mt-5" style="margin-top: 10px;color:white" href="/">
                        Back
                    </a>
                </div>
            </div>
            <!-- data-->
        </body>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

        </html>