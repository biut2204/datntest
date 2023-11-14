<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | DataTables</title>

    <!-- Favicon -->
    <link href="../../../resources/img/favicon.ico" rel="icon">

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../../resources/plugins/fontawesome-free/css/all.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../../../resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../../resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../../../resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../../resources/dist/css/adminlte.min.css">
    <%--    <link rel="stylesheet" href="../../../resources/css/add_form.css">--%>

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <!-- Include jQuery if not already included -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Libraries Stylesheet -->
    <link href="../../../resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="../../../resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <%--    <link href="../../../resources/css/style.css" rel="stylesheet">--%>
    <%--    <link rel="stylesheet" href="../../../resources/css/add_form2.css">--%>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <style>
        #addFormContainer {

            position: fixed;
            top: 0;
            left: 0;
            /*padding-top: 15%;*/
            padding-left: 3%;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            /* Màu nền với độ trong suốt */
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm {
            background-color: white;
            /* Màu nền của biểu mẫu */
            /*padding: 20px;*/
            border-radius: 5px;
            /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            /* Đổ bóng cho biểu mẫu */
        }

        #addForm button[type="submit"] {
            background-color: #007BFF;
            /* Màu nền của nút */
            color: white;
            /* Màu chữ trắng */
            border: none;
            cursor: pointer;
        }

        #addForm button[type="submit"]:hover {
            background-color: #0056b3;
            /* Màu nền khi di chuột vào */
        }

        #addFormContainer1 {
            position: fixed;
            top: 0;
            left: 0;
            /*padding-top: 15%;*/
            padding-left: 18%;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            /* Màu nền với độ trong suốt */
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm1 {
            background-color: white;
            width: 70%;
            height: 300px;
            /* Màu nền của biểu mẫu */
            /*padding: 20px;*/
            border-radius: 5px;
            /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            /* Đổ bóng cho biểu mẫu */
        }

        #addForm1 button[type="submit"] {
            background-color: #007BFF;
            /* Màu nền của nút */
            color: white;
            /* Màu chữ trắng */
            border: none;
            cursor: pointer;
        }

        #addForm1 button[type="submit"]:hover {
            background-color: #0056b3;
            /* Màu nền khi di chuột vào */
        }

        #addFormContainer2 {

            display: none;
            position: fixed;
            top: 0;
            left: 0;
            padding-left: 18%;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            /* Màu nền với độ trong suốt */
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm2 {
            width: 80%;
            height: 300px;
            background-color: white;
            /* Màu nền của biểu mẫu */
            padding: 20px;
            border-radius: 5px;
            /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            /* Đổ bóng cho biểu mẫu */
        }

        #addForm2 button[type="submit"] {
            background-color: #007BFF;
            /* Màu nền của nút */
            color: white;
            /* Màu chữ trắng */
            border: none;
            cursor: pointer;
        }

        #addForm2 button[type="submit"]:hover {
            background-color: #0056b3;
            /* Màu nền khi di chuột vào */
        }

        .gia {
            color: red;
            font-weight: bold;
            font-size: larger;
        }

        .gia del {
            color: gray;
        }

        input[type="radio"] {
            display: none;
        }

        /* Tạo hình vuông tùy chỉnh và tạo một hình vuông giả bằng cách sử dụng một phần tử div */
        label.radio-label {
            display: inline-flex;
            align-items: center; /* Căn giữa theo chiều dọc */
            position: relative;
            cursor: pointer;
        }

        label.radio-label::before {
            content: " ";
            display: inline-block;
            width: 130%; /* Độ rộng hình vuông */
            height: 130%; /* Chiều cao hình vuông */
            border: 0.5px solid #6e7881; /* Viền */
            background-color: transparent; /* Màu nền */
            position: absolute; /* Điều chỉnh khoảng cách giữa hình vuông và label */
            top: 0;
            border-radius: 4px; /* Độ cong viền */
        }

        /* Điều khiển màu nền của hình vuông khi được chọn */
        input[type="radio"]:checked + label.radio-label::before {
            border: 2px solid #ffa500; /* Đổi màu border thành màu cam */
        }

        /* Tạo góc bên dưới bên phải màu cam */
        input[type="radio"]:checked + label.radio-label::after {
            content: "";
            position: absolute;
            bottom: 58%; /* Điều chỉnh vị trí theo chiều dọc */
            right: -30%; /* Điều chỉnh vị trí theo chiều ngang */
            width: 20px; /* Độ rộng của góc cam */
            height: 12px; /* Chiều cao của góc cam */
            background-color: #ffa500; /* Màu cam */
            clip-path: polygon(100% 0, 0 0, 100% 100%);
        }
    </style>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="../../../index3.html" class="nav-link">Home</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="#" class="nav-link">Contact</a>
            </li>
        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
            <!-- Navbar Search -->
            <li class="nav-item">
                <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                    <i class="fas fa-search"></i>
                </a>
                <div class="navbar-search-block">
                    <form class="form-inline">
                        <div class="input-group input-group-sm">
                            <input class="form-control form-control-navbar" type="search" placeholder="Search"
                                   aria-label="Search">
                            <div class="input-group-append">
                                <button class="btn btn-navbar" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </li>

            <!-- Messages Dropdown Menu -->
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="far fa-comments"></i>
                    <span class="badge badge-danger navbar-badge">3</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="../../../dist/img/user1-128x128.jpg" alt="User Avatar"
                                 class="img-size-50 mr-3 img-circle">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    Brad Diesel
                                    <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                                </h3>
                                <p class="text-sm">Call me whenever you can...</p>
                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="../../../dist/img/user8-128x128.jpg" alt="User Avatar"
                                 class="img-size-50 img-circle mr-3">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    John Pierce
                                    <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                                </h3>
                                <p class="text-sm">I got your message bro</p>
                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="../../../dist/img/user3-128x128.jpg" alt="User Avatar"
                                 class="img-size-50 img-circle mr-3">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    Nora Silvester
                                    <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                                </h3>
                                <p class="text-sm">The subject goes here</p>
                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
                </div>
            </li>
            <!-- Notifications Dropdown Menu -->
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="far fa-bell"></i>
                    <span class="badge badge-warning navbar-badge">15</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <span class="dropdown-item dropdown-header">15 Notifications</span>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-envelope mr-2"></i> 4 new messages
                        <span class="float-right text-muted text-sm">3 mins</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-users mr-2"></i> 8 friend requests
                        <span class="float-right text-muted text-sm">12 hours</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-file mr-2"></i> 3 new reports
                        <span class="float-right text-muted text-sm">2 days</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                    <i class="fas fa-expand-arrows-alt"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                    <i class="fas fa-th-large"></i>
                </a>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="../../../index3.html" class="brand-link">
            <img src="../../../dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
                 style="opacity: .8">
            <span class="brand-text font-weight-light">AdminLTE 3</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="../../../dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block">Alexander Pierce</a>
                </div>
            </div>

            <!-- SidebarSearch Form -->
            <div class="form-inline">
                <div class="input-group" data-widget="sidebar-search">
                    <input class="form-control form-control-sidebar" type="search" placeholder="Search"
                           aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-sidebar">
                            <i class="fas fa-search fa-fw"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                    data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
                         with font-awesome or any other icon font library -->
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Dashboard
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/index/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Dashboard v1</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../../../index2.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Dashboard v2</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../../../index3.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Dashboard v3</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/ban-quay/trang-chu" class="nav-link active">
                            <i class="nav-icon fas fa-store"></i>
                            <p>
                                Bán Quầy
                                <span class="right badge badge-danger">New</span>
                            </p>
                        </a>
                    </li>

                    <li class="nav-item ">
                        <a href="#" class="nav-link ">
                            <i class="nav-icon fas fa-table"></i>
                            <p>
                                Tables
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/ao/view/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/hang/view/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Hãng</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/loai_ao/view/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Loại áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/chat_vai/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Chất vải</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/form/view/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Form áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/huong_dan_bao_quan/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Hướng dẫn bảo quản</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/mau_sac/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Màu sắc</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/size/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Size</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item ">
                        <a href="#" class="nav-link ">
                            <i class="nav-icon fas fa-user"></i>
                            <p>
                                Quản Lý Tài Khoản
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/nhanvien/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Nhân Viên</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/khachhang/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Khách Hàng</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-plus-square"></i>
                            <p>
                                Chương trình giảm giá
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/chuong_trinh_giam_gia/add_view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Add chương trình</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>
                                        Giảm giá sản phẩm
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="/admin/view_chuong_trinh_giam_gia_sp/1" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Các chương trình</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="/admin/ap-dung" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Áp dụng</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>
                                        Giảm giá hóa đơn
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="/admin/view_chuong_trinh_giam_gia_hd/1" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Các chương trình</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/quan_li_don_hang/1" class="nav-link">
                            <i class="nav-icon fas fa-money-bill-alt"></i>
                            <p>
                                Quản lí hóa đơn
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/chat" class="nav-link">
                            <i class="nav-icon fas fa-envelope"></i>
                            <p>
                                Chat hỗ trợ
                            </p>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>DataTables</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">DataTables</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <form>
                            <div class="card">
                                <div class="card-header">
                                    <button class="btn btn-success" id="addButton" onclick="clickThem()"><i
                                            class="fas fa-plus"></i> Thêm sản phẩm</button>

                                </div>
                                <div class="row px-xl-5 mt-4">
                                    <div class="col-lg-12 table-responsive mb-5">
                                        <c:choose>
                                            <c:when test="${not empty listHoaDonChiTiets}">
                                                <table class="table table-border table-hover text-center mb-0">
                                                    <thead class="thead-dark">
                                                    <tr>
                                                        <th>STT</th>
                                                        <th>Ảnh</th>
                                                        <th>Sản phẩm</th>
                                                        <th>Thông tin</th>
                                                        <th>Giá</th>
                                                        <th>Số lượng</th>
                                                        <th>Tổng tiền</th>
                                                        <th>Action</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody class="align-middle table-border">
                                                    <c:forEach items="${listHoaDonChiTiets}" var="list"
                                                               varStatus="vTri">
                                                        <tr>
                                                            <td class="align-middle">${vTri.index + 1}</td>
                                                            <td class="align-middle"><img
                                                                    src="/images/${list.aoChiTiet.ao.anhs.get(0).ten_url}"
                                                                    alt=""
                                                                    style="width: 50px;">
                                                            </td>
                                                            <input type="hidden" name="idAoChiTiet"
                                                                   value="${list.aoChiTiet.id}">
                                                            <input type="hidden" id="slTon${vTri.index + 1}" value="${list.aoChiTiet.slton}">
                                                            <td class="align-middle"
                                                                style="text-align: left"> ${list.aoChiTiet.ao.ten}</td>
                                                            <td class="align-middle">${list.aoChiTiet.mau_sac.ten}, ${list.aoChiTiet.size.ten}</td>
                                                            <td class="align-middle" id="gia${vTri.index + 1}">
                                                                <fmt:formatNumber value="${list.gia}" type="currency"
                                                                                  currencySymbol="VNĐ"/>
                                                            </td>
                                                            <td class="align-middle">
                                                                <input type="number" name="soLuong" min="0" max="100"
                                                                       step="1"
                                                                       value="${list.hoaDonChiTiet.soLuong}"
                                                                       oninput="updateSL(${vTri.index + 1})"
                                                                       id="sl${vTri.index + 1}">
                                                            </td>
                                                            <td class="align-middle">
                                                                <input type="hidden" name="donGia" readonly
                                                                       id="donGia1${vTri.index + 1}"
                                                                       value="${ list.gia * list.hoaDonChiTiet.soLuong}"
                                                                       style="border: none; background: none; text-align: center;">
                                                                <input type="text" id="abc${vTri.index + 1}"
                                                                       style="border: none; background: none; text-align: center;">
                                                                <input type="hidden" id="vTri"
                                                                       value="${vTri.index + 1}">
                                                            </td>
                                                            <td class="align-middle">
                                                                <a href="/admin/ban-quay/delete-san-pham/${idHoaDon}/${list.hoaDonChiTiet.id}"
                                                                   class="btn btn-sm btn-danger ml-2 me-2"><i
                                                                        class="fa fa-times"
                                                                        style="font-size: 22px;"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="text-center">
                                                    <!-- Hiển thị hình ảnh giỏ hàng trống khi không có sản phẩm -->
                                                    <img src="/images/empty-cart.webp" alt="Giỏ hàng trống"
                                                         style="width: 70%; height: 250px;">
                                                        <%--                                <p style="text-align: center">Giỏ hàng của bạn hiện đang trống</p>--%>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <%--                        <form >--%>
                        <div class="card">
                            <div class="container-fluid">
                                <%--                                <h5 class="section-title position-relative text-uppercase mb-3 mt-3">--%>
                                <%--                                    <span class="bg-dark pr-3">Khách hàng</span>--%>
                                <%--                                </h5>--%>
                                <%--                                <div class="border-bottom">--%>
                                <%--                                    <div class="card-header d-flex justify-content-between align-items-center">--%>
                                <%--                                        <div class="row px-xl-5 mt-3">--%>
                                <%--                                            &lt;%&ndash;                                                            <input type="hidden" value="${khachHang.id}" name="idKhachHang">&ndash;%&gt;--%>
                                <%--                                            <label id="khachHangLabel">Tên khách hàng: <span>${khachHang.ten}</span></label>--%>
                                <%--                                        </div>--%>
                                <%--                                        <button class="btn btn-success ml-auto" id="addButton2"><i--%>
                                <%--                                                class="fas fa-plus"></i>--%>
                                <%--                                        </button>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                                <form method="post">
                                    <div class="row px-xl-5">

                                        <%--                                        <div class="col-lg-6">--%>

                                        <%--                                            <h5 class="section-title position-relative text-uppercase mb-3 mt-3">--%>
                                        <%--                                                <span class="bg-dark pr-3">Địa chỉ nhận hàng</span>--%>
                                        <%--                                            </h5>--%>
                                        <%--                                            <input type="checkbox" name="diaChiChon" value="diaChiCu" id="checkbox1"--%>
                                        <%--                                                   onchange="kiemTraDiaChiCu()">Địa chỉ ban đầu--%>
                                        <%--                                            <div id="view_dia_chi_cu" style="display:block">--%>
                                        <%--                                                <div class="bg-light p-30 mb-2">--%>
                                        <%--                                                    <div class="row">--%>
                                        <%--                                                        <div class="col-md-6 form-group">--%>
                                        <%--                                                            <label>Họ tên</label>--%>
                                        <%--                                                            <input class="form-control" type="text" name="ten"--%>
                                        <%--                                                                   value="${khachHang.ten}"--%>
                                        <%--                                                                   placeholder="${khachHang.ten}"--%>
                                        <%--                                                                   readonly>--%>
                                        <%--                                                        </div>--%>
                                        <%--                                                        <div class="col-md-6 form-group">--%>
                                        <%--                                                            <label>Email</label>--%>
                                        <%--                                                            <input class="form-control" type="text" name="email"--%>
                                        <%--                                                                   value="${khachHang.email}"--%>
                                        <%--                                                                   placeholder="${khachHang.email}"--%>
                                        <%--                                                                   readonly>--%>
                                        <%--                                                        </div>--%>
                                        <%--                                                        <div class="col-md-6 form-group">--%>
                                        <%--                                                            <label>Số điện thoại</label>--%>
                                        <%--                                                            <input class="form-control" type="text" name="sdt"--%>
                                        <%--                                                                   value="${khachHang.sdt}"--%>
                                        <%--                                                                   placeholder="${khachHang.sdt}"--%>
                                        <%--                                                                   readonly>--%>
                                        <%--                                                        </div>--%>
                                        <%--                                                        <div class="col-md-6 form-group">--%>
                                        <%--                                                            <label>Quốc gia</label>--%>
                                        <%--                                                            <input class="form-control" type="text" name="quocGia"--%>
                                        <%--                                                                   placeholder="${khachHang.quoc_gia}"--%>
                                        <%--                                                                   value="${khachHang.quoc_gia}" readonly>--%>
                                        <%--                                                        </div>--%>
                                        <%--                                                        <div class="col-md-6 form-group">--%>
                                        <%--                                                            <label>Thành phố</label>--%>
                                        <%--                                                            <input class="form-control" type="text" name="thanhPho"--%>
                                        <%--                                                                   placeholder="${khachHang.thanh_pho}"--%>
                                        <%--                                                                   value="${khachHang.thanh_pho}" id="diaChiCu"--%>
                                        <%--                                                                   readonly>--%>
                                        <%--                                                        </div>--%>
                                        <%--                                                        <div class="col-md-6 form-group">--%>
                                        <%--                                                            <label>Địa chỉ</label>--%>
                                        <%--                                                            <input class="form-control" type="text" name="diaChi"--%>
                                        <%--                                                                   value="${khachHang.dia_chi}"--%>
                                        <%--                                                                   placeholder="${khachHang.dia_chi}"--%>
                                        <%--                                                                   readonly>--%>
                                        <%--                                                        </div>--%>
                                        <%--                                                    </div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </div>--%>
                                        <%--                                            <input type="checkbox" name="diaChiChon" value="diaChiMoi"--%>
                                        <%--                                                   id="checkbox2" onclick="toggleView('view_dia_chi_moi')">Địa chỉ--%>
                                        <%--                                            mới--%>

                                        <%--                                            <div id="view_dia_chi_moi" style="display:none">--%>
                                        <%--                                                <div class="bg-light p-30 mb-5">--%>
                                        <%--                                                    <div class="bg-light p-30 mb-5">--%>
                                        <%--                                                        <div class="row">--%>
                                        <%--                                                            <div class="col-md-6 form-group">--%>
                                        <%--                                                                <label>Họ tên</label>--%>
                                        <%--                                                                <input class="form-control" name="ten1" type="text"--%>
                                        <%--                                                                       placeholder="Họ tên">--%>
                                        <%--                                                            </div>--%>
                                        <%--                                                            <div class="col-md-6 form-group">--%>
                                        <%--                                                                <label>Email</label>--%>
                                        <%--                                                                <input class="form-control" name="email1"--%>
                                        <%--                                                                       type="text" placeholder="Email">--%>
                                        <%--                                                            </div>--%>
                                        <%--                                                            <div class="col-md-6 form-group">--%>
                                        <%--                                                                <label>Số điện thoại</label>--%>
                                        <%--                                                                <input class="form-control" name="sdt1" type="text"--%>
                                        <%--                                                                       placeholder="Số điện thoại">--%>
                                        <%--                                                            </div>--%>
                                        <%--                                                            <div class="col-md-6 form-group">--%>
                                        <%--                                                                <label>Quốc gia</label>--%>
                                        <%--                                                                <input class="form-control" name="quocGia1"--%>
                                        <%--                                                                       type="text" placeholder="Quôc gia">--%>
                                        <%--                                                            </div>--%>
                                        <%--                                                            <div class="col-md-6 form-group">--%>
                                        <%--                                                                <label>Thành phố</label>--%>
                                        <%--                                                                <input class="form-control" name="thanhPho1"--%>
                                        <%--                                                                       id="diaChiMoi"--%>
                                        <%--                                                                       oninput="kiemTraDiaChiMoi()" type="text"--%>
                                        <%--                                                                       placeholder="Thành phố">--%>
                                        <%--                                                            </div>--%>
                                        <%--                                                            <div class="col-md-6 form-group">--%>
                                        <%--                                                                <label>Địa chỉ</label>--%>
                                        <%--                                                                <input class="form-control" name="diaChi1"--%>
                                        <%--                                                                       type="text" placeholder="Địa chỉ">--%>
                                        <%--                                                            </div>--%>
                                        <%--                                                        </div>--%>
                                        <%--                                                    </div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                        <div class="col-lg-6">
                                            <h5 class="section-title position-relative text-uppercase mb-3 mt-3 "><span
                                                    class="bg-dark pr-3">Thông tin thanh Toán</span></h5>
                                            <div class="bg-light p-30 mb-5">

                                                <%--                                                <div class="border-bottom pt-3 pb-2">--%>
                                                <div class="border-bottom pb-2">
                                                    <div class="d-flex justify-content-between mb-3 border-bottom">
                                                        <h6 class="font-weight-bold">Tổng tiền
                                                        </h6>
                                                        <label id="total"></label>
                                                        <input type="hidden" name="tongTien" id="tongTienInput">
                                                    </div>

                                                    <div class="d-flex justify-content-between mt-2 border-bottom">
                                                        <h6 class="font-weight-bold">Tiền khách đưa</h6>
                                                        <input type="number" min="0"  step="1"
                                                               id="amountPaid" oninput="calculateChange()"
                                                               style="width: 200px; ">
                                                    </div>
                                                    <div class="d-flex justify-content-between mt-2 ">
                                                        <h6 class="font-weight-bold">Tiền thừa trả khách</h6>
                                                        <label id="changeLabel">0 VNĐ</label>
                                                    </div>
                                                    <%--                                                    </div>--%>

                                                    <%--                                                    <div class="form-group">--%>
                                                    <%--                                                        <div class="payment-methods">--%>
                                                    <%--                                                            <label>--%>
                                                    <%--                                                                <p style="padding-top: 5px"--%>
                                                    <%--                                                                   onclick="toggleView('view_anh2')">Chương trình--%>
                                                    <%--                                                                    giảm giá--%>
                                                    <%--                                                                    <i class="fas fa-angle-down"></i></p>--%>
                                                    <%--                                                            </label>--%>
                                                    <%--                                                        </div>--%>
                                                    <%--                                                        <div id="view_anh2" style="display:none">--%>
                                                    <%--                                                            <div class="voucher-list">--%>
                                                    <%--                                                                <c:forEach items="${CTGG}" var="list">--%>
                                                    <%--                                                                    <div class="voucher-details">--%>
                                                    <%--                                                                        <input name="options" type="radio"--%>
                                                    <%--                                                                               value="${list.phanTramGiam}"--%>
                                                    <%--                                                                               onclick="updatePrice(this)"--%>
                                                    <%--                                                                               <c:if test="${list.soLuongSanPham > slDK && list.soTienHoaDon > tongTienDK}">disabled</c:if>>--%>
                                                    <%--                                                                        <label for="${list.ma}"--%>
                                                    <%--                                                                               class="radio-label"></label>--%>
                                                    <%--                                                                        <span class="voucher-name">${list.ten}</span>--%>
                                                    <%--                                                                        <span class="voucher-condition"><a href="#"--%>
                                                    <%--                                                                                                           onclick="showCondition('Số sản phẩm trên ${list.soLuongSanPham} và tổng tiền hóa đơn trên ${list.soTienHoaDon}')">Xem điều kiện</a></span>--%>
                                                    <%--                                                                    </div>--%>
                                                    <%--                                                                </c:forEach>--%>
                                                    <%--                                                            </div>--%>
                                                    <%--                                                        </div>--%>

                                                    <%--                                                        <div id="condition-popup" style="display: none;">--%>
                                                    <%--                                                            <div class="condition-content">--%>
                                                    <%--                                                                <span class="close-btn" onclick="closeCondition()">Đóng</span>--%>
                                                    <%--                                                                <div id="condition-text"></div>--%>
                                                    <%--                                                            </div>--%>
                                                    <%--                                                        </div>--%>
                                                    <%--                                                    </div>--%>
                                                    <%--                                                    <h5 class="section-title position-relative text-uppercase mb-3 mt-3"><span--%>
                                                    <%--                                                            class="bg-dark pr-3">Hình thức </span></h5>--%>
                                                    <%--                                                    <div class="form-group mb-4">--%>
                                                    <%--                                                        <div class="custom-control custom-radio">--%>
                                                    <%--                                                            <input type="radio" class="custom-control-input"--%>
                                                    <%--                                                                   value="bank" name="payment"--%>
                                                    <%--                                                                   id="banktransfer">--%>
                                                    <%--                                                            <label class="custom-control-label" for="banktransfer">--%>
                                                    <%--                                                                Đặt hàng--%>
                                                    <%--                                                            </label>--%>
                                                    <%--                                                        </div>--%>
                                                    <%--                                                    </div>--%>
                                                    <%--                                                    <div class="d-flex justify-content-between">--%>
                                                    <%--                                                        <h6 class="font-weight-medium font-weight-bold" >Ship</h6>--%>
                                                    <%--                                                        <h6 class="font-weight-medium font-weight-bold">--%>
                                                    <%--                                                            <input type="text" id="ship" readonly--%>
                                                    <%--                                                                   style="border: none; background: none; text-align: left;padding-left: 50%">--%>
                                                    <%--                                                        </h6>--%>
                                                    <%--                                                    </div>--%>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">

                                            <div class="mb-5">
                                                <div>
                                                    <label>Ghi chú</label> <button class="btn btn-success " style="width: 150px; height: 30px"
                                                                                   formaction="/admin/ban-quay/luuHD/${hoaDon}">
                                                    Lưu ghi chú
                                                </button>
                                                    <textarea name="ghiChu"
                                                              style="width: 100%; height: 150px"></textarea>
                                                </div>
                                                <div class="bg-light p-30">

                                                    <button class="btn btn-block btn-warning font-weight-bold py-3 "

                                                            formaction="/admin/ban-quay/thanh-toan/${hoaDon}" onclick="kiemTra()">
                                                        Thanh toán
                                                    </button>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>
                        <%--                        </form>--%>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <section class="content">
            <div id="addFormContainer" style="display: ${noneOrBlock};" >
                <div class="container-fluid mt-3" style="width: 1200px; max-height: 700px; ">
                    <div class="row">
                        <div class="col-12">
                            <form id="addForm" method="post" class="mt-3" style="max-height: 700px; overflow-y: auto;">
                                <div class="card" >
                                    <div class="card-header">
                                        <h3 style="text-align: center"> Danh sách sản phẩm</h3>
                                        <input type="hidden" value="${idHoaDon}" name="idHoaDon">
                                    </div>
                                    <div class="card-body" >
                                        <table id="example1" class="table table-bordered table-striped">
                                            <div class="col-12">
                                                <div class="row">
                                                    <div class="form-group col-3"></div>
                                                    <div class="form-group col-3"></div>
                                                    <div class="form-group col-3">
                                                        <label for="searchText2">Lọc theo hãng</label>
                                                        <select class="form-control" name="loai_ao_id" id="searchText2">
                                                            <c:forEach items="${listHangs}" var="list">
                                                                <option value="${list.ten}">${list.ten}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-3">
                                                        <label for="searchText3">Lọc theo loại</label>
                                                        <select class="form-control" name="loai_ao_id" id="searchText3">
                                                            <c:forEach items="${listLoaiAos}" var="list">
                                                                <option value="${list.ten}">${list.ten}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <thead>
                                            <tr>
                                                <th>Mã</th>
                                                <th>Tên</th>
                                                <th>Ảnh</th>
                                                <th>Hãng</th>
                                                <th>Loại</th>
                                                <th>Chất vải</th>
                                                <th>Form</th>
                                                <th>Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            <c:forEach items="${listAos}" var="list">
                                                <tr>
                                                    <td>${list.ma}</td>
                                                    <td>${list.ten}</td>
                                                    <td style="width: 100px">
                                                        <img style="width: 100px; border: 1px solid #3bac8b; padding: 5px;"
                                                             src="/images/${list.anhs.get(0).ten_url}" alt="">
                                                    </td>
                                                    <td>${list.hang.ten}</td>
                                                    <td>${list.loaiAo.ten}</td>
                                                    <td>${list.chatVai.ten}</td>
                                                    <td>${list.form.ten}</td>

                                                    <td>
                                                        <button class="btn btn-warning" type="submit"
                                                                id="addButton1" formaction="/admin/ban-quay/ao-detail" name="idSp" value="${list.id}">Chọn
                                                        </button>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th>Mã</th>
                                                <th>Tên</th>
                                                <th>Ảnh</th>
                                                <th>Hãng</th>
                                                <th>Loại</th>
                                                <th>Chất vải</th>
                                                <th>Form</th>
                                                <th>Action</th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div id="addFormContainer1" style="display: ${noneOrBlock};border: 2px">
            <div class="container-fluid " style="margin-top: 160px; ">
                <div class="card " style="width: 1000px; height: 450px">
                    <div class="row px-xl-5 m-3 ">
                        <div class="col-lg-5 mb-30 border">
                            <div id="product-carousel" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner bg-light">
                                    <c:forEach items="${anhs}" var="list" varStatus="status">
                                        <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                            <img class="" style="width: 100%; height: 400px"
                                                 src="/images/${list.ten_url}" alt="Image">
                                        </div>
                                    </c:forEach>
                                </div>
                                <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                                    <i class="fa fa-2x fa-angle-left text-dark"></i>
                                </a>
                                <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                                    <i class="fa fa-2x fa-angle-right text-dark"></i>
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-7 h-auto mb-30 border">
                            <div class="h-100 bg-light p-30">
                                <h3 class="ml-2">${ao.ten}</h3>
                                <c:choose>
                                    <c:when test="${giamgia != 2}">
                                        <div class="gia">
                                            <p class="ml-2">
                                                <del><fmt:formatNumber value="${ao.giaBan}" type="currency"
                                                                       currencySymbol="VNĐ"/></del>
                                                <strong><fmt:formatNumber value="${ao.giaBan * (100 - giamgia) / 100}"
                                                                          type="currency"
                                                                          currencySymbol="VNĐ"/></strong>
                                            </p>
                                        </div>
                                    </c:when>
                                    <c:when test="${giamgia == 2}">
                                        <div class="gia">
                                            <p class="ml-2">
                                                <strong><fmt:formatNumber value="${ao.giaBan}" type="currency"
                                                                          currencySymbol="VNĐ"/></strong>
                                            </p>
                                        </div>
                                    </c:when>
                                </c:choose>
                                <div><h6 class="ml-2"><strong>${slAoDaBan}</strong> sản phẩm đã bán</h6></div>
                                <div id="soLuongTonStr" class="ml-2"></div>
                                <input type="hidden" id="soLuongTon">
                                <form method="post">
                                    <input type="hidden" name="idAo" value="${ao.id}" id="idAo">
                                    <div class="d-flex mb-4 mt-4">
                                        <strong class="text-dark mr-3 ml-2">Colors:</strong>
                                        <c:forEach items="${mauSacs}" var="list" varStatus="vTri">
                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input type="radio" id="radio${vTri.index + 1}" name="mauSac"
                                                       value="${list.id}">
                                                <label class="radio-label" for="radio${vTri.index + 1}"><span
                                                        style="padding-left: 10px;padding-top: 5px">${list.ten}</span></label>

                                                    <%--                                <input type="radio" class="custom-control-input" id="color-${vTri.index + 1}" name="mauSac" value="${list.id}">--%>
                                                    <%--                                <label class="custom-control-label" for="color-${vTri.index + 1}">${list.ten}</label>--%>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="d-flex mb-3">
                                        <strong class="text-dark mr-3 ml-2">Sizes:</strong>
                                        <c:forEach items="${sizes}" var="list" varStatus="vTri">
                                            <div class="custom-control custom-radio custom-control-inline"
                                                 style="margin-left: 8px">
                                                <input type="radio" id="size${vTri.index + 1}" name="size"
                                                       value="${list.id}">
                                                <label class="radio-label" for="size${vTri.index + 1}"><span
                                                        style="padding-left: 10px;padding-top: 5px">${list.ten}</span></label>

                                                    <%--                                <input type="radio" class="custom-control-input" id="size-${vTri.index + 1}" name="size" value="${list.id}">--%>
                                                    <%--                                <label class="custom-control-label" for="size-${vTri.index + 1}">${list.ten}</label>--%>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="d-flex align-items-center mb-4 pt-2 ml-2">
                                        <div class="input-group quantity mr-3" style="width: 130px;" id="mauSacAndSize">
                                            <div class="input-group-append">
                                                <button class="btn btn-warning btn-minus" type="button" onclick="decreaseQuantity()">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                                <input type="text" class="form-control bg-light border-0 text-center" value="1"
                                                       name="sl" id="quantityInput">
                                                <button class="btn btn-warning btn-plus" type="button" onclick="increaseQuantity()">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <input type="hidden" value="${idHoaDon}" name="idHoaDon">
                                        <button class="btn btn-warning px-3 ml-2"
                                                formaction="/admin/ban-quay/add_gio_hang/${idHoaDon}"
                                                onclick="addProduct()"><i class="fa fa-shopping-cart mr-1"></i> Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--        <div id="addFormContainer2" style="display: none;border: 2px">--%>
        <%--            <div class="container-fluid" style="margin-top: 100px">--%>
        <%--                <div class="container">--%>
        <%--                    <form method="post">--%>

        <%--                        <div class="card">--%>

        <%--                            <h3 style="text-align: center; padding-top: 4px"> Danh sách khách hàng</h3>--%>
        <%--                            <!-- /.card-header -->--%>
        <%--                            <div class="card-body">--%>
        <%--                                <table id="example2"  class="table table-bordered table-striped">--%>

        <%--                                    <thead>--%>
        <%--                                    <tr>--%>
        <%--                                        <th>Tên</th>--%>
        <%--                                        <th>Ngày Sinh</th>--%>
        <%--                                        <th>Giới Tính</th>--%>
        <%--                                        <th>Địa chỉ</th>--%>
        <%--                                        <th>SDT</th>--%>
        <%--                                        <th>Email</th>--%>
        <%--                                        <th>Trạng thái</th>--%>
        <%--                                        <th>Action</th>--%>
        <%--                                    </tr>--%>
        <%--                                    </thead>--%>
        <%--                                    <tbody>--%>
        <%--                                    <c:forEach items="${listKhachHang}" var="list">--%>
        <%--                                        <tr>--%>

        <%--                                            <td>${list.ten}</td>--%>
        <%--                                            <td> ${list.ngay_sinh}</td>--%>
        <%--                                                &lt;%&ndash;                                            <td> ${list.ngay_sinh.format(DateTimeFormatter.ofPattern('dd/MM/yyyy HH:mm:ss'))}</td>&ndash;%&gt;--%>
        <%--                                            <td>${list.gioiTinh==1?"Nam":"Nữ"}</td>--%>
        <%--                                            <td>${list.dia_chi}, ${list.thanh_pho}, ${list.quoc_gia}</td>--%>
        <%--                                            <td>${list.sdt}</td>--%>
        <%--                                            <td>${list.email}</td>--%>
        <%--                                            <td>${list.trangThai==1?'Hoạt Động':'Ngừng Hoạt Động'}</td>--%>
        <%--                                            <td>--%>
        <%--                                                <input type="hidden" value="${idHoaDon}" name="idHoaDon">--%>
        <%--                                                <button class="btn btn-primary px-3"--%>

        <%--                                                        formaction="/admin/ban-quay/update-khach-hang/${list.id}">--%>
        <%--                                                    Chọn--%>
        <%--                                                </button>--%>
        <%--                                            </td>--%>
        <%--                                        </tr>--%>
        <%--                                    </c:forEach>--%>
        <%--                                    </tbody>--%>
        <%--                                    <tfoot>--%>
        <%--                                    <tr>--%>
        <%--                                        <th>Tên</th>--%>
        <%--                                        <th>Ngày Sinh</th>--%>
        <%--                                        <th>Giới Tính</th>--%>
        <%--                                        <th>Địa chỉ</th>--%>
        <%--                                        <th>SDT</th>--%>
        <%--                                        <th>Email</th>--%>
        <%--                                        <th>Trạng thái</th>--%>
        <%--                                        <th>Action</th>--%>
        <%--                                    </tr>--%>
        <%--                                    </tfoot>--%>
        <%--                                </table>--%>
        <%--                            </div>--%>
        <%--                            <!-- /.card-body -->--%>
        <%--                        </div>--%>
        <%--                    </form>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../../../resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../../resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="../../../resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../../resources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../../resources/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../../resources/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../../resources/plugins/jszip/jszip.min.js"></script>
