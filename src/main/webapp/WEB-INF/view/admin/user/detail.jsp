<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
    <div class="user-detail">
        <div class="container">
            <div class="inner-wrap">
                <div style="margin-top:30px;text-align: center;">
                    <h1>User Detail</h1>
                </div>
                <div class="card" style="width:50%;margin: 0 auto;background-color: azure;">
                    <img class="card-img-top"
                        src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw-4FpZf-gFtVMnaRSkcjj_eNE9dq_qRJgNA&s"
                        alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">username: ${user.id}</h5>
                        <p class="card-text">full name: ${user.fullname}</p>
                        <p class="card-text">Address: ${user.address}</p>
                        <a href="/admin/user" style="font-weight: bold;">
                            <i class="fa-solid fa-backward"></i> Back
                        </a>
                    </div>
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