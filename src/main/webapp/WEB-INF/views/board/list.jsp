<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				Board List Page
				<button id="regBtn" type="button"
					class="btn btn-xs btn-primary pull-right">Rigister New
					Board</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${list}">
							<tr class="odd gradeX">
								<td>${board.bno }</td>
								<td><a href='/board/get?bno=${board.bno}'>${board.title }</a></td>
								<td>${board.writer }</td>
								<td><fmt:formatDate value="${board.regdate}"
										pattern="yyyy-MM-dd" /></td>
								<td><fmt:formatDate value="${board.updateDate}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- /.table-responsive -->
				<!-- The Modal -->
				<div class="modal" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">Modal Heading</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">처리가 완료되었습니다.</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Close</button>
							</div>

						</div>
					</div>
				</div>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>

<script>
	$(document).ready(function() {
		var result = '${result}'; // result 변수를 JSP EL을 사용하여 가져옵니다.

		checkModal(result);
	
		history.replaceState({}, null, null);


		function checkModal(result) {
			if (result === "" || history.state) {
				return;
			}
			if (parseInt(result) > 0) {
				$(".modal-body").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");				
			}else if(result === "modify"){
				$(".modal-body").html("게시글이 수정되었습니다")
			}else if(result === "delete"){
				$(".modal-body").html("게시글이 삭제되었습니다")
			}
				$("#myModal").modal("show");
		}

		// register 호출
		$("#regBtn").on("click", function() {
			self.location = "/board/register";
		});
	});
</script>

</div>
<%@include file="../includes/footer.jsp"%>