<script src="../../../resources/plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../../resources/plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="../../../resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../../resources/dist/js/demo.js"></script>
<!-- Page specific script -->

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="../../../resources/lib/easing/easing.min.js"></script>
<script src="../../../resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="../../../resources/mail/jqBootstrapValidation.min.js"></script>
<script src="../../../resources/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="../../../resources/js/main.js"></script>

<script>
    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });
    });
</script>

<script>

    var input1 = document.getElementById("quantityInput");

    // Thêm sự kiện "input" để kiểm tra mỗi khi người dùng nhập
    input1.addEventListener("input", function () {
        // Lấy giá trị hiện tại của input
        var value = this.value;

        // Sử dụng biểu thức chính quy để kiểm tra nếu giá trị chứa dấu trừ hoặc chữ cái
        if (/[-a-zA-Z]/.test(value)) {
            // Nếu có, loại bỏ chúng và cập nhật giá trị
            value = value.replace(/[-a-zA-Z]/g, "");
            this.value = value;
        }
    });

    function increaseQuantity() {
        var input = document.getElementById("quantityInput").value;
        var soLuongTon = document.getElementById("soLuongTon").value;

        var value = parseFloat(input);
        var sl = parseFloat(soLuongTon);

        if (value < sl - 1) {
            var min = value++;
            document.getElementById("quantityInput").value = min.toFixed(0);
        } else {
            var max = sl - 1;
            document.getElementById("quantityInput").value = max.toFixed(0);
        }
    }

    function decreaseQuantity() {
        var input = document.getElementById("quantityInput").value;
        var value = parseFloat(input);

        if (value > 0) {
            var min = value--;
            document.getElementById("quantityInput").value = min.toFixed(0);
        } else {
            var max = 0;
            document.getElementById("quantityInput").value = max.toFixed(0);
        }
    }

    function addProduct() {

        var input = document.getElementById("quantityInput").value;
        var value = parseFloat(input);

        var soLuongTon = document.getElementById("soLuongTon").value;
        var sl = parseFloat(soLuongTon);

        var selectedMauSac = document.querySelector('input[name="mauSac"]:checked');
        var selectedSize = document.querySelector('input[name="size"]:checked');

        var hasError = false;

        if (!selectedMauSac || !selectedSize) {
            addFormContainer.style.display = "none";
            addFormContainer1.style.display = "none";
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Vui lòng chọn cả màu sắc và kích thước áo</div><div class="progress-bar-container"></div>',
                allowOutsideClick: true // Cho phép đóng thông báo bằng cách nhấp bên ngoài
            });
            setTimeout(() => {
                Swal.close();
                addFormContainer.style.display = "block";
                addFormContainer1.style.display = "block";
            }, 1000);
            hasError = true;
        }
        if (sl == 0) {
            addFormContainer.style.display = "none";
            addFormContainer1.style.display = "none";
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Sản phẩm đã hết, bạn vui lòng chọn sản phẩm khác</div><div class="progress-bar-container"></div>',
                allowOutsideClick: true // Cho phép đóng thông báo bằng cách nhấp bên ngoài
            });
            setTimeout(() => {
                Swal.close();
                addFormContainer.style.display = "block";
                addFormContainer1.style.display = "block";
            }, 1000);
            hasError = true;
        }
        if (value > sl) {
            addFormContainer.style.display = "none";
            addFormContainer1.style.display = "none";
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Số lượng tồn không đủ</div><div class="progress-bar-container"></div>',
                allowOutsideClick: true // Cho phép đóng thông báo bằng cách nhấp bên ngoài
            });
            setTimeout(() => {
                Swal.close();
                addFormContainer.style.display = "block";
                addFormContainer1.style.display = "block";
            }, 1000);
            hasError = true;
        }
        if (hasError) {
            event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
        }
    }

