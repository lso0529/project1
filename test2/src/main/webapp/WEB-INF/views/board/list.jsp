<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

</head>

<body id="page-top">
	<!-- Page Wrapper -->


	<!-- Begin Page Content -->
	

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">게시판</h1>


		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">후기 게시판
				 
                    <button type="button" class="btn btn-primary btn-sm float-right" onclick="location.href='register?pageNum=${pageMaker.cri.pageNum}&count=${pageMaker.cri.count }'">글쓰기</button>
                   
                </h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정일</th>
								
							</tr>
						</thead>
						<tbody>
						<c:forEach var="article" items="${board_list}" >
							<tr>
								<td>${article.bno }</td>
								<td>
									
									<a href="content?num=${article.bno }&pageNum=${pageMaker.cri.pageNum}&count=${pageMaker.cri.count}">${article.title }</a> 
									
							
								</td> 
								<td>${article.writer }</td>
								<td>
									<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${article.regdate }"/></td>
								<td>
									<fmt:formatDate pattern="yyyy-MM-dd" value="${article.updatedate }"/></td>
							</tr>
						</c:forEach>
						</tbody>
						
					</table>
					
					<ul class="pagination justify-content-center">
                       	 			
                       	 <!-- 이전 페이지 활성화 여부 -->
                       	 <c:if test="${pageMaker.prev }">
                       	 	<li class="page-item">
                       	 	<!-- 이전 페이지 활성화 -->
								<a class="page-link" href="list?pageNum=${pageMaker.startPage -1 }" >Previous</a>
							</li>
					     </c:if>
					   <!-- 페이지번호 활성화 여부 -->
					   <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
					   
					    <li class="page-item ${pageMaker.cri.pageNum == num ? 'active':'' }">
					    	<a class="page-link" href="list?pageNum=${num }">${num }</a>
					    </li>
					   </c:forEach>
					   
					   <c:if test="${pageMaker.next }">
					    <li class="page-item">
					    
					      <a class="page-link" href="list?pageNum=${pageMaker.endPage +1 }">Next</a>
					    </li>
					   </c:if>
				    </ul>
					<!-- 페이징 처리 끝 -->
				</div>
			</div>
		</div>
	<!-- End of Main -->

</body>

</html>