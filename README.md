#  [ Project ] RolloWa
<img src="https://github.com/leeyechanbal/RolloWa/assets/153481748/456bbb2e-d41f-4e61-9f10-87aff157ebb0"  height="100px">

***

## :sparkles: [ Summary ]
> 놀이공원 운영을 위한 효율적인 그룹웨어 서비스 <br>
> 출/퇴근, 매출 현황, 비품 관리부터 전자결재, 일정 및 채팅까지 다양한 기능을 통해 업무를 간편하게 관리할 수 있습니다.

## :date: [ Develop Date ]
> <p>$\large{2024.04.08\ ~ \ 2024.06.07}$</p>
> 1주 차 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 요구사항 제안 및 문서화 <br>
> 2 ~ 3주 차 : 기능 분석 및 DB설계       <br>
> 4 ~ 5주 차 : html 및 화면 구성        <br>
> 5 ~ 8주 차 : 기능 구현                <br>
> 9주 차 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 기능 테스트  <br>

[PPT : https://www.notion.so/6f82052c952b487c83cab947dab2f65f](https://docs.google.com/presentation/d/1dv7Br13IOE09YON_pPn6MN_0A58Ti5bdaWc-CMmNPjI/edit?hl=ko#slide=id.g2e2a7122927_1_230)


## 🧑🏻‍💻 [ Contribute ]
> - <p>$\bf{\color{#5882FA} 이예찬 : \ 부서일정,\  회사 일정, \ 휴가 신청, \ 휴가 결재, \ 이용권결제}$</p>
> - 배기웅 : 로그인, 마이페이지, 알림, 채팅
> - 김호관 : 조직관리, 구성원관리, 예약관리
> - 유가림 : 메인페이지, 게시판, 어트랙션, 이용권매출
> - 이문희 : 전자결재, 이용권결제


## :four_leaf_clover: [ Stack ]
<div>
  <img src="https://img.shields.io/badge/html5-E34F26?logo=html5&logoColor=white" height="30px"> 			&nbsp;
  <img src="https://img.shields.io/badge/css3-1572B6?logo=css3&logoColor=white" height="30px"> 				&nbsp;
  <img src="https://img.shields.io/badge/javascript-F7DF1E?logo=javascript&logoColor=black" height="30px"> 		&nbsp;
  <img src="https://img.shields.io/badge/jquery-0769AD?logo=jquery&logoColor=white" height="30px"> 			<br><br> 
  <img src="https://img.shields.io/badge/visualstudiocode-007ACC?logo=visualstudiocode&logoColor=white" height="30px">  &nbsp;
  <img src="https://img.shields.io/badge/spring-6DB33F?logo=spring&logoColor=white" height="30px"> 			&nbsp;
  <img src="https://img.shields.io/badge/java11-007396?logo=OpenJDK&logoColor=white" height="30px"> 			&nbsp;
  <img src="https://img.shields.io/badge/oracle-F80000?logo=visualstudiocode&logoColor=white" height="30px"> 		<br><br> 
  <img src="https://img.shields.io/badge/github-181717?logo=github&logoColor=white" height="30px"> 			&nbsp;
  <img src="https://img.shields.io/badge/apachetomcat9-F8DC75?logo=apachetomcat&logoColor=black" height="30px"> 	<br><br> 
  <img src="https://img.shields.io/badge/fullcalendar-4285F4?logo=googlecalendar&logoColor=black" height="30px"> 	&nbsp;
  <img src="https://img.shields.io/badge/bootstrap4-7952B3?logo=bootstrap&logoColor=black" height="30px"> 		&nbsp;
  <img src="https://img.shields.io/badge/maven-C71A36?logo=apachemaven&logoColor=black" height="30px"> 			&nbsp;
  <img src="https://img.shields.io/badge/notion-000000?logo=notion&logoColor=whitek" height="30px"> 			<br><br>
</div>

***


## ⚙️ [ Functions ]

### ① [ 부서일정 ]
> fullcalendar 이용해서 부서별로 일정과 휴가를 <b>년도, 월, 주, 일별</b>로 조회가 가능합니다. 		<br>
> 각 일정의 상세 정보는 iziModal이라는 <b>외부 CSS</b> 이용하여 보여주고 있습니다. 				<br>
> 일정 등록 시에는 input의 값을 초기화 현재 날짜, 시간으로 이틀 차이가 나도록 초기화하고 있으며  	<br>
> 종일 버튼을 이용하여 <b>오늘 날짜의 12시간이</b> 차이가 나도록 되어있습니다. 				<br>
> 단, 사용자가 이전 날짜가 더욱 큰 값으로 일정 등록시 알림창을 통해 알려주며 일정이 등록되지 않습니다.  <br>
> 회월별 검색은 <b>로그인된 회원이</b> 가장 왼쪽에 배치되며 자신이 속한 팀원이 조회 됩니다.			<br>
> 조회된 회원이 일정이 없을 경우 알림창을 통해 사용자에게 알려 주고 있습니다.				<br>

### ① - 1 { 부서일정 등록 및 수정}
> 처음 페이지 이동 시 1년 동안의 일정 정보를 ajax을 사용해서 DB에서 조회해 오며 fullcalendar의 event 속성값을 이용해 data을 		<br>
> 저장하고 있습니다. 각 저장된 data는 iziModal에서 제공하는 opening매서드를 사용하여 각 모달의 input 및 teatarea에 value값으로		<br>
> 초기화되고 있습니다.														<br>
> 모달의 정보를 수정하고 수정 버튼을 클릭 시 <b>ajax의 serialize를</b> 이용하여 데이터를 전달 및 db에 저장합니다.				<br>
> 수정 후 function에 정의해둔 ajax을 이용해 다시 한번 변경된 일정을 조회합니다.							<br>

> ![부서일정_등록수정](https://github.com/leeyechanbal/RolloWa/assets/153481748/2dac44ba-9921-4d93-8db2-b65038e44ff3)
### ① - 2 { 부서일정 조회 }

> ![부서일정_조회](https://github.com/leeyechanbal/RolloWa/assets/153481748/926c511d-e76d-47a4-b12a-68797299bfc5)
### ① - 3 { 부서일정 직원별 조회 }
> 로그인된 회원의 팀 코드를 이용하여 팀원들의 정보를 List<MemberDto>에 조회해 옵니다.  		<br>
> 로그인된 회원의 회원 번호를 이용해 조회해 온 팀원 List<>에서 일치하는 회원을 if문으로 찾아내서	<br>
> 맨 처음 위치에 저장하고 원래 저장된 위치에서 로그인된 유저의 정보를 삭제합니다.			<br>


 
	MemberDto member = (MemberDto)session.getAttribute("loginMember");
	String teamCode = member.getTeamCode();
	List<MemberDto> teams = calService.selectTeamPeer(teamCode);

	for(int i =0; i<teams.size(); i++) {
	    MemberDto m = teams.get(i);
	    if(m.getUserNo() == member.getUserNo()) {
		teams.add(0, teams.remove(i));
		}
	}


> ![부서_직원검색](https://github.com/leeyechanbal/RolloWa/assets/153481748/c03e07a1-7e17-4534-a60a-539ce3a1f7b2)

### ② [ 회사일정 ]
> 회사의 일정 등록 페이지를 이동할때  Spring의 <b>interceptor와</b> HttpSession을 통해 로그인된 회원의 권한을 체크하고		<br>
> 권한이 부족한 회원일 경우 알림창으로 알려주며 historyback을 이용해 이전 화면으로 되돌리고 있습니다. 			<br>

> ![권한_체크](https://github.com/leeyechanbal/RolloWa/assets/153481748/d3cc258a-19a9-4b08-8ae8-adc1905b5a4c)

### ③ [ 일정관리 ]
> 회사 일정과 부서 일정을 bootstrap의 selector를 이용하여 구분하여 조회 할 수 있으며					<br>
> 검색된 기간 안의 모든 일정을 조회할 수 있습니다.									<br>
> 각 행의 마지막의 체크박스를 통해 <b>다중으로 일정이 삭제가</b> 가능합니다.						<br>
> jQurey의 input:checked된 타입을 탐색하여 serialize 이용해 선택된 일정 번호를 넘겨주고 있습니다. 			<br>

> ![일정관리_삭제](https://github.com/leeyechanbal/RolloWa/assets/153481748/197ecabc-6585-428f-a75a-7a27bc9556b4)

### ④ [ 휴가신청 및 결재 ]
> 휴가 신청은 각 모달을 통해 휴가를 신청합니다.									<br>
> 신청된 휴가는 각 팀의 부장에게 자동으로 결재를 요청합니다.								<br>
> 휴가가 결재되는 것에 따라 연차가 줄어들고 사용 일수가 늘어납니다.							<br>
> 자신이 사용한 휴가에만 잘못된 승인된 휴가나 사용하지 못한 휴가를 <b>철회 요청할</b> 수 있습니다.				<br>
> 철회 각 팀의 부장급에게 자동으로 신청되며 신청된 철회는 <b>관리자의 판단하에 승인, 반려</b>됩니다.				<br>
> 철회 승인될 시 연차의 개개수가 늘어나고 사용 일수가 줄어듭니다.							<br>

### ④ - 1 { 휴가 신청 및 반려 }
> 휴가 종류별 각 모달을 통해 데이터를 입력하며 입력된 데이터를 FormData을 통해서 Controller에 전달하고 있습니다.	<br>
> 신청된 휴가는 ajax을 통해 다시 조회되어 결재 대기 테이블에서 바로 확인이 가능합니다.				<br>
> 첨부파일(이미지)이 존재한는 휴가일 경우										<br>
> 휴가 신청이 실패 시 Java의 File객체를 이용하여 등록되었 파일이 삭제되도록 구현했습니다. 				<br>

	if (result <= 0) {
		if (files != null && !files.isEmpty()) {
			for (AttachmentDto att : uploadFile) {
				new File(att.getAttachPath(), att.getModifyName()).delete();
			}
		}
	}
 
> 첨부파일에 대한 기능을 모듈화하여 사용했습니다.									<br>
> java의 File객체를 이용해 exists로 폴더의 여부를 확인하여 <b>mkdirs을 이용해 directory를 생성</b>했으며			<br>
> UUID.randomUUID을 이용해서 36자리의 난수로 파일의 고유명을 생성했습니다.						<br>

> ![휴가반려_삭제](https://github.com/leeyechanbal/RolloWa/assets/153481748/9476adf8-40e7-4450-9e69-c2755b67c902)
### ④ - 2 { 휴가 승인 }
> 팀원이 신청한 휴가가 결재되었을떄 false와 true값을 이용해 휴가인지 철회 요청인지 구분하여				<br>
> 휴가 신청일시 쿼리를 통해 사용한 날짜에 대해 연차 수가 차감되고 사용일수가 늘어나게 구현했으며			<br>
> 철회 신청일시 반대로 철회 요청일시는 반대로 연차 수를 늘리고 사용 일수가 줄어들도록 구현했습니다.			<br>

> ![휴가_승인](https://github.com/leeyechanbal/RolloWa/assets/153481748/21e31785-2cbd-408b-8b72-12ed97954d76)
### ④ - 3 { 휴가 철회 승인 }
> ![휴가철회_승인](https://github.com/leeyechanbal/RolloWa/assets/153481748/168198df-87f0-4817-909f-d0e790e846d9)

### ④ - 4 { 휴가 정보 }
> 휴가 정보 ( 연차, 사용 일수, 지급일, 근무연수 )를 자동으로 초기화 합니다.								<br>
> <b>지급일은</b> 입사일을 기준으로 <b>트리거를</b> 이용하여 자동으로 게산하여 들어가며								<br>
> 근무연수는 1,6월의 scheduler을 이용하여 1년미만인 경우 <b>LocalDate와 지급일을</b> 가지고 지난달의 날짜를 생성해				<br>
> 현재의 날짜와 같은지를 비교하여 연차의 개수를 하나씩 증가 시키고									<br>
> 1년 이상일 경우 LocalDate와 지급일을 이용하여 작년 입사일이 같은지 비교하여<b> (16일 + 근무연수)의 연차가 갱신</b>되도록 구현 했습니다.	<br>
> 연차와 사용 일수에 대해서는 위의 휴가 결재 및 철회 결재를 통해 승인여부에 따라 갱신되고 있습니다.					<br>

## 30일 및 1년이 되었는지 체크하는 코드
		LocalDate currentDate = getNowDate();

		int result = 1;
		int year = Integer.parseInt(member.getVaYearLabor());
		//1년차 이상
		if(year > 0) {
			LocalDate givenDate = LocalDate.of(currentDate.getYear() - 1
   							 , currentDate.getMonthValue()
	   						 , Integer.parseInt(member.getVaGivenDate()));
			// 1년이 지날때 마다
			if(givenDate.plusYears(1).isEqual(currentDate)) {
				//연차 15 + 근수연수 member.getVaYearLabor()
				member.setVacationCount(year  + 16);
				result = vacationDao.updateAnuul(member);
			}
		// 1년차 미만
		}else {
			LocalDate givenDate = LocalDate.of(currentDate.getYear()
					   		 , currentDate.getMonthValue() - 1
					   		 , Integer.parseInt(member.getVaGivenDate()));
			// 30일이 지날때마다
			if(givenDate.plusDays(30).isEqual(currentDate)) {
				//연차 +1
				member.setVacationCount(1);
				result = vacationDao.updateAnuul(member);				
			}
		}
		return result;
	}

### ⑤ [ 이용권 결재 ]
> 포트원 API를 이용하여 드사와 결재 수단, 구매 고유번호 등을 생성 및 V1모달을 통해 포트원으로 전달하여			<br>
> 결재를 진행하고 반환되는 정보를 이용해서 구매 고유번호, 결재상태, 수량, 가격, 구매자 정보들을 ajax의			<br>
> JSON.stringify()을 이용하여 DB에 결재 명세를 저장했습니다.								<br>

![토스페이](https://github.com/leeyechanbal/RolloWa/assets/153481748/d279f179-23dd-4f0a-9d4b-c54428c41300)


***

### ❔ [ retrospect ]
- 내가 기능적으로 부족했던 부분	<br>
  - 철회 나 승인을 관리자가 잘못 결재했을 경우 =>							<br>
  - 웹훅을 이용한 결제 유효성 검증 =>								<br>
  - 휴가의 양식 및 보고서 형태로 결재 되도록 구현 =>						<br>
      
- 협업에서 부족한 부분			<br>
  - 제안이 부족했던 것 같다. 팀원끼리의 진행 상황, 프로그램 오류나 DB 설계에 있어서는 지속적으로 토론되었다.		<br>
    다만, 각 팀원이 구현하고 있는 기능에 해서도 토론을 통해 더 좋은 제안이 가능했을 것 같다.				<br>
    비품관리는 fullcalendar의 timegrid을 이용해서 구현하고 마이페이지는 구성원 상세 조회를 통해			<br>
    구현했다면 더 좋은 프로그램이 되었을 것 같다.									<br>
    다음 스터디나 프로젝트에 있어서는 진행 상황뿐만 아니라 구현하고 있는 기능들에 대해서 서로 토론하고			<br>
    제안을 통해 더 좋은 방향으로 구현 될 수 있도록 노력해야 될 것 같다.						<br>

  - 사실 팀원별로 브랜치를 이용한 개발 작업은 이번이 처음이었다.							<br>
    그렇다 보니 github_Desktop의 propt를 이용한 각 브랜치의 main정보 갱신이 잘 안 이루어졌던 것 같다.		<br>
    그래서 이전의 commit된 정보로 갱신되어 팀원 자신이 개발한 코드가 되돌아간 경우가 여러 번 있었다.			<br>
    추후에서 merge가 완료되면 바로바로 갱신함으로 문제를 해결했지만							<br>
    다음번에는 이 작업을 최우선시해서 무의미한 시간을 줄여야겠다.							<br>