</script>

<script>
    function kiemTra() {

        var listHoaDonChiTiet = ${listHoaDonChiTiets}; // Use the appropriate way to get the list from your server-side code
        var hasError = false;
        for (var i = 0; i < 99; i++) {
            var slTon = parseFloat(document.getElementById("slTon" + (i + 1)).value); // Sửa lỗi ở đây
            var sl = parseFloat(document.getElementById("sl" + (i + 1)).value); // Sửa lỗi ở đây

            console.log(sl);
            console.log(slTon);

            if (listHoaDonChiTiet.length === 0) {
                Swal.fire({
                    icon: 'info',
                    html: '<div class="swal-text">Giỏ hàng của bạn hiện đang trống. Vui lòng thêm sản phẩm vào giỏ hàng.</div>',
                    allowOutsideClick: true,
                });
                setTimeout(() => {
                    Swal.close();
                }, 1000);
                hasError = true;
            }

            if (sl > slTon) {
                Swal.fire({
                    icon: 'warning',
                    html: '<div class="swal-text">Số lượng tồn không đủ</div><div class="progress-bar-container"></div>', // Ẩn nút "Oke"
                    allowOutsideClick: true,
                });
                setTimeout(() => {
                    Swal.close();
                }, 1000);
                hasError = true;
            }
            if (hasError) {
                event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
            }
        }


    }
