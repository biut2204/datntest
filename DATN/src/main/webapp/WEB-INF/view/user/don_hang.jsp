<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>MultiShop - Online Shop Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="../../../resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../../../resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="../../../resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../../../resources/css/style.css" rel="stylesheet">
    <style>
        /* Style tab buttons */
        /* Style tab buttons */
        .tab {
            display: inline-block;
            padding: 10px 20px;
            background-color: #ccc;
            cursor: pointer;
            border: 1px solid #aaa;
            border-bottom: none; /* Loại bỏ viền dưới của tab */
            margin-right: 5px;
            border-radius: 5px 5px 0 0;
        }

        /* Style the content */
        .tab-content {
            display: none;
            padding: 20px;
            border: 1px solid #aaa;
            border-top: none;
        }

        /* Change background color of active tab */
        .active {
            background-color: #007bff;
            color: #fff;
            border-bottom: 1px solid #007bff; /* Thêm viền dưới khi tab được chọn */
        }

        .active-tab {
            border-bottom: 2px solid orange;
        }

        .divider {
            border-bottom: 1px dashed #aaa;
            margin: 10px 0;
        }

        /* CSS cho mã hóa đơn */
        .invoice-code {
            font-size: 24px;
            font-weight: bold;
        }

        /* CSS cho thông tin sản phẩm */
        .product-info {
            margin: 10px 0;
        }

        /* CSS cho đơn giá */
        .total-price {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
        }

        /* CSS cho nút (button) */
        button {
            background-color: #007bff; /* Màu nền */
            color: #fff; /* Màu chữ */
            border: none; /* Loại bỏ viền */
            padding: 10px 20px; /* Kích thước nút */
            border-radius: 5px; /* Bo góc */
            cursor: pointer; /* Con trỏ khi di chuột qua nút */
        }

        button:hover {
            background-color: #0056b3; /* Màu nền khi hover qua nút */
        }

    </style>
</head>

<body>
<!-- Topbar Start -->
<div class="container-fluid">
    <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
        <div class="col-lg-4">
            <a href="/user/trang_chu/${idKh}" class="text-decoration-none">
                <span class="h1 text-uppercase text-primary bg-dark px-2">SD</span>
                <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">99</span>
            </a>
        </div>
        <div class="col-lg-4 col-6 text-left">
            <form method="post">
                <div class="input-group">
                    <input type="text" class="form-control" name="timKiem" placeholder="Search for products">
                    <div class="input-group-append">
                        <button class="input-group-text bg-transparent text-primary"
                                formaction="/user/tim_kiem/${idKh}">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-4 col-6 text-right">
            <p class="m-0">Customer Service</p>
            <h5 class="m-0">+012 345 6789</h5>
        </div>
    </div>
</div>
<!-- Topbar End -->


<!-- Navbar Start -->
<div class="container-fluid bg-dark mb-30">
    <div class="row px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse"
               href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Categories</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
                 id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                <div class="navbar-nav w-100">
                    <div class="nav-item dropdown dropright">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Dresses <i
                                class="fa fa-angle-right float-right mt-1"></i></a>
                        <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
                            <a href="" class="dropdown-item">Men's Dresses</a>
                            <a href="" class="dropdown-item">Women's Dresses</a>
                            <a href="" class="dropdown-item">Baby's Dresses</a>
                        </div>
                    </div>
                    <a href="" class="nav-item nav-link">Shirts</a>
                    <a href="" class="nav-item nav-link">Jeans</a>
                    <a href="" class="nav-item nav-link">Swimwear</a>
                    <a href="" class="nav-item nav-link">Sleepwear</a>
                    <a href="" class="nav-item nav-link">Sportswear</a>
                    <a href="" class="nav-item nav-link">Jumpsuits</a>
                    <a href="" class="nav-item nav-link">Blazers</a>
                    <a href="" class="nav-item nav-link">Jackets</a>
                    <a href="" class="nav-item nav-link">Shoes</a>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <span class="h1 text-uppercase text-dark bg-light px-2">Multi</span>
                    <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="index.html" class="nav-item nav-link">Home</a>
                        <a href="shop.html" class="nav-item nav-link">Shop</a>
                        <a href="detail.html" class="nav-item nav-link">Shop Detail</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages <i
                                    class="fa fa-angle-down mt-1"></i></a>
                            <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                <a href="cart.html" class="dropdown-item">Shopping Cart</a>
                                <a href="checkout.html" class="dropdown-item">Checkout</a>
                            </div>
                        </div>
                        <a href="contact.html" class="nav-item nav-link">Contact</a>
                    </div>
                    <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                        <c:choose>
                            <c:when test="${idKh != 2}">
                                <a href="/user/don_hang/${idKh}" class="btn px-0">
                                    <i class="fa fa-user"></i>
                                    <span class="badge text-secondary border border-secondary rounded-circle"
                                          style="padding-bottom: 2px;">${idKh}</span>
                                </a>
                                <a href="/user/gio_hang/view/${idKh}" class="btn px-0 ml-3">
                                    <i class="fas fa-shopping-cart text-primary"></i>
                                    <span class="badge text-secondary border border-secondary rounded-circle"
                                          style="padding-bottom: 2px;">${soLuongSanPham}</span>
                                </a>
                            </c:when>
                            <c:when test="${idKh == 2}">
                                <a href="" class="btn px-0 ml-3">
                                    <i class="fas fa-user text-primary"></i>
                                </a>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- Navbar End -->


