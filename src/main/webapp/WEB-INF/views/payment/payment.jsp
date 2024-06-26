<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>결제</title>

<!-- 사인관련 스크립트 -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/signature_pad/1.5.3/signature_pad.min.js"></script>

<link href="${contextPath}/resources/css/mainPage/mainPage.css" rel="stylesheet">

<!-- 모달 관련 -->
<script src="${contextPath}/resources/js/iziModal.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/iziModal.min.css">

<!-- 포트원 결제 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  
<link href="${contextPath}/resources/css/mainPage/mainPage.css" rel="stylesheet">


<style>

/* Container styling */
.container {
	width: 90%;
	margin: 0 auto;
	font-family: Arial, sans-serif;
}

/* Header styling */
header {
	text-align: center;
	margin-bottom: 20px;
}

header h1 {
	font-size: 2em;
	margin: 0;
}

/* Date and people selection section */
.date-people-selection {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 0;
	border-bottom: 1px solid #ddd;
}

.date-people-selection .date-picker, .date-people-selection .people-counter
	{
	display: flex;
	align-items: center;
}

.date-people-selection .date-picker input, .date-people-selection .people-counter input
	{
	width: 50px;
	text-align: center;
	margin: 0 5px;
}

.date-people-selection .people-counter {
	display: flex;
	align-items: center;
}

.date-people-selection .people-counter div {
	margin-right: 10px;
}

.date-people-selection .people-counter button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
}

.date-people-selection .people-counter button:disabled {
	background-color: #ccc;
}

/* Benefit section */
.benefit-section {
	padding: 20px 0;
	border-bottom: 1px solid #ddd;
}

.benefit-section h2 {
	margin-bottom: 10px;
}

.benefit-section .benefit-tabs {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}

.benefit-section .benefit-tabs div {
	flex: 1;
	text-align: center;
	padding: 10px;
	cursor: pointer;
	border: 1px solid #ddd;
}

.benefit-section .benefit-tabs div.active {
	background-color: #feefad;
	color: black;
	border-color: #ddd;
}

.benefit-section .benefit-details {
	padding: 10px;
	border: 1px solid #ddd;
}

.benefit-section .benefit-details img {
	width: 50px;
	height: auto;
}

/* Summary section */
.summary-section {
	padding: 20px 0;
}

.summary-section table {
	width: 100%;
	border-collapse: collapse;
}

.summary-section table th, .summary-section table td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.summary-section .total {
	font-size: 1.5em;
	text-align: right;
	margin-top: 20px;
}

.summary-section .total .amount {
	color: #007bff;
}

/* Button styling */
button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 1em;
	cursor: pointer;
	display: block;
	margin: 0 auto;
}

button:disabled {
	background-color: #ccc;
}
/* Container styling */
.container {
	width: 90%;
	margin: 0 auto;
	font-family: Arial, sans-serif;
}

/* Header styling */
header {
	text-align: center;
	margin-bottom: 20px;
}

header h1 {
	font-size: 2em;
	margin: 0;
	color: #333;
}

/* Date and people selection section */
.date-people-selection {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 0;
	border-bottom: 1px solid #ddd;
}

.date-people-selection .date-picker {
	display: flex;
	align-items: center;
}

.date-people-selection .date-picker label {
	margin-right: 10px;
	font-weight: bold;
}

.date-people-selection .date-picker input {
	width: 100px;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	text-align: center;
}

.date-people-selection .people-counter {
	display: flex;
	justify-content: space-around;
	width: 100%;
}

.people-counter .counter-group {
	text-align: center;
	margin: 0 10px;
}

.people-counter .counter-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.people-counter .counter-group span {
	display: block;
	font-size: 0.8em;
	color: #888;
	margin-top: 3px;
}

.people-counter .counter-controls {
	display: flex;
	align-items: center;
	justify-content: space-evenly;
}

.people-counter .counter-controls button {
	background-color: #feefad;
	color: black;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
	border-radius: 4px;
	font-size: 1.2em;
	line-height: 1;
}

.people-counter .counter-controls button:disabled {
	background-color: #ccc;
}