</script>

<script>

    var mauSacAndSizeDiv = document.getElementById("mauSacAndSize");

    // Ẩn div mauSacAndSize ban đầu
    mauSacAndSizeDiv.style.display = "none";

    function updateProductAvailability() {
        var selectedColor = document.querySelector("input[name='mauSac']:checked");
        var selectedSize = document.querySelector("input[name='size']:checked");

        if (selectedColor && selectedSize) {
            var colorId = selectedColor.value;
            var sizeId = selectedSize.value;
            var idAo = document.getElementById("idAo").value;

            // Tạo đối tượng XMLHttpRequest
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "/find/" + idAo + "/" + colorId + "/" + sizeId, true);

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    if (response > 0) {
                        // Cập nhật nội dung của phần tử div
                        document.getElementById("soLuongTonStr").textContent = "Số lượng sản phẩm còn lại: " + response;
                        document.getElementById("soLuongTon").value = response;

                    } else {
                        document.getElementById("soLuongTonStr").textContent = "Đã hết sản phẩm";
                        document.getElementById("soLuongTon").value = 0;
                    }
                } else {
                    document.getElementById("soLuongTonStr").textContent = "Đã hết sản phẩm";
                    document.getElementById("soLuongTon").value = 0;
                }
            };

            xhr.send();

            // Hiển thị div mauSacAndSize
            mauSacAndSizeDiv.style.display = "block";
        }
    }

    // Thêm sự kiện change cho các input radio
    var colorInputs = document.querySelectorAll("input[name='mauSac']");
    var sizeInputs = document.querySelectorAll("input[name='size']");

    colorInputs.forEach(function (input) {
        input.addEventListener("change", updateProductAvailability);
    });

    sizeInputs.forEach(function (input) {
        input.addEventListener("change", updateProductAvailability);
    });
