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
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <link rel="stylesheet" href="/css/style.css">

            <title>Admin-User</title>
        </head>


        <body>
            <!-- sidebar -->
            <jsp:include page="../layout/nav.jsp" />
            <!-- sidebar -->
            <!-- data-->
            <div class="user-form">
                <div class="container">
                    <div class="inner-wrap">
                        <div style="margin-top:30px;text-align: center;">
                            <h1>Add Article</h1>
                        </div>
                        <div class="card" style="width:50%;margin: 0 auto;background-color: azure;padding:30px;">
                            <form:form action="/admin/article/create" method="post" modelAttribute="article">
                                <c:if test="${ not empty id}">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Id</label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control " placeholder="" path="id"
                                                disabled="true" />
                                        </div>
                                    </div>
                                    <input name="id" value="${id}" type="hidden">
                                </c:if>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Title</label>
                                    <div class="col-sm-9">
                                        <form:input class="form-control" placeholder="Title" path="title" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Publish Date</label>
                                    <div class="col-sm-9">
                                        <form:input class="form-control" placeholder="/dd/mm/yyyy" type="text"
                                            path="publishingDate" />
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Content</label>
                                    <div class="col-sm-9">
                                        <form:textarea path="content" rows="10" style="width:100%" />
                                    </div>
                                </div>
                                <button type="submit" class="btn" style="margin-top: 10px;">
                                    <c:if test="${empty id}"> Add new</c:if>
                                    <c:if test="${not empty id}"> Update</c:if>
                                </button>
                                <a class="btn btn-warning" style="margin-top: 10px;" href="/admin/article">
                                    Back
                                </a>
                            </form:form>
                        </div>
                    </div>
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