.people-counter .counter-controls input {
	width: 40px;
	text-align: center;
	border: 1px solid #ccc;
	border-radius: 4px;
	margin: 0 5px;
	padding: 5px;
	font-size: 1em;
}

/* Container styling */
.quantity-container {
	display: flex;
	justify-content: space-around;
	align-items: center;
	padding: 20px;
	border-radius: 10px;
	background-color: #feefad;
	font-family: Arial, sans-serif;
}

/* Individual quantity group styling */
.quantity-group {
	text-align: center;
	margin: 0 20px;
}

.quantity-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
	color: #333;
}

.quantity-group span {
	display: block;
	font-size: 0.8em;
	color: #888;
	margin-top: 3px;
}

/* Quantity controls styling */
.quantity-controls {
	display: flex;
	align-items: center;
	justify-content: center;
}

.quantity-controls button {
	background-color: white;
	color: black;
	border: none;
	padding: 10px;
	cursor: pointer;
	border-radius: 5px;
	font-size: 1.5em;
	line-height: 1;
	margin: 0 5px;
	width: 40px;
	height: 40px;
}

.quantity-controls button:disabled {
	background-color: #ccc;
}

.quantity-controls input {
	width: 60px;
	text-align: center;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 10px;
	font-size: 1.2em;
	margin: 0 5px;
	background-color: white;
	height: 39px;
}

body {
	font-family: Arial, sans-serif;
	margin: 20px;
	background-color: #f9f9f9;
}

.ticket-container {
	width: 100%;
	max-width: 1293px;
	margin: 0 auto;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	padding: 20px;
	margin-top: 50px;
}

.ticket-table {
	width: 100%;
	border-collapse: collapse;
}

.ticket-table th, .ticket-table td {
	padding: 15px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

.ticket-table th {
	background-color: #feefad;
	font-weight: bold;
}

.quantity-controls {
	display: flex;
	align-items: center;
	justify-content: center;
}

.quantity-btn {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px;
	cursor: pointer;
	font-size: 16px;
	border-radius: 4px;
}

.quantity-btn:disabled {
	background-color: #ccc;
	cursor: not-allowed;
}

.quantity-controls input {
	width: 50px;
	text-align: center;
	border: none;
	font-size: 16px;
	margin: 0 5px;
}

#adult-own-price, #adult-companion-price {
	font-weight: bold;
}

.total-amount {
	font-size: 20px;
	font-weight: bold;
	text-align: right;
	margin-top: 20px;
}

#total-price {
	color: #007bff;
}

#total {
	color: #007bff;
}

.purchase-kakao, .purchase-toss {
	display: flex;
	padding: 15px;
	background-color: #feefad;
	color: black;
	border: none;
	border-radius: 8px;
	font-size: 18px;
	cursor: pointer;
	text-align: center;
	margin-top: 20px;
	text-decoration: none;
	justify-content: space-around;
	height: 50px;
}

.purchase-toss {
	background-color: #73a3ff;
}

.purchase-button:hover {
	background-color: #feefad87;
}

.purchase-toss:hover {
	background-color: #73a3ff;
}

input {
	margin-bottom: 10px;
	margin-bottom: 10px;
	background: white !important;
	padding: 10px;
	border-radius: 10px;
}

img {
	width: 100%;
}

.deatil_pay {
	padding: 10px;
	position: absolute;
	top: 1px;
	backdrop-filter: blur(10px);
}
</style>

</head>
<body>

