<html>
	<head>
		<title>FAQ</title>
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="card-title">
							<h1>Welcome</h1>
						</div>
						<button type="button" class="btn btn-success" id="find-all-faq" name="find-all-faq">Find All Faq</button>
						<br>
						<input type="text" id="status" name="status" class="form-control">
						<button type="button" class="btn btn-success" id="find-by-status" name="find-by-status">Find By Status</button>
						<div class="row">
							<div class="col-lg-12">
								<table class="table table-responsive" id="tbl-data">
									<thead>
										<tr>
											<th>Question</th>
											<th>Answer</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>	
						<div class="row">
							<div class="col-lg-12">
								<form action="faq" method="post">
									<div class="row">	
										<div class="col-lg-3">	
											<div class="form-group">
												<label>Question</label>
												<input type="text" id="question" name="question" required>
											</div>
										</div>
										<div class="col-lg-3">	
											<div class="form-group">
												<label>Answer</label>
												<input type="text" id="answer" name="answer" required>
											</div>
										</div>
										<div class="col-lg-3">
											<button type="submit" class="btn btn-block btn-info">Create</button>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<form>
									<div class="row">
										<div class="col-lg-2">
											<div class="form-group">
												<label>ID</label>
												<input type="text" id="id" name="id" required>
											</div>
										</div>
										<div class="col-lg-2">
											<div class="form-group">
												<label>Question</label>
												<input type="text" id="question" name="question">
											</div>
										</div>
										<div class="col-lg-2">
											<div class="form-group">
												<label>Answer</label>
												<input type="text" id="answer" name="answer">
											</div>
										</div>
										<div class="col-lg-2">
											<div class="form-group">
												<label>Status</label>
												<input type="text" id="status" name="status">
											</div>
										</div>
										<div class="col-lg-4">
											<button type="button" class="btn btn-block btn-info" id="update" name="update">Update</button>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-8">
								<form>
									<div class="row">
										<div class="col-lg-4">
											<div class="form-group">
												<label>ID</label>
												<input type="text" id="id" name="id" required>
											</div>
										</div>
										<div class="col-lg-4">
											<button type="button" class="btn btn-block btn-info" id="delete" name="delete">Delete</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>		
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
		<script>
		$(document).ready(function(){
			$('#find-all-faq').on('click',function(){
				$.ajax({
					dataType: 'json',
					type: 'GET',
					url: 'faq/find-all-faq',
					success: function(resultData) {
						console.log('Inside success');
						console.log(resultData);
						var html="";
						$.each(resultData,function(k,v){
							html += '<tr>' +
								    '	<td>' + v.question + '</td>'+
								    '	<td>' + v.answer + '</td>'+
								    '	<td>' + v.status + '</td>'+
								    '</tr>';
						});
						$('#tbl-data tbody').html(html);						
					},
					error:function(resultData){
						console.log('Inside error');
						console.log(resultData);
					}
				});
			});
			$('#find-by-status').on('click',function(){
				var status = $('#status').val();
				$.ajax({
					dataType: 'json',
					type: 'GET',
					url: 'faq/status/' + status,
					success: function(resultData) {
						console.log('Inside success');
						console.log(resultData);
						var html="";
						$.each(resultData,function(k,v){
							html += '<tr>' +
								    '	<td>' + v.question + '</td>'+
								    '	<td>' + v.answer + '</td>'+
								    '	<td>' + v.status + '</td>'+
								    '</tr>';
						});
						$('#tbl-data tbody').html(html);							
					},
					error:function(resultData){
						console.log('Inside error');
						console.log(resultData);
					}
				});
			});
			$('#update').on('click',function(){
				var id = $('#id').val();
				var question = $('#question').val();
				var answer = $('#answer').val();
				var status = $('#status').val();
				$.ajax({
					dataType: 'json',
					type: 'PATCH',
					url: 'faq?id='+id+'&question='+question+'&answer='+answer+'&status='+status,
					success: function(resultData) {
						console.log('Inside success of update');
						console.log(resultData);							
					},
					error:function(resultData){
						console.log('Inside error of update');
						console.log(resultData);
					}
				});
			});
			$('#delete').on('click',function(){
				var id = $('#id').val();
				$.ajax({
					dataType: 'json',
					type: 'DELETE',
					url: 'faq?id='+id,
					success: function(resultData) {
						console.log('Inside success of update');
						console.log(resultData);							
					},
					error:function(resultData){
						console.log('Inside error of update');
						console.log(resultData);
					}
				});
			});
		});
		</script>
	</body>
</html>