<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 게시판</title>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp" ></jsp:include>
	<section class="page-section">
		<div class="container">
		   <div class="d-flex justify-content-end">
		   </div>
		   <table class="table table-hover" style="margin-top:50px">
		   		<thead>
		   			<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th></tr>
		   		</thead>
		   		<tbody>
					<!-- 게시글 출력 -->
					<c:forEach items="${boardList }" var="board">
						<tr>
							<td>${board.boardNo}</td>
							<td>
							<a href="<c:url value="/boardDetailView?boardNo=${board.boardNo}" />">
									${board.boardTitle}
								</a>
							</td>
							<td>${board.memNm}</td>
							<td>${board.boardDate}</td>
						</tr>
					</c:forEach>
		   		</tbody>
		   </table>
		   <a href="<c:url value="boardWriteView" />">
		   		<button type="button" class="btn btn-primary">글쓰기</button>
		   </a>	
		</div>
	</section>	
	<table>	
	   <tr>	
	   	   <th>대분류</th>
	   	   <td>
	   	   		<select id="mainSel">
	   	   			<option value="">-- 선택하세요 --</option>
	   	   			<c:forEach items="${comList }" var="code">
	   	   				<option value="${code.commCd}">${code.commNm}</option>
	   	   			</c:forEach>
	   	   		</select>
	   	   </td>
	   	   <th>중분류</th>
	   	   <td>
	   	   	   <select id="subSel">
	   	   	   		<option value="">-- 선택하세요 --</option>
	   	   	   </select>
	   	   </td>
	   </tr>	
	</table>
	<script>
		  $(document).ready(function(){
			  $("#mainSel").on('change', function(){
					let code = $(this).val();
					if(code == ''){
						$("#subSel").empty().append('<option value="">-- 선택하세요 --</option>');
						return;
					}
					$.ajax({
						 url : '<c:url value="/api/getSubCodes" />'
						,type : 'GET'
						,data : {commParent : code}
						,dataType:'json'
						,success : function(res){
							$("#subSel").empty().append('<option value="">-- 선택하세요 --</option>');
							$.each(res, function(idx, item){
								$("#subSel").append('<option value="'+item.commCd+'" >'
									             	+ item.commNm + '</option>'  );
							});
						},error :function(e){
							console.log(e);
						}
					});
			  });
		  });
			
	</script>
	
	<jsp:include page="/WEB-INF/inc/footer.jsp" ></jsp:include>
</body>
</html>