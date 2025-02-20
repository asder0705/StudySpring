<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp" ></jsp:include>
	 <!-- Contact Section-->
        <section class="page-section" id="contact" style="margin-top:150px">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">mypage</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon">
                    	<c:if test="${sessionScope.login.profileImg == null }">
	                    	<img src="<c:url value="/assets/img/non.png" />" 
	                    	  id="myImage" class="rounded-circle img-thumbnail shadow-sm"
	                    	  width="200px" style="cursor:pointer;"
	                    	>
                    	</c:if>
                    	<c:if test="${sessionScope.login.profileImg != null }">
                    		<img src="<c:url value="${sessionScope.login.profileImg}" />" 
	                    	  id="myImage" class="rounded-circle img-thumbnail shadow-sm"
	                    	  width="200px" style="cursor:pointer;"
	                    	>
                    	</c:if>
						<!-- 파일 전송할때는 multipart/form-data 로 전송해야함.	 -->
                    	<form id="profileForm" enctype="multipart/form-data">
                    		<input type="file" name="uploadImage" id="uploadImage"
                    		 accept="image/*" style="display:none;"  >
                    	</form>
                    </div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form method="post" action="<c:url value="/registDo" />">
                            <div class="form-floating mb-3">
                                <input disabled value="${sessionScope.login.memId}" class="form-control" name="memId" id="memId" type="text" placeholder="아이디를 입력해주세요" data-sb-validations="required" />
                                <label for="memId">아이디</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">A ID is required.</div>
                            </div>
                            <div class="form-floating mb-3">
                                <input class="form-control" value="${sessionScope.login.memNm }" id="memNm" name="memNm" type="text" placeholder="이름을 입력해주세요" />
                                <label for="memNm">이름</label>
                            </div>
                            <button class="btn btn-primary btn-xl" id="submitButton" type="submit">수정하기</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
	<jsp:include page="/WEB-INF/inc/footer.jsp" ></jsp:include>	
	<script>
		$(document).ready(function(){
			$("#myImage").click(function(){
				$("#uploadImage").click();
			});
			$("#uploadImage").on("change", function(){
				let file = $(this)[0].files[0];
				if(file){
					let fileType = file['type'];
					let valTypes = ['image/gif','image/jpeg','image/png','image/jpg'];
					if(!valTypes.includes(fileType)){
						alert("유효한 이미지 타입이 아닙니다.!!!");
						$(this).val('') //파일 초기화
					}else{
						let formData = new FormData($('#profileForm')[0]);
						console.log(formData);
						$.ajax({
							 url : "<c:url value='/files/upload' />"
							,type :"POST"
							,data:formData
							,dataType:'json'
							 // jquery가 데이터를 처리(직렬화) 할지 여부를 지정 
							 // 파일을 전송할때는 false 
							,processData:false
							,contentType:false
							,success:function(res){
								console.log(res);
								if(res.message == 'success'){
									$("#myImage").attr('src'
											, '${pageContext.request.contextPath}' + res.imgPath);
								}
							},error:function(e){
								console.log(e);
							}
						});
						
					}
				}
			});
		});
	</script>
	
</body>
</html>