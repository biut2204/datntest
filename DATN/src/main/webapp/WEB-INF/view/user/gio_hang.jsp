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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.js"></script>
    <style>
        /* CSS cho hiệu ứng chạy thời gian 2s */
        .swal2-popup {
            position: relative;
        }

        .swal2-popup .progress-bar-container {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background-color: #007bff; /* Màu của thanh thời gian */
            animation: slide-out 2s linear; /* Hiệu ứng chạy thời gian 2s */
        }

        @keyframes slide-out {
            0% {
                width: 100%;
            }
            100% {
                width: 0%;
            }
        }

        .navbar-light .navbar-nav .nav-link:hover {
            background: #fff3c6;
            color: red; /* Change this to the desired hover color */
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
                <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Thể loại</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
                 id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                <div class="navbar-nav w-100">
                    <c:forEach items="${listLoaiAos}" var="list">
                        <a href="/user/loc_theo_loai_ao/${idKh}/${list.ma}" class="nav-item nav-link">${list.ten}</a>
                    </c:forEach>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="/user/trang_chu/${idKh}" class="nav-item nav-link active">Trang chủ</a>
                        <a href="/user/shop/${idKh}" class="nav-item nav-link">Cửa hàng</a>
                        <a href="/user/contact/${idKh}" class="nav-item nav-link">Thông tin cửa hàng</a>
                        <a href="/user/blog/${idKh}" class="nav-item nav-link">Bài viết</a>
                    </div>
                    <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                        <c:choose>
                            <c:when test="${idKh != 2}">
                                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                                    <div class="navbar-nav mr-auto py-0">
                                        <div class="nav-item dropdown">
                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"><i
                                                    class="fa fa-user" style="color: #ffd019"></i>
                                                <span class="badge text-secondary border border-secondary rounded-circle"
                                                      style="padding-bottom: 2px;">${khachHangNow.ten}</span></a>
                                            <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                                <a href="/user/thong_tin/${idKh}" class="dropdown-item">Thông tin</a>
                                                <a href="/user/don_hang/${idKh}" class="dropdown-item">Đơn hàng</a>
                                                <a href="/logout" class="dropdown-item">Đăng xuất</a>
                                            </div>
                                        </div>
                                        <a href="/user/gio_hang/view/${idKh}" class="nav-item nav-link"><i
                                                class="fas fa-shopping-cart text-primary"></i>
                                            <span class="badge text-secondary border border-secondary rounded-circle"
                                                  style="padding-bottom: 2px;">${soLuongSanPham}</span></a>
                                    </div>
                                </div>
                            </c:when>
                            <c:when test="${idKh == 2}">
                                <a href="/login" class="btn px-0 ml-3">
                                    <i class="fas fa-user text-primary"></i><span style="color: white">Đăng nhập</span>
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
                <span class="breadcrumb-item active">Shopping Cart</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Cart Start -->
<div class="container-fluid">
    <form method="post">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                    <tr>
                        <th></th>
                        <th>STT</th>
                        <th>Ảnh</th>
                        <th>Sản phẩm</th>
                        <th>Thông tin</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Đơn giá</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody class="align-middle">
                    <c:forEach items="${listGioHangChiTiets}" var="list" varStatus="vTri">
                        <tr>
                            <td class="align-middle"><input type="checkbox" name="chon" value="${vTri.index}">
                            <td class="align-middle">${vTri.index + 1}
                            <td class="align-middle"><a href="/user/san_pham_detail/${idKh}/${list.aoChiTiet.ao.id}">
                                <img
                                        src="/images/${list.aoChiTiet.ao.anhs.get(0).ten_url}" alt=""
                                        style="width: 50px;"></a>
                            </td>

                            <input type="hidden" name="idAoChiTiet" value="${list.aoChiTiet.id}">
                            <input type="hidden" id="slTon${vTri.index + 1}" value="${list.aoChiTiet.slton}">

                            <td class="align-middle" style="text-align: left"> ${list.aoChiTiet.ao.ten}</td>
                            <td class="align-middle">${list.aoChiTiet.mau_sac.ten}, ${list.aoChiTiet.size.ten}</td>
                            <td class="align-middle" id="gia${vTri.index + 1}">
                                <fmt:formatNumber value="${list.gia}" type="currency" currencySymbol="VNĐ"/>
                            </td>
                            <td class="align-middle">
                                <c:choose>
                                    <c:when test="${checkGH == 0}">
                                        <input type="number" name="soLuong" min="0" max="100" step="1"
                                               value="${list.gioHangChiTiet.soLuong}"
                                               oninput="updateSL(${vTri.index + 1})" id="sl${vTri.index + 1}">
                                    </c:when>
                                    <c:when test="${checkGH == 1}">
                                        <input type="number" name="soLuong" min="0" max="100" step="1"
                                               value="${list.hoaDonChiTiet.soLuong}"
                                               oninput="updateSL(${vTri.index + 1})" id="sl${vTri.index + 1}">
                                    </c:when>
                                </c:choose>
                            </td>
                            <td class="align-middle">
                                <c:choose>
                                    <c:when test="${checkGH == 0}">
                                        <input type="hidden" name="donGia" readonly id="donGia1${vTri.index + 1}"
                                               value="${ list.gia * list.gioHangChiTiet.soLuong}"
                                               style="border: none; background: none; text-align: center;">
                                        <input type="text" id="abc${vTri.index + 1}"
                                               style="border: none; background: none; text-align: center;">
                                        <input type="hidden" id="vTri" value="${vTri.index + 1}">
                                    </c:when>
                                    <c:when test="${checkGH == 1}">
                                        <input type="hidden" name="donGia" readonly id="donGia1${vTri.index + 1}"
                                               value="${ list.gia * list.hoaDonChiTiet.soLuong}"
                                               style="border: none; background: none; text-align: center;">
                                        <input type="text" id="abc${vTri.index + 1}"
                                               style="border: none; background: none; text-align: center;">
                                        <input type="hidden" id="vTri" value="${vTri.index + 1}">
                                    </c:when>
                                </c:choose>
                            </td>
                            <td class="align-middle">
                                <c:choose>
                                    <c:when test="${checkGH == 0}">
                                        <button class="btn btn-sm btn-danger"
                                                onclick="xoaGioHang('${list.gioHangChiTiet.id}')"><i
                                                class="fa fa-times"></i></button>
                                    </c:when>
                                    <c:when test="${checkGH == 1}">
                                        <button class="btn btn-sm btn-danger"
                                                onclick="xoaHoaDonChinhSua('${list.hoaDonChiTiet.id}')"><i
                                                class="fa fa-times"></i></button>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">TÓM TẮT GIỎ HÀNG</span>
                </h5>
                <div class="bg-light p-30 mb-5">
                    <div class="border-bottom pb-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h6>Đơn giá</h6>
                            <h5 id="total1"></h5>
                        </div>
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Tổng giá</h5>
                            <h5 id="total"></h5>
                        </div>
                        <c:choose>
                            <c:when test="${checkGH == 0}">
                                <button class="btn btn-block btn-primary font-weight-bold my-3 py-3"
                                        formaction="/user/hoa_don/add/${idKh}" onclick="kiemTra()">Xuất hóa đơn
                                </button>
                            </c:when>
                            <c:when test="${checkGH == 1}">
                                <button class="btn btn-block btn-primary font-weight-bold my-3 py-3"
                                        formaction="/user/hoa_don_chinh_sua/update/${maHoaDon}" onclick="kiemTra()">Cập
                                    nhật
                                </button>
                            </c:when>
                        </c:choose>

                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- Cart End -->


<!-- Footer Start -->
<div class="container-fluid bg-dark text-secondary mt-5 pt-5">
    <div class="row px-xl-5 pt-5">
        <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
            <h5 class="text-secondary text-uppercase mb-4">LIÊN LẠC</h5>
            <p class="mb-4">Số 19, Ngõ 204, Lê Thanh Nghị, Hai Bà Trưng, Hà Nội</p>
            <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Nhóm SD-99</p>
            <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>bang0392887284@gmail.com</p>
            <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+084 987 654 321</p>
        </div>
        <div class="col-lg-8 col-md-12">
            <div class="row">
                <div class="col-md-6 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">Cửa hàng nhanh chóng</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-secondary mb-2" href="/user/trang_chu/${idKh}"><i
                                class="fa fa-angle-right mr-2"></i>Trang chủ</a>
                        <a class="text-secondary mb-2" href="/user/view_tim_kiem/${idKh}"><i
                                class="fa fa-angle-right mr-2"></i>Cửa Hàng</a>
                        <a class="text-secondary mb-2" href="/user/contact/${idKh}"><i
                                class="fa fa-angle-right mr-2"></i>Thông tin cửa hàng</a>
                        <a class="text-secondary mb-2" href="/user/blog/${idKh}"><i class="fa fa-angle-right mr-2"></i>Bài
                            viết</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <h5 class="text-secondary text-uppercase mb-4">Vị trí cửa hàng</h5>
                    <p>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.75784392943!2d105.84125167479552!3d21.002341888686352!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac70d567c7d1%3A0x5b99cce1def5a9a9!2zMTkgTmcuIDIwNCBQLiBMw6ogVGhhbmggTmdo4buLLCDEkOG7k25nIFTDom0sIEhhaSBCw6AgVHLGsG5nLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1700558341011!5m2!1svi!2s"
                                width="400" height="200" style="border:0;" allowfullscreen="" loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </p>

                </div>
            </div>
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

        var sl;

        if (slStr.trim() === '') {
            sl = 0;
        } else {
            sl = parseFloat(slStr);
        }

        var giaStr = document.getElementById("gia" + vTri).textContent;

        var gia = parseFloat(giaStr);

        var tongTien = sl * gia * 1000;

        document.getElementById("donGia1" + vTri).value = tongTien.toFixed(0);

        var gia1Formatted1 = tongTien.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency1 = gia1Formatted1 + " VNĐ";

        document.getElementById("abc" + vTri).value = gia1WithCurrency1;

    }