</script>



<script>
    var vTriStr = document.getElementById("vTri").value;

    var vTri = parseFloat(vTriStr);

    for (vTri = 1; vTri < 99; vTri++) {
        var gia = parseFloat(document.getElementById("donGia1" + vTri).value);

        var gia1 = gia;
        var gia1Formatted = gia1.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency = gia1Formatted + " VNĐ";

        document.getElementById("abc" + vTri).value = gia1WithCurrency;
    }

    function updateSL(vTri) {

        var slStr = document.getElementById("sl" + vTri).value;

        var sl = parseFloat(slStr);

        if (isNaN(sl)) {
            sl = 0; // Set it to 0 if it's NaN
        }

        var giaStr = document.getElementById("gia" + vTri).textContent;

        var gia = parseFloat(giaStr);

        if (isNaN(gia)) {
            gia = 0; // Set it to 0 if it's NaN
        }

        var tongTien = sl * gia * 1000;

        document.getElementById("donGia1" + vTri).value = tongTien.toFixed(0);

        var gia1Formatted1 = tongTien.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency1 = gia1Formatted1 + " VNĐ";

        document.getElementById("abc" + vTri).value = gia1WithCurrency1;

    }

</script>

<script>
    // Hàm tính tổng giá trị khi số lượng hoặc giá trị đơn giá thay đổi
    function calculateTotal() {
        var donGiaElements = document.getElementsByName("donGia");
        var total = 0;

        for (var i = 0; i < donGiaElements.length; i++) {
            var rowIndex = donGiaElements[i].getAttribute("data-index");
            var gia = parseFloat(donGiaElements[i].value);
            if (!isNaN(gia)) {
                total += gia;
            }
        }

        // var thanhTien = total;
        // Convert total to a number
        var thanhTien = parseFloat(total);

        if (isNaN(thanhTien)) {
            thanhTien = 0; // Set it to 0 if it's NaN
        }

        var totalElement = document.getElementById("total");
        var totalElement1 = document.getElementById("total1");

        var gia1Formatted2 = thanhTien.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

        totalElement.textContent = gia1WithCurrency2;
        totalElement1.textContent = gia1WithCurrency2;
    }

    // Bắt sự kiện thay đổi giá trị số lượng
    var soLuongInputs = document.getElementsByName("soLuong");
    for (var i = 0; i < soLuongInputs.length; i++) {
        soLuongInputs[i].addEventListener("input", function (event) {
            var rowIndex = event.target.getAttribute("data-index");
            var sl = parseFloat(event.target.value);
            var giaElement = document.getElementById("gia" + rowIndex);
            var gia = parseFloat(giaElement.textContent);
            var donGiaElement = document.getElementById("donGia1" + rowIndex);
            var tongTien = sl * gia * 1000;
            donGiaElement.value = tongTien.toFixed(0);
            calculateTotal();
        });
        soLuongInputs[i].setAttribute("data-index", i + 1); // Lưu trữ index để có thể tìm các phần tử liên quan
    }

    // Trigger the initial calculation
    calculateTotal();

    function calculateChange() {
        var amountPaid = parseFloat(document.getElementById("amountPaid").value.replace(/[^0-9]/g, '')); // Remove non-numeric characters
        var total = parseFloat(document.getElementById("total").textContent.replace(/[^0-9]/g, '')); // Remove non-numeric characters


        var change = amountPaid - total;
        if (isNaN(amountPaid) || change < 0) {
            document.getElementById("changeLabel").textContent = " VNĐ";
        } else {

            // Ensure change is a whole number and format it as Vietnamese currency
            change = Math.round(change); // Round to the nearest whole number

            var changeLabel = document.getElementById("changeLabel");
            var changeFormatted = change.toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND',
                minimumFractionDigits: 0,
                maximumFractionDigits: 0
            });

            // Replace the currency symbol ₫ with VNĐ in the output string
            changeFormatted = changeFormatted.replace("₫", "VNĐ");

            changeLabel.textContent = changeFormatted;
        }
    }

    // Trigger the initial calculation with 0 VNĐ as the default value
    calculateChange();
