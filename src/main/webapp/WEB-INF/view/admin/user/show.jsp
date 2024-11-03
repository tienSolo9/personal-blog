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

            <title>Admin-User</title>
        </head>

        <body>
            <!-- sidebar -->
            <jsp:include page="../layout/nav.jsp" />
            <!-- sidebar -->
            <!-- data-->
            <div class="data">
                <div class="container">

                    <div class="inner-wrap">

                        <div class="create d-flex align-items-center justify-content-between">
                            <h1>User Table</h1>
                            <div class="a">
                                <a href="/admin/user/create">
                                    <i class="fa-solid fa-plus"></i>
                                </a>
                            </div>
                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Role</th>
                                    <th scope="col">Handle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="it" items="${users}">
                                    <tr>
                                        <th scope="row">${it.id}</th>
                                        <td>${it.fullname}</td>
                                        <td>${it.address}</td>
                                        <td>${it.role.name}</td>
                                        <td>
                                            <a href="/admin/user/detail/${it.id}">
                                                <i class="fa-solid fa-bars"></i>
                                            </a>
                                            <a href="/admin/user/create/${it.id}">
                                                <i class="fa-solid fa-pen"></i>
                                            </a>

                                            <a href="/admin/user/delete/${it.id}"><i class="fa-solid fa-trash"></i>
                                            </a>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <c:if test="${totalPage eq 0}">
                            Not exist user
                        </c:if>
                        <c:if test="${totalPage > 0}">
                            <nav aria-label="Page navigation example" style="position: fixed;top:500px">
                                <ul class="pagination">
                                    <li class="page-item  ${currentPage eq 1 ? 'disabled':''}">
                                        <a class="page-link" href="/admin/user?page=${currentPage-1}"
                                            aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <c:forEach begin="0" end="${totalPage - 1}" varStatus="s">
                                        <li class="page-item">
                                            <a class="page-link" href="/admin/user?page=${s.index+1}">${s.index+1}</a>
                                        </li>
                                    </c:forEach>

                                    <li class="page-item  ${currentPage eq totalPage? 'disabled':''}">
                                        <a class="page-link" href="/admin/user?page=${currentPage+1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </c:if>

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