<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<!-- ${pageContext.request.contextPath} -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- alert 모달 필수  --> 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill@7.1.0/dist/promise.min.js"></script>

<h1>main/nickCheck.jsp </h1>

<!-- login 성공 메세지 불러오기 -->
<script>
$(document).ready(function(){	
	let message = "${msg}";
// 	alert()
	if(message!="") {
		login(message);
	}
 });
</script>

<!-- login 성공 alert 모달 -->
<script>
function login(message) {
  	Swal.fire({
	  title: '',
	  text: message,
	  imageUrl: '${pageContext.request.contextPath}/resources/img/logo.png',
	  imageWidth: 200,
	  imageHeight: 50,
	  imageAlt: 'Custom image',
   	})
}
</script>


<script>
$(document).ready(function(){	     
	var nickflag = document.getElementById("nickflag");
// 	alert(idflag.value);

    // 아이디 중복여부를 확인한 뒤 submit 가능
    $("#nickJoin").submit(function(){
		if(nickflag.value=="false") {
	    	alert("닉네임 중복 여부를 확인하세요");
	    	$("#id").focus();
			return false;
		}
    });
    
    $("#nick").change(function(){
// 		alert('닉네임 중복체크');
		$.ajax({
            url : "/member/nickcheck",
            data: {'nick':$("#nick").val()},
            success : function(result) {
            	if(result == "no"){
		            //닉네임이 존재할 경우 빨강으로 , 아니면 파랑으로 처리하는 디자인
		            Swal.fire({
					  title: '이미 존재하는 닉네임입니다.',
					  text: '다른 닉네임을 선택하세요.',
					  imageUrl: '${pageContext.request.contextPath}/resources/img/logo.png',
					  imageWidth: 200,
					  imageHeight: 50,
					  imageAlt: 'Custom image',
				   	})
		            document.getElementById("nick").value=="";
		            $("#nick").focus();
           		} else if(result == "ok"){
           		 	$(".nickdiv").html("사용 가능한 닉네임입니다.");
		            $(".nickdiv").css("color","blue");
           		} else {
           			$(".nickdiv").html("");
           		}
            },//success
            error : function(error) {
            	$('.iddiv').html("에러");
            	return false;
            }//error
 		});//ajax
	});//nickcheck
});
</script>

<div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card border-0 shadow rounded-3 my-5">
          <div class="card-body p-4 p-sm-5">
            <h5 class="card-title text-center mb-5 fw-light fs-5"><b>닉네임</b></h5>
            <form action="/main/nickJoin" method="post" id="nickJoin">
				<div class="form-floating mb-3">
                <input type="tel" name="nick" class="form-control" id="nick" placeholder="전화번호" min="2" required>
                <label for="floatingInput">닉네임 확인하기</label>
                <span class="nickdiv">&nbsp;</span>
              </div>
				<hr class="my-4">
              <div class="d-grid">
                <input type="hidden" value="false" id="nickflag" placeholder="아이디 중복체크 했나요?"> <br>
                <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">확인하기</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End login -->              

<%@ include file="../include/footer.jsp"%>