</script>

<script>
    // JavaScript để lấy giá trị từ <label> và gán vào input hidden
    var totalLabel = parseInt(document.getElementById("total").textContent.replace(/[^0-9]/g, ''));
    var tongTienInput = document.getElementById("tongTienInput");

    // Lấy giá trị từ <label> và gán vào input hidden
    tongTienInput.value = totalLabel;
</script>

<%--<script>--%>

<%--    // Get the current URL--%>
<%--    var currentURL = window.location.href;--%>

<%--    // Define the dynamic parameter value--%>
<%--    var dynamicParam = "${hoaDon.id}";--%>

<%--    // Build the dynamic URL by appending the parameter--%>
<%--    var dynamicURL = "http://localhost:8080/admin/form/view/" + dynamicParam;--%>

<%--    if (window.location.href === dynamicURL) {--%>
<%--        // If the URL matches, show the form container--%>
<%--        addFormContainer.style.display = "none";--%>
<%--    } else {--%>
<%--        addFormContainer.style.display = "block";--%>
<%--    }--%>
<%--    function clickThem() {--%>
<%--        event.preventDefault(); // Ngăn chặn submit form nếu có lỗi--%>
<%--    }--%>
<%--</script>--%>
<script>
    // Get references to the button and form container
    var addButton = document.getElementById("addButton");
    var addFormContainer = document.getElementById("addFormContainer");

    // Add an event listener to the button
    addButton.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer.style.display === "none" || addFormContainer.style.display === "") {
            addFormContainer.style.display = "block";
        } else {
            addFormContainer.style.display = "none";
        }
    });

    // Add an event listener to the background overlay
    addFormContainer.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer) {
            // Hide the form
            addFormContainer.style.display = "none";
        }
    });

    function clickThem() {
        event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
    }

