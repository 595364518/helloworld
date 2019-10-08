<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"/>
    <script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			
		})
	</script>
</head>
<body>
	<form name="codeForm" action="${pageContext.request.contextPath }/regist" method="post">
		<div class="form-group">验证码：</div>
        	<input type="text" name="checkCode" class="form-control" id="checkCode" />
        	<input type="button" class="btn btn-primary" id="btn" value="验证" />
    	</p>
	</form>
</body>
</html>