<script>
$(document)
		.ready(
				function() {
					let sum1 = 0;
					let sum2 = 0;

					function updateTotal() {
						let price1 = parseInt($(
								"#adult-own-price1 span").text()) || 0;
						let price2 = parseInt($(
								"#adult-own-price2 span").text()) || 0;
						let total = price1 + price2;
						$("#total").text(total + "원");
					}

					// 청소년 티켓 증가 버튼 클릭
					$("#teen-increase")
							.on(
									"click",
									function() {
										sum1 += 1;
										$("#teens").val(sum1);
										let found = false;
										$(".ticket-table tr")
												.each(
														function() {
															if ($(this)
																	.find(
																			"td#ticketName")
																	.text() == "일반 이용권") {
																found = true;
																let newQuantity = sum1;
																$(this)
																		.find(
																				"#adult-companion")
																		.val(
																				newQuantity);
																$(this)
																		.find(
																				"#adult-own-price1 span")
																		.text(
																				newQuantity * 20000);
																updateTotal();
															}
														});

										if (!found) {
											let tr = "<tr>"
													+ "<td id='ticketName'>일반 이용권</td>"
													+ "<td>"
													+ "<div class='quantity-controls'>"
													+ "<input type='number' id='adult-companion' value='1' min='0' readonly>"
													+ "<input type='hidden' id='adult-date' value='"+ $('#one_date').val() +"'>"
													+ "</div>"
													+ "</td>"
													+ "<td id='adult-own-price1'><span>21000</span>원</td>"
													+ "</tr>";
											$(".ticket-table").append(
													tr);
											updateTotal();
										}
									});

					// 청소년 티켓 감소 버튼 클릭
					$("#teen-decrease")
							.on(
									"click",
									function() {
										if (sum1 > 0) {
											sum1 -= 1;
											$("#teens").val(sum1);
											$(".ticket-table tr")
													.each(
															function() {
																if ($(
																		this)
																		.find(
																				"td#ticketName")
																		.text() == "일반 이용권") {
																	let newQuantity = sum1;
																	if (newQuantity > 0) {
																		$(
																				this)
																				.find(
																						"#adult-companion")
																				.val(
																						newQuantity);
																		$(
																				this)
																				.find(
																						"#adult-own-price1 span")
																				.text(
																						newQuantity * 20000);
																	} else {
																		$(
																				this)
																				.remove();
																	}
																	updateTotal();
																}
															});
										}
									});

					// 어린이 티켓 증가 버튼 클릭
					$("#child-increase")
							.on(
									"click",
									function() {
										sum2 += 1;
										$("#children").val(sum2);
										let found = false;
										$(".ticket-table tr")
												.each(
														function() {
															if ($(this)
																	.find(
																			"td#ticketName2")
																	.text() == "정기 이용권") {
																found = true;
																let newQuantity = sum2;
																$(this)
																		.find(
																				"#adult-own")
																		.val(
																				newQuantity);
																$(this)
																		.find(
																				"#adult-own-price2 span")
																		.text(
																				newQuantity * 20000);
																updateTotal();
															}
														});

										if (!found) {
											let tr = "<tr>"
													+ "<td id='ticketName2'>정기 이용권</td>"
													+ "<td>"
													+ "<div class='quantity-controls'>"
													+ "<input type='number' id='adult-own' value='1' min='0' readonly>"
													+ "<input type='hidden' id='adult-own-date' value='"+ $('#any_date').val() +"'>"
													+ "</div>"
													+ "</td>"
													+ "<td id='adult-own-price2'><span>21000</span>원</td>"
													+ "</tr>";
											$(".ticket-table").append(
													tr);
											updateTotal();
										}
									});

					// 어린이 티켓 감소 버튼 클릭
					$("#child-decrease")
							.on(
									"click",
									function() {
										if (sum2 > 0) {
											sum2 -= 1;
											$("#children").val(sum2);
											$(".ticket-table tr")
													.each(
															function() {
																if ($(
																		this)
																		.find("td#ticketName2")
																		.text() == "정기 이용권") {
																	let newQuantity = sum2;
																	if (newQuantity > 0) {
																		$(
																				this)
																				.find(
																						"#adult-own")
																				.val(
																						newQuantity);
																		$(
																				this)
																				.find(
																						"#adult-own-price2 span")
																				.text(
																						newQuantity * 20000);
																	} else {
																		$(
																				this)
																				.remove();
																	}
																	updateTotal();
																}
															});
										}
									});

					// 페이지 로드 시 총 금액 업데이트
					updateTotal();
				});
</script>