</script>
<script>
    function kiemTra() {
        var checkboxes = document.querySelectorAll('input[type="checkbox"]');
        var coCheckboxDuocChon = false;

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                coCheckboxDuocChon = true;
                var slTon = parseFloat(document.getElementById("slTon" + (i + 1)).value); // Sửa lỗi ở đây
                var sl = parseFloat(document.getElementById("sl" + (i + 1)).value); // Sửa lỗi ở đây

                console.log(sl);
                console.log(slTon);

                if (sl <= 0) {
                    Swal.fire({
                        icon: 'warning',
                        html: '<div class="swal-text">Số lượng chọn nhỏ hơn 0 là không hợp lệ</div><div class="progress-bar-container"></div>', // Ẩn nút "Oke"
                        allowOutsideClick: true,
                    });
                    setTimeout(() => {
                        Swal.close();
                    }, 2000);
                    event.preventDefault();
                }

                if (sl > slTon) {
                    Swal.fire({
                        icon: 'warning',
                        html: '<div class="swal-text">Số lượng chọn quá lớn cho sản phẩm</div><div class="progress-bar-container"></div>', // Ẩn nút "Oke"
                        allowOutsideClick: true,
                    });
                    setTimeout(() => {
                        Swal.close();
                    }, 2000);
                    event.preventDefault();
                }
            }
        }

        if (!coCheckboxDuocChon) {
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Bạn chưa chọn bất kỳ mặt hàng nào.</div><div class="progress-bar-container"></div>', // Ẩn nút "Oke"
                allowOutsideClick: true,
            });
            setTimeout(() => {
                Swal.close();
            }, 2000);
            event.preventDefault();
        }
    }
