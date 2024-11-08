<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Login</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
                integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
                integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link rel="stylesheet" href="/css/style.css">
        </head>

        <body class="">
            <div id="layoutAuthentication">
                <div id="layoutAuthentication_content">
                    <main>
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-5">
                                    <div class="card shadow-lg border-0 rounded-lg mt-5">
                                        <div class="card-header bg-success ">
                                            <h3 class="text-center font-weight-light my-4 text-white">Register</h3>
                                        </div>
                                        <div class="card-body">
                                            <form:form method="post" action="/register" modelAttribute="register">
                                                <c:set var="errorPassword_pw">
                                                    <form:errors path="password" />
                                                </c:set>
                                                <c:set var="errorPassword">
                                                    <form:errors path="confirmPassword" />
                                                </c:set>
                                                <c:set var="usernameError">
                                                    <form:errors path="username" />
                                                </c:set>
                                                <div class="form-floating mb-3">
                                                    <label for="inputEmail" class="form-label">Username</label>
                                                    <input
                                                        class="form-control  ${not empty usernameError?'is-invalid':''}"
                                                        id="inputEmail" type="text" placeholder="your username"
                                                        name="username" />
                                                    <form:errors path="username" cssClass="invalid-feedback" />
                                                </div>
                                                <div class="form-floating mb-3">
                                                    <label for="inputPassword">Password</label>
                                                    <input
                                                        class="form-control ${not empty errorPassword_pw?'is-invalid':''}"
                                                        id="inputPassword" type="password" placeholder="Password"
                                                        name="password" />
                                                    <form:errors path="password" cssClass="invalid-feedback" />
                                                </div>
                                                <div class="form-floating mb-3">
                                                    <label for="inputPassword">Confirm Password</label>
                                                    <input
                                                        class="form-control ${not empty errorPassword?'is-invalid':''}"
                                                        id="inputPassword" type="password" placeholder="Password"
                                                        name="ConfirmPassword" />
                                                    <form:errors path="confirmPassword" cssClass="invalid-feedback" />

                                                </div>
                                                <div>
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                </div>
                                                <div
                                                    class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                    <button type="submit" class="btn btn-success">Register</button>
                                                    <a class="small" href="/login">Have account?</a>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>
            </div>
        </body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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