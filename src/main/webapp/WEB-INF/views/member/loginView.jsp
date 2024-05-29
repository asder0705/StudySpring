<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp" ></jsp:include>
	 <!-- Contact Section-->
        <section class="page-section" id="contact" style="margin-top:150px">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">로그인</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form method="post" action="<c:url value="/loginDo" />">
                            <div class="form-floating mb-3">
                                <input value="${cookie.rememberId.value}" class="form-control" name="memId" id="memId" type="text" placeholder="아이디를 입력해주세요" data-sb-validations="required" />
                                <label for="memId">아이디</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">A ID is required.</div>
                            </div>
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memPw" name="memPw" type="password" placeholder="비밀번호를 입력해주세요" data-sb-validations="required" />
                                <label for="memPw">비밀번호</label>
                                <div class="invalid-feedback" data-sb-feedback="password:required">An password is required.</div>
                            </div>
                            <div class="form-floating mb-3">
                            	아이디 기억하기<input ${cookie.rememberId.value==null ? "" : "checked"} 
                            	   class="form-check-input" type="checkbox" name="remember" id="rememberId">
                            </div>
                            <button class="btn btn-primary btn-xl" id="submitButton" type="submit">Login</button>
                            <input type="hidden" name="fromURL" value="${fromURL}">
                        </form>
                    </div>
                </div>
            </div>
        </section>
		
	<jsp:include page="/WEB-INF/inc/footer.jsp" ></jsp:include>
</body>
</html>