<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="#">Home</a>
                <a class="breadcrumb-item text-dark" href="#">Shop</a>
                <span class="breadcrumb-item">Shopping Cart</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Cart Start -->
<div class="container-fluid">
    <form method="post">
        <div class="row px-xl-5">

            <div class="col-lg-2 table-responsive mb-5">
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3">Tài khoản của tôi</span>
                </h5>
                <ul class="list-unstyled">
                    <li><i class="fas fa-info-circle" style="width: 20px"></i><a href="" style="color: black;">Thông
                        tin</a></li>
                    <li><i class="fas fa-map-marker" style="width: 20px"></i><a href="" style="color: black;">Địa
                        chỉ</a></li>
                    <li><i class="fas fa-key" style="width: 20px"></i><a href="/user/doi_mat_khau_view/${idKh}" style="color: black;">Đổi mật khẩu</a>
                    </li>
                </ul>

                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3">Đơn hàng</span>
                </h5>
                <ul class="list-unstyled" style="background-color: #ff8b33">
                    <li><i class="fas fa-shopping-cart" style="width: 20px"></i>
                        <a href="/user/don_hang/${idKh}" style="color: black;">Danh sách đơn hàng</a></li>
                </ul>
            </div>
            <div class="col-lg-10">
                <section class="content-header">
                    <div class="container-fluid">
                        <div>
                            <div class="tab" onclick="openTab('tab1')"><i class="fa fa-clock"></i> Chờ thanh toán</div>
                            <div class="tab" onclick="openTab('tab2')"><i class="fas fa-hourglass-start"></i> Chờ xác nhận</div>
                            <div class="tab" onclick="openTab('tab3')"><i class="fas fa-truck"></i> Đang giao</div>
                            <div class="tab" onclick="openTab('tab4')"><i class="fas fa-check-circle"></i> Hoàn thành</div>
                            <div class="tab" onclick="openTab('tab5')"><i class="fas fa-times"></i> Đã hủy</div>
                        </div>
                        <form method="post">
                            <div id="tab1" class="tab-content">
                                <c:forEach items="${listHoaDonDTOChuaThanhToan}" var="list">
                                    <p class="invoice-code">${list.hoaDon.ma}</p>
                                    <c:forEach items="${list.hoaDonChiTiets}" var="hdCT">
                                        <div class="product-info">
                                            <a href="/user/san_pham_detail/${idKh}/${hdCT.aoChiTiet.ao.id}" style="color: black">
                                                <p><img src="/images/${hdCT.aoChiTiet.ao.anhs.get(0).ten_url}"
                                                        style="width: 50px; height: 50px; margin-left: 40px"> ${hdCT.aoChiTiet.ao.ten}</p></a>
                                                <p style="margin-left: 40px">${hdCT.aoChiTiet.mau_sac.ten}, ${hdCT.aoChiTiet.size.ten}  x  ${hdCT.soLuong}</p>
                                        </div>
                                    </c:forEach>
                                    <p class="total-price">Thành tiền: <label
                                            style="color: red"> <fmt:formatNumber value="${list.donGia}" type="currency" currencySymbol="VNĐ" /></label></p>
                                    <p class="total-price">
                                        <a href="/user/hoa_don/view_hoa_don/${list.hoaDon.id}" class="custom-button">Thanh
                                            toán</a>
                                    </p>
                                    <div class="divider"></div>
                                </c:forEach>
                            </div>

                            <div id="tab2" class="tab-content">
                                <c:forEach items="${listHoaDonDTOChoXacNhan}" var="list">
                                    <p class="invoice-code">${list.hoaDon.ma}</p>
                                    <c:forEach items="${list.hoaDonChiTiets}" var="hdCT">
                                        <div class="product-info">
                                            <a href="/user/san_pham_detail/${idKh}/${hdCT.aoChiTiet.ao.id}" style="color: black">
                                                <p><img src="/images/${hdCT.aoChiTiet.ao.anhs.get(0).ten_url}"
                                                        style="width: 50px; height: 50px; margin-left: 40px"> ${hdCT.aoChiTiet.ao.ten}</p></a>
                                            <p style="margin-left: 40px">${hdCT.aoChiTiet.mau_sac.ten}, ${hdCT.aoChiTiet.size.ten}  x  ${hdCT.soLuong}</p>
                                        </div>
                                    </c:forEach>
                                    <p class="total-price">Thành tiền: <label
                                            style="color: red"> <fmt:formatNumber value="${list.hoaDon.tongTien}" type="currency" currencySymbol="VNĐ" /></label></p>
                                    <p class="total-price">
                                        <button formaction="/user/hoa_don/huy" name="idHoaDon" value="${list.hoaDon.id}"
                                                class="custom-button">Hủy
                                        </button>
                                    </p>
                                    <div class="divider"></div>
                                </c:forEach>
                            </div>

                            <div id="tab3" class="tab-content">
                                <c:forEach items="${listHoaDonDTODangGiao}" var="list">
                                    <p class="invoice-code">${list.hoaDon.ma}</p>
                                    <c:forEach items="${list.hoaDonChiTiets}" var="hdCT">
                                        <div class="product-info">
                                            <a href="/user/san_pham_detail/${idKh}/${hdCT.aoChiTiet.ao.id}" style="color: black">
                                                <p><img src="/images/${hdCT.aoChiTiet.ao.anhs.get(0).ten_url}"
                                                        style="width: 50px; height: 50px; margin-left: 40px"> ${hdCT.aoChiTiet.ao.ten}</p></a>
                                            <p style="margin-left: 40px">${hdCT.aoChiTiet.mau_sac.ten}, ${hdCT.aoChiTiet.size.ten}  x  ${hdCT.soLuong}</p>
                                        </div>
                                    </c:forEach>
                                    <p class="total-price">Thành tiền: <label
                                            style="color: red"> <fmt:formatNumber value="${list.hoaDon.tongTien}" type="currency" currencySymbol="VNĐ" /></label></p>
                                    <p class="total-price">
                                        <button formaction="/user/hoa_don/hoan_thanh" name="idHoaDon"
                                                value="${list.hoaDon.id}" class="custom-button">Hoàn thành
                                        </button>
                                    </p>
                                    <div class="divider"></div>
                                </c:forEach>
                            </div>
                            <div id="tab4" class="tab-content">
                                <c:forEach items="${listHoaDonDTOHoanThanh}" var="list">
                                    <p class="invoice-code">${list.hoaDon.ma}</p>
                                    <c:forEach items="${list.hoaDonChiTiets}" var="hdCT">
                                        <div class="product-info">
                                            <a href="/user/san_pham_detail/${idKh}/${hdCT.aoChiTiet.ao.id}" style="color: black">
                                                <p><img src="/images/${hdCT.aoChiTiet.ao.anhs.get(0).ten_url}"
                                                        style="width: 50px; height: 50px; margin-left: 40px"> ${hdCT.aoChiTiet.ao.ten}</p></a>
                                            <p style="margin-left: 40px">${hdCT.aoChiTiet.mau_sac.ten}, ${hdCT.aoChiTiet.size.ten}  x  ${hdCT.soLuong}</p>
                                        </div>
                                    </c:forEach>
                                    <p class="total-price">Thành tiền: <label
                                            style="color: red"> <fmt:formatNumber value="${list.hoaDon.tongTien}" type="currency" currencySymbol="VNĐ" /></label></p>
                                    <p class="total-price">
                                        <a href="/user/hoa_don/mua_lai/${list.hoaDon.id}" class="custom-button">Mua
                                            lại</a>
                                    </p>
                                    <div class="divider"></div>
                                </c:forEach>
                            </div>

                            <div id="tab5" class="tab-content">
                                <c:forEach items="${listHoaDonDTOHuy}" var="list">
                                    <p class="invoice-code">${list.hoaDon.ma}</p>
                                    <c:forEach items="${list.hoaDonChiTiets}" var="hdCT">
                                        <div class="product-info">
                                            <a href="/user/san_pham_detail/${idKh}/${hdCT.aoChiTiet.ao.id}" style="color: black">
                                                <p><img src="/images/${hdCT.aoChiTiet.ao.anhs.get(0).ten_url}"
                                                        style="width: 50px; height: 50px; margin-left: 40px"> ${hdCT.aoChiTiet.ao.ten}</p></a>
                                            <p style="margin-left: 40px">${hdCT.aoChiTiet.mau_sac.ten}, ${hdCT.aoChiTiet.size.ten}  x  ${hdCT.soLuong}</p>
                                        </div>
                                    </c:forEach>
                                    <p class="total-price">Thành tiền: <label
                                            style="color: red"> <fmt:formatNumber value="${list.donGia}" type="currency" currencySymbol="VNĐ" /></label></p>
                                    <p class="total-price">
                                        <a href="/user/hoa_don/mua_lai/${list.hoaDon.id}" class="custom-button">Mua
                                            lại</a>
                                    </p>
                                    <div class="divider"></div>
                                </c:forEach>
                            </div>
                        </form>
                    </div><!-- /.container-fluid -->
                </section>
            </div>
        </div>
    </form>
