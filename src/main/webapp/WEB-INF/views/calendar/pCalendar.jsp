<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- fullcalendar -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>

<style>
	.out-line {
		min-height: 800px;
		width: 100%;
		display: flex;
		flex-direction: row;
		box-sizing: border-box;
	}
	
	.member-search-area {
		height: 15%;
		padding: 10px;
		display: flex;
	}
	
	.move-month-area {
		height: 9.5%;
		display: grid;
		align-items: center;
	}
	
	.month-area {
		display: flex;
		justify-content: center;
	}
	
	.month-area div {
		font-size: 30px;
		margin: 10px;
		padding: 10px;
	}
	
	.calender-area {
		padding: 10px;
	}
	
	.mydiv-area {
		width: 20%;
	}
	
	.memebrdiv-area {
		width: 80%;
		gap: 30px;
		overflow-y: auto;
	}
	
	.line-cirecle {
		border-radius: 100%;
		height: 80px;
		width: 80px;
		cursor: pointer;
	}
	
	.display-item-center {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.memebrdiv-area {
		display: -webkit-box;
		-webkit-box-align: center;
	}
	
	.font-size25 {
		font-size: 25px;
	}
	.member-search-area, .content-area .calender-area {
		margin-left: 30px;
	}
	/* 모달 스타일 */
	.Category, .Co-worker {
		display: -webkit-box;
		overflow-y: hidden;
	}
	
	.date-time-area {
		display: flex;
		justify-content: space-evenly;
		text-align: center;
		width: 100%;
	}
	
	.date-area, .time-area {
		width: 100%;
		text-align: center;
	}
	
	.date-area {
		height: 30px;
	}
	
	.time-area {
		height: 50px;
	}
	
	.content-text-area {
		width: 500px;
		min-height: 120px;
	}
	/* 캘린더 스타일  */
	#calendar a {
		color: rgb(130, 130, 130);
		text-decoration-line: none;
	}
	
	.fc-button-primary {
		background-color: rgb(160, 160, 160) !important;
		border: 0 !important;
	}
	
	.fc-day-sat a {
		color: #007bff !important;
	}
	
	.fc-day-sun a {
		color: #dc3545 !important;
	}