</script>
<%--<script>--%>
<%--    // Get references to the button and form container--%>
<%--    var addButton3 = document.getElementById("addButton3");--%>
<%--    var addFormContainer3 = document.getElementById("addFormContainer3");--%>

<%--    // Add an event listener to the button--%>
<%--    addButton3.addEventListener("click", function () {--%>
<%--        // Toggle the visibility of the form container--%>
<%--        if (addFormContainer3.style.display === "none" || addFormContainer3.style.display === "") {--%>
<%--            addFormContainer3.style.display = "block";--%>
<%--        } else {--%>
<%--            addFormContainer3.style.display = "none";--%>
<%--        }--%>
<%--    });--%>

<%--    // Add an event listener to the background overlay--%>
<%--    addFormContainer3.addEventListener("click", function (event) {--%>
<%--        // Check if the click occurred outside the form--%>
<%--        if (event.target === addFormContainer3) {--%>
<%--            // Hide the form--%>
<%--            addFormContainer3.style.display = "none";--%>
<%--        }--%>
<%--    });--%>

<%--    function clickTrangChu() {--%>
<%--        event.preventDefault(); // Ngăn chặn submit form nếu có lỗi--%>
<%--    }--%>

<%--</script>--%>

<script>

    var addFormContainer5 = document.getElementById("addFormContainer");
    var addFormContainer6 = document.getElementById("addFormContainer1");

    var noneOrBlock = ${noneOrBlock};

</script>

<script>
    // Get references to the button and form container
    var addButton1 = document.getElementById("addButton1");
    var addFormContainer1 = document.getElementById("addFormContainer1");

    // Add an event listener to the button
    addButton1.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer1.style.display === "none" || addFormContainer1.style.display === "") {
            addFormContainer1.style.display = "block";
        } else {
            addFormContainer1.style.display = "none";
        }
    });

    // Add an event listener to the background overlay
    addFormContainer1.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer1) {
            // Hide the form
            addFormContainer1.style.display = "none";
        }
    });

</script>
<script>
    // Get references to the button and form container
    var addButton2 = document.getElementById("addButton2");
    var addFormContainer2 = document.getElementById("addFormContainer2");

    // Add an event listener to the button
    addButton2.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer2.style.display === "none" || addFormContainer2.style.display === "") {
            addFormContainer2.style.display = "block";
        } else {
            addFormContainer2.style.display = "none";
        }
    });
    //Click khoảng trống
    // Add an event listener to the background overlay
    addFormContainer2.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer2) {
            // Hide the form
            addFormContainer2.style.display = "none";
        }
    });

