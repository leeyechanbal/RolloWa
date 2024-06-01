<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지난 휴가</title>
<style>
.out-line {
	min-height: 800px;
	width: 100%;
	display: flex;
	flex-direction: row;
	box-sizing: border-box;
}

.content-area {
	width: 75%;
	max-width: 1500px;
	padding: 30px;
}

.radious10 {
	border-radius: 10px;
}

.line-show {
	box-shadow: 3px 3px 5px 2px rgb(166, 166, 166);
}

.size-fit {
	display: contents;
}

.search-date {
	display: flex;
	gap: 30px;
	align-items
}

.search-list {
	width: 100%;
	padding: 10px;
}

.search-list * {
	padding: 5px;
	text-align: center;
}

.inner-line {
	padding: 30px;
}

.inner-line>div {
	margin: 10px;
}

.fontRed {
	color: red;
}

.date-area {
	width: 30%;
	text-align: center;
}

.jua_font {
	font-family: "Jua", sans-serif;
}
.spaceNO{
    white-space: nowrap;
}
#RR_modal{
   height: fit-content;
}
</style>
</head>
<body>
	<div class="out-line">
		<!-- 메뉴판 -->
		<jsp:include page="/WEB-INF/views/common/sidebarHeader.jsp" />
		<!-- 컨텐츠 영역 -->
		<div class="content-area">
			<fieldset class="line-shadow radious10 inner-line">
				<legend>
					<h1 class="jua-regular">지난휴가</h1>
				</legend>
				<br>
				<br>
				<form class="search-date">
					<div class="font-size25 jua-regular spaceNO">검색</div>
					<div>
						<select style="border: 0px;" class="jua-regular" name="code">
							<option value="all">All</option>
						<c:forEach var="c" items="${vactList}">
							<option value="${c.code}">${c.codeName}</option>							
						</c:forEach>
						</select>
					</div>
				
					<div><button style="box-shadow: 1px 1px 1px 1px #8888887a;" type="button" onclick="ajaxSearchOld(1);" class="jua-regular btn btn-outline-dark"> 검색 </button></div>
				</form>
				<div>
					<table class="search-list table table-hover">
						<thead>
							<tr>
								<th class="font-size20 jua-regular spaceNO">No</th>
								<th class="font-size20 jua-regular spaceNO">Color</th>
								<th class="font-size20 jua-regular spaceNO">Category</th>
								<th class="font-size20 jua-regular spaceNO">Date</th>
								<th class="font-size20 jua-regular spaceNO">Using</th>
								<th class="font-size20 jua-regular spaceNO">Del</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div align="end">
					<ul class="pagination"></ul>
				</div>
			</fieldset>
		</div>
	</div>
	
	<form id="RR_modal">
		<div style="display:flex">
			<div>
				<br>
				<div style="text-align: center;" class="font-size20 jua-regular">
				정말로 삭제 하시겠습니까? 삭제 후 첨부파일 data를 복구 할 수 없습니다.
				</div>
				<br>
				<div class="jua-regular">철회 사유</div>
				<textarea name="RRequestComent" style="width: -webkit-fill-available;"></textarea>
				<input type="hidden" name="vacaNO">
			</div>
		</div>
		<div style="text-align: end;"><button type="button" class="btn btn-outline-danger" onclick="RRequest(this);">신청</button></div>
	</form>
	
	
	<script>
		$('#RR_modal').iziModal({
			headerColor : '#dc3545',
			theme : 'light',
			padding : '15px',
			radius : 10,
			zindex : 300,
			focusInput : true,
		});
		
		function ajaxSearchOld(page){
			$.ajax({
				url:'${path}/vacation/searchOld.ajax',
				type:'post',
				data:'vacaGroupCode='+$('select').val()
							+ '&page='+ page,
				success:function(map){
					console.log(map);
					
					creatTable(map.list);
					creatPaging(map.paging);
				},
				error:function(){
					console.log('list select fail');
				}
			})
		}
		
		function deleteCheck(num){
			$(document).on('opening', '#RR_modal', function (e) {
			   $(this).find('input[name="vacaNO"]').val(num);
			});
			$('#RR_modal').iziModal('setTitle', num);
			$('#RR_modal').iziModal('open');
		}
		
		function RRequest(t){
			$.ajax({
				url:'${path}/vacation/RRequest.ajax',
				type:'post',
				data:'vacaNO='+$('#RR_modal').find('input[name="vacaNO"]').val()
							+'&RRequestComent='+$('#RR_modal').find('textarea').val(),
				success:function(e){
					if(e > 0){
						greenAlert('철회 요청', '철회가 신청 되었습니다.');
						$('#RR_modal').iziModal('close');
					}else{
						redAlert('철회 요청', '관리자를 호출 해 주세요');
					}
					ajaxSearchOld(1);
				}
			})
			
		}
		
		function codeName(code){
			let string = '';
			switch (code){
				case 'A': string = '연차'; break;
				case 'B': string = '반차'; break;
				case 'C': string = '병가'; break;
				case 'G': string = '소집일'; break;
				default: string = '기타';			
			}
			return string;
		}
		
		function creatTable(list) {
			$('tbody>tr').remove();
			let tableEl = '';
			if (list.length != 0) {
				list.forEach((e) => {
					tableEl += '<tr><td>'
									+ e.vacaNO
									+ '</td>'
									+ '<td class="spaceNO"><input type="color" value="' + e.vacaColor + '" id="color-style" style="width: 35px; height: 35px; cursor: auto;" onclick="return false"></td>'
									+ '<td class="spaceNO">'
									+ codeName(e.vacaGroupCode)
									+ '</td>'
									+ '<td class="spaceNO" style="font-size: larger;">'
									+ e.vacaStart.slice(0,10) +' ~ '+ e.vacaEnd.slice(0,10)
									+ '</td>'
									+ '<td><div class="fontRed">- '
									+ ((new Date(e.vacaEnd.slice(0,10)) - new Date(e.vacaStart.slice(0,10))) / (1000 * 60 * 60 * 24) +1)
									+ '</div></td>'
									+ '<td><button class="btn btn-outline-danger" onclick="deleteCheck('+ e.vacaNO +');">철회</button></td>'
									+ '</tr>'
				})
			} else {
				tableEl += '<tr><td colspan="6">조회 되는 일정이 없습니다.</td>'
			}
			$('tbody').append(tableEl);
		};
		
		function creatPaging(paging) {
			$('.pagination>li').remove();
			let page = '';

			if (paging.currentPage == 1) {
				page += '<li class="page-item disabled"><a class="page-link">◁</a></li>';
			} else {
				page += '<li class="page-item"><a class="page-link" onclick="ajaxSearchOld('
						+ (paging.currentPage - 1) + ');">◁</a></li>';
			}

			for (let i = paging.startPage; i <= paging.endPage; i++) {
				if (paging.currentPage == i) {
					page += '<li class="page-item active"><a class="page-link">'
							+ i + '</a></li>';
				} else if (i <= paging.maxPage) {
					page += '<li class="page-item"><a class="page-link" onclick="ajaxSearchOld('
							+ i + ');">' + i + '</a></li>';
				} else {
					page += '<li class="page-item disabled"><a class="page-link">'
							+ i + '</a></li>';
				}
			}

			if (paging.currentPage >= paging.maxPage) {
				page += '<li class="page-item disabled"><a class="page-link">▷</a></li>';
			} else {
				page += '<li class="page-item"><a class="page-link" onclick="ajaxSearchOld('
						+ (Number(paging.currentPage) + 1)
						+ ');">▷</a></li>';
			}
			$('.pagination').append(page);
		};
		
		$(document).ready(function(){
			ajaxSearchOld(1);
			
		})
	</script>
<jsp:include page="/WEB-INF/views/common/sidebarFooter.jsp" />
</body>
</html>