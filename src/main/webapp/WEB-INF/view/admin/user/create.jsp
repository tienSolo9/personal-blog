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
                            <h1>New User</h1>
                        </div>
                        <div class="card" style="width:50%;margin: 0 auto;background-color: azure;padding:30px;">
                            <form:form action="/admin/user/create" method="post" modelAttribute="user"
                                enctype="multipart/form-data">
                                <c:if test="${ not empty id}">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Username</label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control " placeholder="" path="username"
                                                disabled="true" />
                                        </div>
                                    </div>
                                    <input name="id" value="${id}" type="hidden" />
                                    <input name="username" value="${user.username}" type="hidden">
                                </c:if>
                                <c:if test="${ empty id}">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Username</label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" placeholder="username" path="username" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Password</label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" placeholder="password" type="password"
                                                path="password" />
                                        </div>
                                    </div>
                                </c:if>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Full Name</label>
                                    <div class="col-sm-9">
                                        <form:input class="form-control" placeholder="full name" path="fullname" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">address</label>
                                    <div class="col-sm-9">
                                        <form:input class="form-control" placeholder="address" path="address" />
                                    </div>
                                </div>

                                <form:select class="custom-select" path="role.name">
                                    <form:option value="">--select Role--</form:option>
                                    <form:option value="ADMIN">ADMIN</form:option>
                                    <form:option value="USER">USER</form:option>
                                </form:select>
                                <div class="form-group row" style="margin-top:20px">
                                    <label for="formFile" class="col-sm-3 col-form-label">Image</label>
                                    <div class="col-sm-9 d-flex justify-content-between align-items-center">
                                        <input style="margin-bottom: 20px;" type="file" id="newFile" name="myFile"
                                            accept=".png, .jpg, .jpeg" />
                                    </div>
                                    <div class="col-12 mb-3">
                                        <img id="avatarPreview" style="max-height: 250px;width:100%;display: none;">
                                    </div>
                                </div>
                                <button type="submit" class="btn" style="margin-top: 10px;">
                                    <c:if test="${empty id}"> Add new</c:if>
                                    <c:if test="${not empty id}"> Update</c:if>
                                </button>
                                <a class="btn btn-warning" style="margin-top: 10px;" href="/admin/user">
                                    Back
                                </a>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- data-->
        </body>
        <script>
            $(document).ready(() => {
                const orgImg = "${user.images}";
                if (orgImg) {
                    url = "/images/" + orgImg;
                    $("#avatarPreview").attr("src", url);
                    $("#avatarPreview").css({ "display": "block" });
                }
                const avatarFile = $("#newFile");
                avatarFile.change(function (e) {
                    const imgURL = URL.createObjectURL(e.target.files[0]);
                    $("#avatarPreview").attr("src", imgURL);
                    $("#avatarPreview").css({ "display": "block" });
                });
            });
        </script>
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