</style>
</head>
<body>
	<!-- 상세보기 일정 모달 -->
	<div id="cal_modal">
		<div style="display: flex; justify-content: space-between; align-items: center">
			<div class="jua-regular">Category</div>
			
			<div
				class="pretty p-default p-round p-smooth font-size20 privateArea"
				id="privateName">
				<input type="checkbox" />
				<div class="state p-danger">
					<label class="jua-regular">private</label>
				</div>
			</div>
		</div>
		
		<div class="Category">
           <div class="pretty p-default p-curve">
               <input type="radio" name="color" />
               <div class="state p-success-o">
                   <label>회의</label>
               </div>
           </div>
       
           <div class="pretty p-default p-curve">
               <input type="radio" name="color" />
               <div class="state p-success-o">
                   <label>미팅</label>
               </div>
           </div>
       
           <div class="pretty p-default p-curve">
               <input type="radio" name="color" />
               <div class="state p-success-o">
                   <label>이벤트</label>
               </div>
           </div>
       
           <div class="pretty p-default p-curve">
               <input type="radio" name="color" />
               <div class="state p-success-o">
                   <label>계약</label>
               </div>
           </div>
           <div class="pretty p-default p-curve">
               <input type="radio" name="color" />
               <div class="state p-success-o">
                   <label>기타</label>
               </div>
           </div>       
		</div>
		<br>
		<div class="jua-regular">Co-worker</div>
		<div class="Co-worker">
                    <div class="pretty p-default p-round p-smooth p-plain">
                        <input type="checkbox" />
                        <div class="state p-success-o">
                            <label> 김우빈</label>
                        </div>
                    </div>

                    <div class="pretty p-default p-round p-smooth p-plain">
                        <input type="checkbox" />
                        <div class="state p-success-o">
                            <label> 전지현</label>
                        </div>
                    </div>

                    <div class="pretty p-default p-round p-smooth p-plain">
                        <input type="checkbox" />
                        <div class="state p-success-o">
                            <label> 아이유</label>
                        </div>
                    </div>

                    <div class="pretty p-default p-round p-smooth p-plain">
                        <input type="checkbox" />
                        <div class="state p-success-o">
                            <label> 뚱이</label>
                        </div>
                    </div>

                    <div class="pretty p-default p-round p-smooth p-plain">
                        <input type="checkbox" />
                        <div class="state p-success-o">
                            <label> 징징이</label>
                        </div>
                    </div>
		</div>
		<br>
		<div class="jua-regular">
			Color <input type="color" id="color-style" style="width: 30px; height: 30px;">
		</div>
		<br>
		<div style="display: flex; justify-content: space-between;">
			<div class="jua-regular">All Day</div>

			<div class="pretty p-switch all_day">
				<input type="checkbox" />
				<div class="state p-success">
					<label>종일</label>
				</div>
			</div>
		</div>
		<br>
		<div class="date-time-area">
			<div style="width: 40%;">
				<div>
					<input class="date-area jua-regular" type="date" id="currentDate1">
				</div>
				<br>
				<div>
					<input class="time-area jua-regular" type="time" id="currentTime1">
				</div>
			</div>
			<div style="place-self: center; font-size: xx-large;">~</div>
			<div style="width: 40%;">
				<div>
					<input class="date-area jua-regular" type="date" id="currentDate2">
				</div>
				<br>
				<div>
					<input class="time-area jua-regular" type="time" id="currentTime2">
				</div>
			</div>
		</div>
		<br>
		<div class="jua-regular" >Content</div>
		<div>
			<textarea class="content-text-area"></textarea>
		</div>
		<br>
		<div class="jua-regular" name="place">Place</div>
		<div class="Place">
			<input style="width: 80%" type="text">
		</div>
		<br>
		<div align="end">
			<button class="btn btn-outline-warning">수정</button>
		</div>
	</div>
	
	<div class="out-line">
		<!-- 메뉴판 -->
		<jsp:include page="/WEB-INF/views/common/sidebarHeader.jsp"/>

		<!-- 컨텐츠 영역 content-area -->
		<div class="content" style="max-width: 1120px; padding: 30px;">
			<!-- 직원 div 영역 -->
			<div class="member-search-area radious10 line-shadow">
				<div class="mydiv-area display-item-center">
					<div
						class="line-cirecle display-item-center line-shadow my-element"
						onclick="repeat_anmation()">홍길동</div>
				</div>
				<div class="memebrdiv-area display-item-center">
					<div class="line-cirecle display-item-center line-shadow">홍길동</div>
					<div class="line-cirecle display-item-center line-shadow">홍길동</div>
					<div class="line-cirecle display-item-center line-shadow">홍길동</div>
					<div class="line-cirecle display-item-center line-shadow">홍길동</div>
					<div class="line-cirecle display-item-center line-shadow">홍길동</div>
				</div>
			</div>
			<br> <br>
			<!-- 캘린더 영역 -->
			<div class="calender-area radious10 line-shadow "><div id="calendar"></div></div>
			<!-- 캘린더 스타일 -->
			<script>
			// 캘린더 설정 및 선언
			document.addEventListener('DOMContentLoaded', function() {
					var calendarEl = document.getElementById('calendar');
					var calendar = new FullCalendar.Calendar(calendarEl, {
							initialView: 'dayGridMonth',
							locale: 'ko',
							 customButtons: {
								 enrollButton:{
									 text: '일정 등록',
									 click: function(){
										 location.href="${path}/calendar/calEnroll.page";
									 }
								 }
							 },
							buttonText:{prev:'이전',next:'다음',today: '오늘',year:'연도',month:'월',week:'주',},
							headerToolbar:{start: 'prev today enrollButton',center: 'title',end: 'multiMonthYear,dayGridMonth,timeGridWeek next'},
							views:{year: {titleFormat:{year: '2-digit'},multiMonthMaxColumns: 1},
								  	month:{titleFormat:{year: '2-digit', month: 'short'}},
									week: {titleFormat:{year: '2-digit'}},
									day: {titleFormat:{month: 'short',day:'2-digit'}}},
							buttonIcons: false,
							navLinks: true,
							slotMinTime: "06:00:00",
							timeZone: 'Asia/Seoul',
							editable: true,
							droppable: true,
							eventStartEditable: true,
							eventResizableFromStart: true,
							eventClick:function(info){
								//console.log(info.event);
								//console.log(info.event.extendedProps);
								//console.log(info.event.extendedProps.content);
								//console.log($('#cal_modal').find('.content-text-area'));
					     	 	$(document).on('opening', '#cal_modal', function (e) {
					     	 		console.log(info.event.title);
								    //console.log($('#cal_modal').find('#currentDate1'));
								    
								    $('#cal_modal').find('#color-style').val(info.event.backgroundColor);
								    $('#cal_modal').find('#currentDate1').val(info.event.startStr.slice(0,10));
								    $('#cal_modal').find('#currentTime1').val(info.event.startStr.slice(11));
								    $('#cal_modal').find('#currentDate2').val(info.event.endStr.slice(0,10));
								    $('#cal_modal').find('#currentTime2').val(info.event.endStr.slice(11));
								});
						     	
					     	 	$('#cal_modal').iziModal('setTitle', info.event.title);  
						      	$('#cal_modal').iziModal('open');
							},
							eventMouseEnter:function(info){
									info.el.style.transform = 'scale(1.05)';
									info.el.style.cursor = 'pointer';
							},
							eventMouseLeave:function(info){
									info.el.style.transform = '';
							},
							events:[
								<c:forEach var="d" items="${list}">
									{
										id: '${d.calNO}',
										title: '${d.calTitle }',
										start: '${d.startDate }',
										end: '${d.endDate }',
										color: '${d.color }',
										extendeProps:{
											content: '${d.calcontent}',
											place: '${d.place}'
										}
									},
								</c:forEach>
							]
						});
					// 캘린더 객체 호출
					calendar.render();
				});
				
				$(function(){
					//console.log('${list}');
				})
	      </script>
		</div>
	</div>
	
	<!-- 모달 스크립트문 -->
<script>
     function repeat_anmation(){
         animateCSS('.my-element', 'bounce');
     }

     $('#cal_modal').iziModal({
     subtitle: '수정도 가능합니다.',
     headerColor: ' rgb(255,247,208)', 
     theme:'light',
     padding: '15px',
     radius: 10, 
     focusInput:	true,
     restoreDefaultContent: false, 
	  }); 
 </script>
	
<jsp:include page="/WEB-INF/views/common/sidebarFooter.jsp"/>

</body>
</html>