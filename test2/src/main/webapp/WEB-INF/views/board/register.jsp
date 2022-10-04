<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Register</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-header bg-primary text-white">게시글 등록</div>
      <div class="card-body">



        <form role="form" action="register" method="post" id="regForm">
          <div class="form-group">
            <label>제목</label>
            <input class="form-control" name='title' id='title'>
          </div>

          <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="5" name='content' id='content'></textarea>
          </div>

          <div class="form-group">
            <label>작성자</label>
            <input class="form-control" name='writer' id='writer'>
          </div>
          <button type="button" class="btn btn-primary" onclick="register()">등록</button>
          <button type="button" class="btn btn-primary" onclick="location.href='list?pageNum=${cri.pageNum}&count=${cri.count }'">취소</button>
        </form>



      </div>
      <!--  end card-body -->
    </div>
    <!--  end card-body -->
  </div>
  <!-- end card -->
</div>
<!-- /.row -->

<script type="text/javascript">
	function register() {
		
		if($("#title").val() == "") {
			
			$("#myModal").modal("show");
		}else if($("#writer").val() == "") {
			
			$("#myModal").modal("show");
		}else{
			$("#regForm").submit();
		}
	}
</script>

 <div class="modal fade" id="myModal">
 	<div class="modal-dialog">
 		<div class="modal-content">
 			<!-- Modal Header -->
 			<div class="modal-header">
 				<h4 class="modal-title">Modal Heading</h4>
 				<button type="button" class="close" data-dismiss="modal">&times;</button>
 			</div>
 			<!-- Modal Body -->
 			<div class="modal-body">제목, 작성자는 필수 사항입니다.</div>
 			<!-- Modal Footer -->
 			<div class="modal-footer">
 				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
 			</div>
 		</div>
 	</div>
 </div>