</script>

<script>
    // Hàm tính tổng giá trị khi checkbox được chọn hoặc giá trị đơn giá thay đổi
    function calculateTotal() {
        var checkboxes = document.getElementsByName("chon");
        var total = 0;

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                var rowIndex = checkboxes[i].getAttribute("data-index");
                var giaElement = document.getElementById("donGia1" + rowIndex);
                var gia = parseFloat(giaElement.value);
                total += gia;
            }
        }

        var thanhTien = total;

        var totalElement = document.getElementById("total");
        var totalElement1 = document.getElementById("total1");

        var gia1Formatted2 = thanhTien.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

        totalElement.textContent = gia1WithCurrency2;
        totalElement1.textContent = gia1WithCurrency2;
    }

    // Bắt sự kiện click checkbox
    var checkboxes = document.getElementsByName("chon");
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].addEventListener("change", calculateTotal);
        checkboxes[i].setAttribute("data-index", i + 1); // Lưu trữ index để có thể tìm các phần tử liên quan
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
</script>
<script>
    function xoaGioHang(gioHangChiTietId) {
        Swal.fire({
            icon: 'warning',
            text: 'Bạn có chắc chắn muốn xóa sản phẩm khỏi giỏ hàng?',
            showCancelButton: true,
            confirmButtonText: 'Đồng ý',
            cancelButtonText: 'Hủy bỏ'
        }).then((result) => {
            if (result.isConfirmed) {
                // Nếu người dùng đồng ý đăng xuất, chuyển họ đến trang đăng xuất
                window.location.href = "/user/gio_hang/delete/${idKh}/"+gioHangChiTietId;
            }
        });
        event.preventDefault();
    }
    function xoaHoaDonChinhSua(hoaDonChinhSuaId) {
        Swal.fire({
            icon: 'warning',
            text: 'Bạn có chắc chắn muốn xóa sản phẩm khỏi hóa đơn chờ thanh toán?',
            showCancelButton: true,
            confirmButtonText: 'Đồng ý',
            cancelButtonText: 'Hủy bỏ'
        }).then((result) => {
            if (result.isConfirmed) {
                // Nếu người dùng đồng ý đăng xuất, chuyển họ đến trang đăng xuất
                window.location.href = "/user/hoa_don_chinh_sua/delete/"+hoaDonChinhSuaId;
            }
        });
        event.preventDefault();
    }
</script>
<script>
    var themThanhCong = "${themThanhCong}";
    var xoaThanhCong = "${xoaThanhCong}";
    if (themThanhCong == "2") {
        Swal.fire({
            position: 'top-end', // Vị trí của thông báo
            toast: true, // Thiết lập kiểu thông báo là "toast"
            showConfirmButton: false, // Không hiển thị nút xác nhận
            timer: 2000, // Thời gian hiển thị (đơn vị là milliseconds)
            width: '300px', // Đặt chiều rộng của thông báo
            text: 'Thêm thành công!',
            icon: 'success',
        });
    }
    if (xoaThanhCong == "2") {
        Swal.fire({
            position: 'top-end', // Vị trí của thông báo
            toast: true, // Thiết lập kiểu thông báo là "toast"
            showConfirmButton: false, // Không hiển thị nút xác nhận
            timer: 2000, // Thời gian hiển thị (đơn vị là milliseconds)
            width: '300px', // Đặt chiều rộng của thông báo
            text: 'Xóa thành công!',
            icon: 'success',
        });
    }
</script>
</body>

</html>