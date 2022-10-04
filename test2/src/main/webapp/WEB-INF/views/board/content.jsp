<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Read Page</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-header bg-primary text-white">상세보기</div>
      <div class="card-body">

          <div class="form-group">
            <label>번호</label>
            <input class="form-control" value="${board.bno }" readonly="readonly"><!-- 읽기만 가능 readonly속성 -->
          </div>
          
          <div class="form-group">
            <label>제목</label>
            <input class="form-control" value="${board.title }" readonly="readonly">
          </div>

          <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="5" readonly="readonly">${board.content }</textarea>
          </div>

          <div class="form-group">
            <label>작성자</label>
            <input class="form-control" value="${board.writer }" readonly="readonly">
          </div>
          <!-- 페이징 -->
          <!-- 9.목록으로 이동시 pageNum과 count값을 넘김 -->
          <!-- 10.변경을 클릭시 pageNum과 count값을 넘김 -->
          <button type="button" class="btn btn-primary" onclick="location.href='modify?num=${board.bno}&pageNum=${cri.pageNum}&count=${cri.count }'">변경</button>
          <button type="button" class="btn btn-dark" onclick="location.href='list?pageNum=${cri.pageNum}&count=${cri.count }'">목록</button>

      </div>
      <!--  end card-body -->
    </div>
    <!--  end card-body -->
  </div>
  <!-- end card -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
	
	<!-- /.panel -->
	<div class="panel panel-default">
<!-- <div class="panel-heading">
	    <i class="fa fa-comments fa-fw"></i> Reply
	  </div>
-->	  

	<div class="panel-heading">
		<i class="fa fa-comments fa-fw"></i> Reply
		  <button id="addReplyBtn" class="btn btn-primary btn-sm pull-right">New Reply</button>
	</div>
	  <!-- /.panel-heading -->
	  <div class="panel-body">
	    <ul class="chat" style="list-style-type:none;">
		  
	    </ul>
	    <!-- ./end ul -->
	  </div>
	  <!-- /.panel .chat-panel -->
	  
	  <div class="panel-footer">
	  
	  </div>
	</div>	
   </div>
	<!-- ./end row -->
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
	aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLable">REPLY MODAL</h4>
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label>Reply</label>
          <input class="form-control" name='reply' value="new Reply">
        </div>
        <div class="form-group">
          <label>Replyer</label>
          <input class="form-control" name='replyer' value="replyer">
        </div>
        <div class="form-group">
          <label>Reply Date</label>
          <input class="form-control" name='replyDate' value="">
        </div>
      </div>
      <div class="modal-footer">
        <button id='modalModifyBtn' type="button" class="btn btn-warning">Modify</button>
        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.Modal-diallog -->
</div>
<!-- /.Modal -->

<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
<script>
$(document).ready(function(){
	var bnoValue = '<c:out value="${board.bno }"/>';
	var replyUL = $(".chat");	
	
		showList(1);
	
		function showList(page){
			console.log("show list : "+page);
			
			replyService.getList({bno:bnoValue, page:page||1}
			,function(replyCnt,list){
				
				//입력값 검증
				console.log("replyCnt: "+replyCnt);
				console.log("list: "+list);
				console.log(list);
				
				//page번호가 -1로 전달되면 마지막 페이지를 찾아서 다시 호출
				if(page == -1) {
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
				
				var str="";
				if(list == null || list.length == 0) {
					replyUL.html("");
					return;
				}
				for(var i=0,len=list.length||0;i<len;i++) {
					str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str += "<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
					str += "<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
					str += "<p>"+list[i].reply+"</p></div></li>";
				}
				
				replyUL.html(str);
				
				showReplyPage(replyCnt);
			});
		}	
		
		//새로운 댓글 추가 버튼
		
		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		var modalModifyBtn = $("#modalModifyBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		//새 댓글 등록
		$("#addReplyBtn").on("click", function(e){
			modal.find("input").val("");
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id != 'modalCloseBtn']").hide();
			
			modalRegisterBtn.show();
			
			$("#myModal").modal("show");
		});
		
		//등록버튼 동작
		modalRegisterBtn.on("click", function(e){
			
			var reply = {
					reply : modalInputReply.val(),
					replyer : modalInputReplyer.val(),
					bno : bnoValue
			};
			
			replyService.add(reply, function(result){
				alert(result);
				
				modal.find("input").val("");
				modal.modal("hide");
				
			
				showList(-1);
			});
			
		});
		
		//댓글 클릭 이벤트
		$(".chat").on("click","li",function(e){
			var rno = $(this).data("rno");
			
			replyService.get(rno,function(reply) {
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);	
				modalInputReplyDate.val(
						replyService.displayTime(reply.replyDate))
						.attr("readonly","readonly");
				modal.data("rno",reply.rno);
				
				modal.find("button[id != 'modalCloseBtn']").hide();
				modalModifyBtn.show();
				modalRemoveBtn.show();
				
				$("#myModal").modal("show");
			});
		});
		
		//댓글 수정 버튼
		modalModifyBtn.on("click",function(e){
			
			var reply = {rno:modal.data("rno"),reply:modalInputReply.val()};
			
			replyService.update(reply,function(result){
				
				alert(result);
				modal.modal("hide");
				showList(pageNum);
				
			});
		});
		
		//댓글 삭제 버튼
		modalRemoveBtn.on("click",function(e){
			
			var rno = modal.data("rno");
			
			replyService.remove(rno,function(result){
				
				alert(result);
				modal.modal("hide");
				showList(pageNum);
				
			});
		});
		
		//페이지 num정하는 js
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
		function showReplyPage(replyCnt) {
			
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= replyCnt){
				endNum = Math.ceil(replyCnt/10.0);
			}
			
			if(endNum * 10 < replyCnt){
				next = true;
			}
			
			var str = "<ul class='pagination pagination-sm pull-right'>";
			
			if(prev){
				str += "<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
			}	
				for(var i =startNum;i<= endNum;i++){
					var active = pageNum == i?"active":"";
					str += "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
				}
				
			if(next) {
				str += "<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
			}	
				
			str += "</ul></div>";
			
			console.log(str);
			
			replyPageFooter.html(str);
		}
		
		replyPageFooter.on("click","li a",function(e){
			e.preventDefault();		//기본 동작 제한 - 링크 연결X
			console.log("page click");
			
			var targetPageNum = $(this).attr("href");
			
			console.log("targetPageNum : "+targetPageNum);
			
			pageNum = targetPageNum;
			
			showList(pageNum);
			
		});
		
});
</script>


</body>
</html>