<script>
$(document).ready(function() {
    let sum1 = 0;
    let sum2 = 0;

    function updateTotal() {
        let price1 = parseInt($("#adult-own-price1 span").text()) || 0;
        let price2 = parseInt($("#adult-own-price2 span").text()) || 0;
        let total = price1 + price2;
        let totalComma = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        $("#total").text(totalComma + "원");
    }


    $("#teen-increase").on("click", function() {
    	
        sum1 += 1;
        $("#teens").val(sum1);
        
        let found = false;
        
        $(".ticket-table tr").each(function() {
            if ($(this).find("td#ticketName").text() == "일반 이용권") {
            	
                found = true;
                
                let newQuantity = sum1;
                $(this).find("#adult-companion").val(newQuantity);
                $(this).find("#adult-own-price1 span").text(newQuantity * 21000);
                updateTotal();
            }
        });
        
        

        if (!found) {
            let tr = "<tr>" +
                     "<td id='ticketName'>일반 이용권</td>" +
                     "<td>" +
                         "<div class='quantity-controls'>" +
                             "<input type='number' id='adult-companion' value='1' min='0' readonly>" +
                         "</div>" +
                     "</td>" +
                     "<td id='adult-own-price1'><span>21000</span>원</td>" +
                     "</tr>";
            $(".ticket-table").append(tr);
            updateTotal();
        }
    });

    
    $("#teen-decrease").on("click", function() {
        if (sum1 > 0) {
            sum1 -= 1;
            $("#teens").val(sum1);
            $(".ticket-table tr").each(function() {
                if ($(this).find("td#ticketName").text() == "일반 이용권") {
                    let newQuantity = sum1;
                    if (newQuantity > 0) {
                        $(this).find("#adult-companion").val(newQuantity);
                        $(this).find("#adult-own-price1 span").text(newQuantity * 21000);
                    } else {
                        $(this).remove();
                    }
                    updateTotal();
                }
            });
        }
    });

   
    $("#child-increase").on("click", function() {
    	
        sum2 += 1;
        
        $("#children").val(sum2);
        let found = false;
        $(".ticket-table tr").each(function() {
            if ($(this).find("td#ticketName2").text() == "정기 이용권") {
            	
                found = true;
                let newQuantity = sum2;
                $(this).find("#adult-own").val(newQuantity);
                $(this).find("#adult-own-price2 span").text(newQuantity * 21000);
                updateTotal();
            }
        });
        
        

        if (!found) {
            let tr = "<tr>" +
                     "<td id='ticketName2'>정기 이용권</td>" +
                     "<td>" +
                         "<div class='quantity-controls'>" +
                             "<input type='number' id='adult-own' value='1' min='0' readonly>" +
                         "</div>" +
                     "</td>" +
                     "<td id='adult-own-price2'><span>150000</span>원</td>" +
                     "</tr>";
            $(".ticket-table").append(tr);
            updateTotal();
        }
    });

   
    $("#child-decrease").on("click", function() {
        if (sum2 > 0) {
            sum2 -= 1;
            $("#children").val(sum2);
            $(".ticket-table tr").each(function() {
                if ($(this).find("td#ticketName2").text() == "정기 이용권") {
                	
                    let newQuantity = sum2;
                    
                    if (newQuantity > 0) {
                        $(this).find("#adult-own").val(newQuantity);
                        $(this).find("#adult-own-price2 span").text(newQuantity * 21000);
                    } else {
                        $(this).remove();
                    }
                    updateTotal();
                }
            });
            
        }
    });

    updateTotal();
});

</script>

<script>
var IMP = window.IMP;

$(document).ready(function(){
	
$("#payment").on("click", function () {
	if($(".ticket-table tbody tr").length > 0){
		kakaoPay();			
	}else{
		alert("이용권을 선택해주세요.");
	}
});

})

//구매자 정보