</div>
<!-- Cart End -->


<!-- Footer Start -->
<div class="container-fluid bg-dark text-secondary mt-5 pt-5">
    <div class="row px-xl-5 pt-5">
        <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
            <h5 class="text-secondary text-uppercase mb-4">Get In Touch</h5>
            <p class="mb-4">No dolore ipsum accusam no lorem. Invidunt sed clita kasd clita et et dolor sed dolor. Rebum
                tempor no vero est magna amet no</p>
            <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
            <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
            <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
        </div>
        <div class="col-lg-8 col-md-12">
            <div class="row">
                <div class="col-md-4 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">Quick Shop</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                        <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">My Account</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                        <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">Newsletter</h5>
                    <p>Duo stet tempor ipsum sit amet magna ipsum tempor est</p>
                    <form action="">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Your Email Address">
                            <div class="input-group-append">
                                <button class="btn btn-primary">Sign Up</button>
                            </div>
                        </div>
                    </form>
                    <h6 class="text-secondary text-uppercase mt-4 mb-3">Follow Us</h6>
                    <div class="d-flex">
                        <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row border-top mx-xl-5 py-4" style="border-color: rgba(256, 256, 256, .1) !important;">
        <div class="col-md-6 px-xl-0">
            <p class="mb-md-0 text-center text-md-left text-secondary">
                &copy; <a class="text-primary" href="#">Domain</a>. All Rights Reserved. Designed
                by
                <a class="text-primary" href="https://htmlcodex.com">HTML Codex</a>
            </p>
        </div>
        <div class="col-md-6 px-xl-0 text-center text-md-right">
            <img class="img-fluid" src="img/payments.png" alt="">
        </div>
    </div>
</div>
<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/lib/easing/easing.min.js"></script>
<script src="../../../resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="../../../resources/mail/jqBootstrapValidation.min.js"></script>
<script src="../../../resources/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="../../../resources/js/main.js"></script>
<script>
    function openTab(tabId) {
        var tabs = document.getElementsByClassName("tab-content");
        for (var i = 0; i < tabs.length; i++) {
            tabs[i].style.display = "none";
        }
        var tabButtons = document.getElementsByClassName("tab");
        for (var i = 0; i < tabButtons.length; i++) {
            tabButtons[i].classList.remove("active");
        }
        document.getElementById(tabId).style.display = "block";
        document.querySelector(".tab[onclick='openTab(\"" + tabId + "\")']").classList.add("active");
        document.querySelector(".tab[onclick='openTab(\"" + tabId + "\")']").classList.add("active-tab"); // Thêm class active-tab cho tab được chọn
    }

</script>
</body>

</html>