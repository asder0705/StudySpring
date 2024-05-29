<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>스프링 웹 프로젝트</title>
    </head>
    <body id="page-top">
    
		<!-- nav 영역	 -->
    	<jsp:include page="/WEB-INF/inc/top.jsp" ></jsp:include>
    	<!-- nav 영역	 -->
    		<!-- Contact Section-->
        <section class="page-section" id="contact" style="margin-top: 150px">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">메일전송</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form method="post" action="<c:url value="/sendMailDo"  />" >
                        	<div class="form-floating mb-3">
                        		<input class="form-control" name="title" type="text" 
                        		   placeholder="제목을 작성해주세요 ">
                        		<label>제목</label>
                        	</div>
                        	<div id="emailArr">
	                        	<div class="form-floating mb-3" id="email0" >
	                        		<input class="form-control"  type="email" name="email[0]" 
	                        		   placeholder="email주소를 입력해주세요 ">
	                        		<label>이메일 주소</label>
	                        	</div>
                        	</div>
                        	<div class="d-flex justify-content-end">
                        		<button id="addBtn" type="button" class="btn btn-primary">+</button>
                        	</div>
                        	<div class="form-floating mb-3">
                        		<input class="form-control" name="content" type="text" 
                        		   placeholder="내용">
                        		<label>내용</label>
                        	</div>
                        	<button class="btn btn-primary btn-xl" type="submit">전송하기</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
		<!-- footer영역 -->
		<jsp:include page="/WEB-INF/inc/footer.jsp" ></jsp:include>
		<!-- footer영역 -->
        <script>
	        	$(document).ready(function(){
	        		  let cnt = 1;
	        		  $("#addBtn").click(function(){
	        			 let div_clone = $("#email0").clone(true);// div 복사
	        			 div_clone.attr("id", "email" + cnt);
	        			 div_clone.find("input").attr("name", "email[" + cnt + "]").val('');
	        			 div_clone.find("label").attr("for", "email"+cnt);
	        			 $("#emailArr").append(div_clone);
	        			 cnt++;
	        		  });
	        	});
        
        
        </script>
     </body>
</html>

