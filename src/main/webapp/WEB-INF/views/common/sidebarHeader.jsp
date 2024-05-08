<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SideBar</title>
		<!-- animate -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

    <!-- bootstrap -->
    <link href="${ contextPath }/resources/css/common/bootstrap.min.css" rel="stylesheet">

    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/12ec987af7.js" crossorigin="anonymous"></script>

    <!-- Google Fonts Roboto -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />

    <!-- Google Fonts Jua -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- 모달 관련 -->
    <script src="${ contextPath }/resources/js/iziModal.min.js"></script>
    <link rel="stylesheet" href="${ contextPath }/resources/css/iziModal.min.css">

    <!-- 체크박스 관련 스타일 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
    
    <!-- alertify -->
     <script src="${ contextPath }/resources/alertify/js/alertify.min.js"></script>
		 <link href="${contextPath}/resources/alertify/css/alertify.min.css" rel="stylesheet">
		 <link href="${contextPath}/resources/alertify/css/default.min.css" rel="stylesheet">
		 <link href="${contextPath}/resources/alertify/css/semantic.min.css" rel="stylesheet">

    <!-- css -->
    <link href="${ contextPath }/resources/css/common/sidebars.css" rel="stylesheet">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/mdb.min.css" />
    <style>
        .b-example-divider {
            width: 100%;
            height: 3rem;
            background: rgb(255, 247, 208);
            /* background: linear-gradient(90deg, rgba(255, 247, 208, 1) 0%, rgba(254, 239, 173, 1) 46%, rgba(248, 255, 140, 1) 100%); */
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }

        .active .bi {
            display: block !important;
        }

        .msg_open_btn,
        .msg_close_btn {
            position: fixed;
            right: 30px;
            bottom: 30px;
            cursor: pointer;
            color: #FEEFAD;
            z-index: 10;
        }

        .msg_open_btn:hover,
        .msg_close_btn:hover {
            color: #ffe367;
        }

        .msg_close_btn {
            display: none;
        }

        .msg_open_btn>a,
        .msg_close_btn>a {
            color: black;
        }

        .mb-1>button {
            box-shadow: none;
        }

        /* content의 height와 height 값을 동일하게 */
        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 1200px;
        }

        .content {
            height: 1200px;
            width: 1500px;
        }


        /* 채팅 스타일 */
        .msgbox {
            height: 900px;
            width: 1000px;
            border-radius: 10px;
            position: fixed;
            right: 80px;
            bottom: 30px;
            display: none;
            flex-direction: column;
            overflow: auto;
            overflow-x: none;
            z-index: 100;
        }

        .people_list {
            height: 500px;
            overflow: scroll;
            overflow-x: hidden;
        }


        /* 채팅방 리스트 */
        .chat_room:hover {
            background-color: #eeeeee;
        }

        .chat_room_active {
            background-color: #dddddd;
        }

        .card-body {
            padding: 10px;
        }

        /* 채팅방 리스트 끝 */

        /* 인물 목록 */
        .people_list {
            /* display: none; */
            display: flex;
            flex-direction: column;
        }

        .search_bar {
            height: 10%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .dept_list_wrapper {
            height: 90%;
            display: flex;
            flex-direction: column;
        }

        .dept_list {
            display: flex;
            flex-direction: column;
            height: 40px;
        }

        .dept {
            height: 40px;
            width: 100%;
            font-size: 15px;
        }

        .team {
            height: 30px;
            font-size: 15px;
            padding: 0;
            margin: 10px;
            font-family: "Jua", sans-serif;
        }

        .chatting_btn {
            margin-left: 150px;
        }

        .team_list {
            display: flex;
            justify-content: center;
        }

        /* 인물 목록 끝 */

        /* 채팅방 버튼 */
        .chat_btn {
            border: 1px solid blue;
            height: 100px;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
        }

        .pl_btn,
        .cr_btn {
            border-radius: 25px;
            --bs-btn-bg: #72abff;
            --bs-btn-border-color: #72abff;
            --bs-btn-hover-bg: #4992ff;
            margin: 0 15px;
        }

        .msg_btn_wrapper {
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: flex-end;
        }

        .btn-outline-info {
            --mdb-btn-bg: transparent;
            --mdb-btn-color: #0e1010;
            --mdb-btn-hover-bg: #f6fbfd;
            --mdb-btn-hover-color: #0e1010;
            --mdb-btn-focus-bg: #f6fbfd;
            --mdb-btn-focus-color: #0e1010;
            --mdb-btn-active-bg: #f6fbfd;
            --mdb-btn-active-color: #0e1010;
            --mdb-btn-outline-border-color: #FEEFAD;
            --mdb-btn-outline-focus-border-color: #ffd000;
            --mdb-btn-outline-hover-border-color: #ffe367;
        }

        .btn1 {
            height: 35px;
        }

        /* 채팅방 버튼 끝 */

        /* 채팅방 */
        .chatting {
            /* display: none; */
            display: block;
        }

        .chatting_box {
            margin-top: 50px;
            height: 800px;
            display: flex;
            flex-direction: column;
        }

        .chatting_history {
            height: 80%;
            overflow: auto;
            overflow-x: none;
        }

        .msg_send_box {
            height: 20%;
            padding-top: 20px;
        }

        /* 채팅방 스타일 끝 */
    </style>
</head>
<body>
<c:if test="${ alertMsg != null }" >
<script>
	alertify.alert('${alertMsg}');
</script>
</c:if>
<main class="d-flex flex-nowrap">
        <div class="flex-shrink-0 p-3" style="width: 280px;">
            <a href="/"
                class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
                <svg class="bi pe-none me-2" width="30" height="24">
                    <use xlink:href="#bootstrap" />
                </svg>
                <span class="fs-5 fw-semibold">회사로고</span>
            </a>
            <ul class="list-unstyled ps-0">
                <li class="mb-1">
                    <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
                        Home
                    </button>
                    <div class="collapse show" id="home-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="#"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Overview</a>
                            </li>
                            <li><a href="#"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Updates</a>
                            </li>
                            <li><a href="#"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Reports</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="mb-1">
                    <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
                        Dashboard
                    </button>
                    <div class="collapse" id="dashboard-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="#"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Overview</a>
                            </li>
                            <li><a href="#"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Weekly</a>
                            </li>
                            <li><a href="#"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Monthly</a>
                            </li>
                            <li><a href="#"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Annually</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="mb-1">
                    <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
                        Orders
                    </button>
                    <div class="collapse" id="orders-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="#"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">New</a></li>
                            <li><a href="#"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Processed</a>
                            </li>
                            <li><a href="#"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Shipped</a>
                            </li>
                            <li><a href="#"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Returned</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="border-top my-3"></li>
                <li class="mb-1">
                    <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
                        Account
                    </button>
                    <div class="collapse" id="account-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="${ contextPath }/member/mypage.page"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">My Page</a>
                            </li>
                            <li><a href="#"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Profile</a>
                            </li>
                            <li><a href="#"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Settings</a>
                            </li>
                            <li><a href="${ contextPath }/member/logout.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Sign
                                    out</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>

        <div class="b-example-divider b-example-vr"></div>
</body>
</html>