function kakaoPay() {
	
	var today = new Date();
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes();  // 분
	var seconds = today.getSeconds();  // 초
	var milliseconds = today.getMilliseconds();
	var makeMerchantUid = hours + minutes + seconds + milliseconds;
	
if (confirm("구매 하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기
		
	
		var ticketType;
		if ($(".ticket-table tbody").find("#ticketName").length > 0  && $(".ticket-table tbody").find("#ticketName2").length == 0) {
		    ticketType = "일반이용권";
		} else if ($(".ticket-table tbody").find("#ticketName2").length > 0 && $(".ticket-table tbody").find("#ticketName").length == 0) {
		    ticketType = "정기이용권";
		} else if ($(".ticket-table tbody tr").length == 2) {
		    ticketType = "일반이용권,정기이용권";
		}

   //const emoticonName = document.getElementById('title').innerText
	 let userEmail = '${member.EMAIL}';
	 let userName = '${member.USER_NAME}';
	 let userPhone = '${member.PHONE}';
	 
   IMP.init("imp37456887"); // 가맹점 식별코드
   
   IMP.request_pay({
	   
       pg: 'kakaopay.TC0ONETIME', // PG사 코드표에서 선택
       pay_method: 'card', // 결제 방식
       merchant_uid: "IMP" + makeMerchantUid, // 결제 고유 번호
       name: ticketType, // 제품명
       amount: $("#total").text(), // 가격
       //구매자 정보 ↓
       buyer_email: userEmail,
       buyer_name: userName,
       buyer_tel : userPhone
       // buyer_addr : '서울특별시 강남구 삼성동',
       // buyer_postcode : '123-456'
       
   }, async function (rsp) { // callback
	   
       if (rsp.success) { //결제 성공시
           console.log(rsp);
       
       
       	$.ajax({
       		url:"${contextPath}/payment/ajaxkakaoPayment.do",
       		type:"post",
       		data:{
       			orderPayment: $("#total").text(), 
	     			orderStatus : "2",
	     			customerId : "${member.USER_NO}",
	     			paymentMethod : "CD", 
	     			ticketType1 : $("#ticketName").text(),
	     			ticketType2 : $("#ticketName2").text(),
	     			ticketPrice1 : $("#adult-own-price1 span").text(),
	     			ticketPrice2 : $("#adult-own-price2 span").text(),
	     			ticketCtn1 : $("#adult-companion").val(),
	     			ticketCtn2 : $("#adult-own").val(),
	     			startDate1 : $(".commonDate").val(),
	     			startDate2 : $(".RoutineDate").val(),
	     			endDate1 : $(".commonDate").val(),
	     			endDate2 : $(".RoutineDate").val(),
	     			discount :  $("#discounts").val()
       		},
       		success:function(response){
       			
       			console.log("전달 여부 :" + response);
       			//결제 성공시
       		
  	        if (response == "SUCCESS") { // DB저장 성공시
  	            alert('결제가 정상적으로 완료되었습니다. 이용해주셔서 감사합니다.');
  	            window.location.reload();
  	        } else { // 결제완료 후 DB저장 실패시
  	            alert(`error:[${response.status}]\n결제요청이 승인된 경우 관리자에게 문의바랍니다.`);
  	            // DB저장 실패시 status에 따라 추가적인 작업 가능성
  	        }
       		
       		},
       		error:function(){
       			console.log("ajax 통신 실패");
       		}
       		
       	})
		
           
       } else if (rsp.success == false) { // 결제 실패시
           alert(rsp.error_msg)
       }
   
   
   });
   
}else{
		return false;
}

}
</script>

	<jsp:include page="/WEB-INF/views/common/sidebarHeader.jsp"/>

	<!-- content 추가 -->
	<div class="content p-4">
		<!-- 프로필 영역 -->
		<div class="informations">
			<!-- informations left area start -->
			<div class="left_con">
				<div class="container">
					<header>
						<h1>티켓 결제</h1>
					</header>

					<div class="quantity-container">
						<div class="quantity-group">
							<label for="teens"><h5>일반 이용권</h5></label>
							<div style="position: relative;">
								<div>
									<img src="${contextPath}/resources/images/rollooo.avif">
								</div>
								<div class="deatil_pay jua-regular">
									가격 :
									<del>25,000원</del>
									<br> 가격 : <b>20,000원</b><br> <span
										style="color: red;">직원 할인가 : 20%</span>
								</div>
							</div>
							<div
								style="display: flex; justify-content: space-between; margin-top: 12px;">
								<div align="left">
									<input id="one_date" class="commonDate" style="margin-bottom: 10px;" type="date">
								</div>
								<div class="quantity-controls">
									<button class="quantity-btn" id="teen-decrease">−</button>
									<input type="number" value="0" id="teens" min="0" readonly>
									<button class="quantity-btn" id="teen-increase">+</button>
								</div>
							</div>
						</div>
						<div class="quantity-group">
							<label for="children"><h5>정기 이용권</h5></label>
							<div style="position: relative;">
								<div>
									<img src="${contextPath}/resources/images/rollooo.avif">
								</div>
								<div class="deatil_pay jua-regular">
									가격 :
									<del>25,000원</del>
									<br> 가격 : <b>20,000원</b><br> 30일 <br> <span
										style="color: red;">직원 할인가 : 20%</span>
								</div>
								<input type="hidden" id="discounts" value="0.2">
							</div>
							<div
								style="display: flex; justify-content: space-between; margin-top: 12px;">
								<div align="left">
									<input id="any_date" class="RoutineDate" style="margin-bottom: 10px;" type="date">
								</div>

								<div class="quantity-controls">
									<button class="quantity-btn" id="child-decrease">−</button>
									<input type="number" id="children" value="0" min="0" readonly>
									<button class="quantity-btn" id="child-increase">+</button>
								</div>
							</div>

						</div>
					</div>

					<div class="ticket-container">
						<table class="ticket-table">
							<thead>
								<tr>
									<th style="width: 300px;"><h5>입장권</h5></th>
									<th style="width: 100px;"><h5>수량</h5></th>
									<th style="width: 300px;"><h5>가격</h5></th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
						<div class="total-amount">
							<h6>
								최종결제금액 :<span id="total"></span>
							</h6>
						</div>
						<div style="display: flex; justify-content: flex-end; gap: 10px;">
							<button class="purchase-kakao" onclick="" id="payment" type="button">
								<h5>카카오</h5>
							</button>

							<button class="purchase-toss" onclick="">
								<h5>토스</h5>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		function merchantUID(){
			return toStringByFormatting(new Date())+(Math.round(Math.random()*1000) + 1);
		}
		
		function toStringByFormatting(source) {
		    const year = source.getFullYear();
		    const month = source.getMonth() + 1;
		    const day = source.getDate();

		    return [year, month, day].join('');
		}
		
		$(document).ready(function(){
			/* dpcks 
				 포스트원을 이용한 토스 결제
			*/
			$('.purchase-toss').click(function(){
				console.log('토스 결제 실행');
				
				IMP.init('imp24467387');
				
				IMP.request_pay(
					{
					    pg: 					"tosspay.tosstest",
					    pay_method: 	"card",
					    merchant_uid: 'toss_' + merchantUID(), 
					    name: 				"N",
					    amount: 			$('#adult-own-price1>span').text(),
					    custom_data: {
						    buyer_count: 	$('#teens').val(),
						    buyer_date: 	$('#one_date').val(),
						    buyer_no: 		${loginMember.userNo},
					    },
					},
					async (response) => {
				   if (response.error_code != null) {
					      return alert(`결제에 실패하였습니다. 에러 내용: ${response.error_msg}`);
					    }
						console.log(response);
						// db에 저장 및 유효성 체크
						$.ajax({
							url: '${contextPath}/payment/tossSimplePay.ajax',
							type: 'post',
							contentType:'application/json',
							data:JSON.stringify({
								merchant_uid: response.merchant_uid,
								name: 				response.name,
								status:				response.status,
								pay_method: 	response.pay_method,
								paid_amount: 	response.paid_amount,
								pg_provider: 	response.pg_provider,
								pg_tid: 			response.pg_tid,
								buyer_count: 	response.custom_data.buyer_count,
								buyer_date:		response.custom_data.buyer_date,
								buyer_no:			response.custom_data.buyer_no,
								discount: 		'0.2',
							}),
							success:function(redata){
								//console.log(redata);
								
								if(redata > 0){
									greenAlert('결제', '결제가 성공 했습니다.');
								}else {
									redAlert('결제', '결제가 실패 했습니다.');
								}
							},
							error:function(){
								console.log('토스 결제 실패');
							}
						})
					}
				
				);
				
			});
			
	})
	</script>


	<jsp:include page="/WEB-INF/views/common/sidebarFooter.jsp" />

</body>
</html>