</script>

<script>

    var gia = parseFloat(document.getElementById("price").value);
    var gia1 = gia;
    document.getElementById("price1").value = gia1.toFixed(0);

    var gia1Formatted1 = gia.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

    var gia1WithCurrency1 = gia1Formatted1 + " VNĐ";

    document.getElementById("price").value = gia1WithCurrency1;

    function togglePaymentDetails1() {
        var ctggDetails = document.getElementById("ctgg-details");
        var ctggRadio = document.getElementById("ctgg");

        if (ctggRadio.checked) {
            ctggDetails.style.display = "block";
        }
    }

    function updatePrice(radioButton) {
        var priceInput = document.getElementById("price");
        var currentPrice = parseFloat(${tongTien});
        var selectedValue = parseFloat(radioButton.value);
        var newPrice = currentPrice - (currentPrice * selectedValue / 100);

        var gia1Formatted = newPrice.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency = gia1Formatted + " VNĐ";

        priceInput.value = gia1WithCurrency;
    }

    function toggleView(elementId) {
        var element = document.getElementById(elementId);
        element.style.display = (element.style.display === "block") ? "none" : "block";
    }


</script>
<script>
    function showCondition(condition) {
        document.getElementById("condition-text").innerHTML = condition;
        document.getElementById("condition-popup").style.display = "block";
    }

    function closeCondition() {
        document.getElementById("condition-popup").style.display = "none";
    }
</script>
<%--<script>--%>
<%--    //Khách hàng--%>
<%--    const spanElement = document.querySelector('#khachHangLabel span');--%>

<%--    var khachHanglb = "${khachHang.ten}";--%>
<%--    var khachHangTen = "Khách lẻ";--%>

<%--    console.log(khachHanglb);--%>
<%--    console.log(khachHangTen);--%>
<%--    // Kiểm tra nếu giá trị của khachHang.ten là null hoặc không được định nghĩa--%>
<%--    if (!khachHanglb || khachHanglb.trim() === "") {--%>
<%--        spanElement.textContent = khachHangTen;--%>
<%--    } else {--%>
<%--        spanElement.textContent = khachHanglb;--%>
<%--    }--%>
<%--</script>--%>

<%--<script>--%>

<%--    var checkbox1 = document.getElementById("checkbox1");--%>
<%--    var checkbox2 = document.getElementById("checkbox2");--%>

<%--    // Thêm sự kiện cho checkbox1 để kiểm tra trạng thái của checkbox2--%>
<%--    checkbox1.addEventListener("change", function () {--%>
<%--        if (checkbox1.checked) {--%>
<%--            checkbox2.checked = false;--%>
<%--        }--%>
<%--    });--%>

<%--    // Thêm sự kiện cho checkbox2 để kiểm tra trạng thái của checkbox1--%>
<%--    checkbox2.addEventListener("change", function () {--%>
<%--        if (checkbox2.checked) {--%>
<%--            checkbox1.checked = false;--%>
<%--        }--%>
<%--    });--%>

<%--    // JavaScript code để kiểm tra địa chỉ cũ--%>
<%--    function kiemTraDiaChiCu() {--%>
<%--        var diaChiCu = document.getElementById("diaChiCu").value;--%>
<%--        var priceInput = document.getElementById("price");--%>
<%--        var priceInput1 = document.getElementById("price1");--%>
<%--        var currentPrice = parseFloat(${tongTien});--%>
<%--        if (diaChiCu.includes("Hà Nội")) {--%>
<%--            var ship = 20000;--%>
<%--        } else if (diaChiCu.includes("Bắc Ninh")) {--%>
<%--            var ship = 25000;--%>
<%--        } else if (diaChiCu.includes("Hồ Chí Minh")) {--%>
<%--            var ship = 80000;--%>
<%--        } else if (diaChiCu.includes("Hải Dương")) {--%>
<%--            var ship = 25000;--%>
<%--        } else if (diaChiCu.includes("Quảng Ninh")) {--%>
<%--            var ship = 40000;--%>
<%--        }--%>
<%--        var tongSoTien = currentPrice + ship;--%>
<%--        priceInput1.value = tongSoTien;--%>

<%--        var gia1Formatted3 = ship.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});--%>

<%--        var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";--%>

<%--        document.getElementById("ship").value = gia1WithCurrency3;--%>

<%--        var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});--%>

<%--        var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";--%>

<%--        priceInput.value = gia1WithCurrency2;--%>
<%--    }--%>

<%--    // JavaScript code để kiểm tra địa chỉ mới sau khi nhập xong và rời khỏi ô văn bản--%>
<%--    function kiemTraDiaChiMoi() {--%>
<%--        var diaChiMoi = document.getElementById("diaChiMoi").value;--%>
<%--        var priceInput = document.getElementById("price");--%>
<%--        var priceInput1 = document.getElementById("price1");--%>
<%--        var currentPrice = parseFloat(${tongTien});--%>
<%--        if (diaChiMoi.includes("Hà Nội")) {--%>
<%--            var ship = 20000;--%>
<%--        } else if (diaChiMoi.includes("Bắc Ninh")) {--%>
<%--            var ship = 25000;--%>
<%--        } else if (diaChiMoi.includes("Hồ Chí Minh")) {--%>
<%--            var ship = 80000;--%>
<%--        } else if (diaChiMoi.includes("Hải Dương")) {--%>
<%--            var ship = 25000;--%>
<%--        } else if (diaChiMoi.includes("Quảng Ninh")) {--%>
<%--            var ship = 40000;--%>
<%--        }--%>

<%--        var tongSoTien = currentPrice + ship;--%>
<%--        priceInput1.value = tongSoTien;--%>

<%--        var gia1Formatted3 = ship.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});--%>

<%--        var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";--%>

<%--        document.getElementById("ship").value = gia1WithCurrency3;--%>

<%--        var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});--%>

<%--        var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";--%>

<%--        priceInput.value = gia1WithCurrency2;--%>
<%--    }--%>
<%--</script>--%>

<script>
    $(document).ready(function () {
        $('#searchText1').on('input', function () {
            var searchText = $(this).val().toLowerCase();
            $('#example1 tbody tr').each(function () {
                var rowText = $(this).text().toLowerCase();
                if (rowText.includes(searchText)) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function () {
        // Sự kiện thay đổi combobox
        $('#searchText2').on('change', function () {
            var selectedValue = $(this).val().toLowerCase();

            // Hiển thị tất cả dòng trong bảng trước
            $('#example1 tbody tr').show();

            // Kiểm tra giá trị của từng dòng và ẩn dòng không khớp
            $('#example1 tbody tr').each(function () {
                var rowText = $(this).text().toLowerCase();
                if (!rowText.includes(selectedValue)) {
                    $(this).hide();
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function () {
        // Sự kiện thay đổi combobox
        $('#searchText3').on('change', function () {
            var selectedValue = $(this).val().toLowerCase();

            // Hiển thị tất cả dòng trong bảng trước
            $('#example1 tbody tr').show();

            // Kiểm tra giá trị của từng dòng và ẩn dòng không khớp
            $('#example1 tbody tr').each(function () {
                var rowText = $(this).text().toLowerCase();
                if (!rowText.includes(selectedValue)) {
                    $(this).hide();
                }
            });
        });
    });
</script>

</body>
</html>
