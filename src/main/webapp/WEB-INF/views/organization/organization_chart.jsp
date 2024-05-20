<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1.1 조직도</title>

    <!-- 조직도 참고 사이트
       https://www.cssscript.com/clean-tree-diagram/
    -->

	<!-- css -->
	<link rel="stylesheet" href="${contextPath}/resources/css/organization/organization.css">
	
	<style>
	.level2:hover, .level3:hover {
		cursor: pointer;
	}
	.level2:hover{
		background-color: rgb(22, 86, 80);
	}
	.level3:hover {
		background-color: gray;
	}
	</style>
	
</head>
<body>

	<!-- 사이드바 푸터 영역 -->
	<jsp:include page="/WEB-INF/views/common/sidebarHeader.jsp"/>
	
	<!-- 메인 영역 start -->
	<div class="main_content">
	    <h2>조직도</h2>
	    <hr>
            
		<ul class="tree">
		  <li> <span class="level1">대표이사</span>
		    <ul>
			    <c:set var="prevDept" value="" />
				<c:forEach var="d" items="${dept}">
				    <c:if test="${d.dept ne prevDept}">
				        <li>
				            <a href="${contextPath}/organization/search.do?page=1&department=${d.dept}&phone=&team=전체 팀&name="><span class="level2">${d.dept}</span></a>
				            <ul>
				                <c:forEach var="team" items="${dept}">
				                    <c:if test="${d.dept eq team.dept}">
					                    <ul>
					                        <li><a href="${contextPath}/organization/search.do?page=1&department=${team.dept}&team=${team.team}&phone=&name="><span class="level3">${team.team}</span></a></li>
				                        </ul>
				                    </c:if>
				                </c:forEach>
				            </ul>
				        </li>
				        <c:set var="prevDept" value="${d.dept}" />
				    </c:if>
				</c:forEach>
			
		    </ul>
		  </li>
		</ul>
		
		<script>
		  $(document).ready(function() {
		      var treeItems = $('.tree > li > ul > li').length;
		      if (treeItems > 1) {
		          $('.tree > li > ul').css('display', 'flex');
		          $('.tree > li > ul').css('flex-wrap', 'wrap');
		        }
		  });
		</script>
		
		<!-- ------------ -->
	
	</div>
	<!-- 메인 영역 end-->
	
	<!-- 사이드바 푸터 영역 -->
	<jsp:include page="/WEB-INF/views/common/sidebarFooter.jsp"/>
		
</body>
</html>