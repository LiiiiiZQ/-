<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="utf-8">
<head>

<style type="text/css">
#top {
	postion: absolute;
	z-index: 999;
}

* {
	margin: 0px;
	padding: 0px;
}

#nav {
	
}

#nav ul {
	list-style: none;
}

#nav ul li {
	float: left;
	line-height: 40px;
	text-align: center;
	position: relative;
}

#nav ul li ul {
	position: absolute;
	display: none;
}

#nav ul li:hover ul {
	display: block
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">
<title>IT在线学习平台</title>

<link href="res/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="res/css/reset.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="res/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="res/js/bootstrap.min.js"></script>

<!--[if lt IE 9]>
		  <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->

<link rel="icon" type="image/png" href="res/i/ico.png" sizes="16x16">
<script type="text/javascript">
		CONETXT_PATH = '';
		</script>
<script type="text/javascript">
	//
	function ques()
	{
		var form=document.forms['question'];
		form.action="${pageContext.request.contextPath}/next";
		form.submit();
	}
    function validate()
    {
    var psw=document.getElementById("psw").value;
    var opsw=document.getElementById("opsw").value;
    var mima1=document.getElementById("npsw").value;
    var mima2=document.getElementById("npsw2").value;
    if(mima1==""||opsw==""||mima2==""){
    alert("密码不能为空");
    document.getElementById("opsw").focus();
    return false;
    }
    else if(opsw!=psw)
    {
    	alert("原始密码错误");
        document.getElementById("opsw").focus();
        return false;            
    }
    else if(mima1!=mima2)
    {
    alert("请确认密码一致");
    document.getElementById("npsw").focus();
    return false;
    }
    else
    {
    alert("修改密码成功");
    return true;
    }
    }                        //check password infomation--YC
    
    
    
    $("#btn1").click(function(){
		$("#btn1").toggle();
	});
    </script>


<!-- 提问格式 -->
<style type="text/css">
#qus,qus1{
width:60%;
height:60%;
margin:0;
margin-left:auto;
margin-top:auto;
font-size: 18px;
word-break:break-all;
}
</style>
</head>
<body>
	<%
		String id = session.getAttribute("Id").toString();
	%>
	<%
		String name =session.getAttribute("name").toString();
	%>
	<%
		String email =session.getAttribute("email").toString();
	%>
	<%
		String tel =session.getAttribute("tel").toString();
	%>
	<%
		String sex =session.getAttribute("sex").toString();
	%>
	<%
		String des =session.getAttribute("des").toString();
	%>
	<%
		String psw =session.getAttribute("psw").toString();
	%>
	<!-- 头部-start -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		style="position: fixed; top: 30%;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="font-size: 18px;">×</span>
					</button>
					<h4 class="modal-title" id="loginTitle"
						style="float: left; color: #337Ab7; cursor: pointer;"
						onclick="login();">个人信息</h4>
					<h4 class="modal-title" id="registeTitle"
						style="float: left; margin-left: 20px; cursor: pointer;"
						onclick="registe();">修改密码</h4>
					<div class="clearfix"></div>
				</div>
				<!-- modify information -->
				>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/ModifyInfo"
						method="post" id="loginForm" class="form-horizontal"
						style="padding: 0px 20px;">
						<div class="form-group">
							account:<%=id%><input type="hidden" name="id" value=<%=id%>>
						</div>
						<div class="form-group">
							name:<input name="name" type="text" class="form-control"
								id="username" value=<%=name%>>
						</div>
						<div class="form-group help">
							sex：
							<h4>
								<select id="sex" name="sex">
									<option id="male" value="male">male</option>
									<option id="female" value="female">female</option>
								</select>
							</h4>
						</div>
						<div class="form-group">
							tel:<input name="tel" type="text" class="form-control"
								id="username" placeholder="tel" value=<%=tel%>>
						</div>
						<div class="form-group help">
							email:<input name="email" type="text" class="form-control"
								id="password" placeholder="email" value=<%=email%>>
						</div>
						<div class="form-group help">
							person description:<input name="des" type="text"
								class="form-control" id="password" placeholder="des"
								value=<%=des%>>
						</div>



						<a href="javascript:void(0)"> <input type="submit" value="保存" />
						</a>
					</form>
					<!-- modify password -->
					<form action="${pageContext.request.contextPath}/ModifyPsw"
						method="post" onSubmit="return validate()" id="registeForm"
						class="form-horizontal" style="padding: 0px 20px; display: none;">
						<input type="hidden" name="methodName" value="0" /> <input
							type="hidden" name="id" value=<%=id%>> <input
							type="hidden" name="psw" id="psw" value=<%=psw%>> <input
							type="hidden" name="name" value=<%=name%>> <input
							type="hidden" name="sex" id="sex1" value=<%=sex%>> <input
							type="hidden" name="tel" value=<%=tel%>> <input
							type="hidden" name="email" value=<%=email%>> <input
							type="hidden" name="des" value=<%=des%>>
						<h4>
							原始密码:<input type="password" name="opsw" id="opsw"></input><br>
						</h4>
						<h4>
							新密码：<input type="password" name="npsw" id="npsw"></input><br>
						</h4>
						<h4>
							确认新密码：<input type="password" name="npsw2" id="npsw2"></input><br>
						</h4>

						<input type="submit" value="提交" />

					</form>

				</div>

			</div>
		</div>
	</div>
	<div class="f-header" id="top">
		<div class="f-header-box clearfix">
			<a class="logo" title="IT在线学习平台"></a>
			<nav class="header-nav">
				<a href="teacher.jsp" class="header-nav-item">首 页</a> <a
					href="list.jsp" class="header-nav-item">我的课堂</a>
			</nav>
			<nav class="header-nav" style="float: right">

				<div id="nav">
					<ul>
						<li><a href="#">Welcome,<%=name%>
						</a>
							<ul>
								<li><a href="#myModal" data-toggle="modal"
									onclick="login();">我的信息</a></li>

							</ul>
						<li><a href="index.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退出</a></li>
					</ul>
				</div>
			</nav>


		</div>
	</div>
	<script type="text/javascript">
var passValue=function(){
	document.getElementById("file").value=document.getElementById("sF").value;
}
</script>

<% String courseId=request.getParameter("courseId");
	session.setAttribute("cid", courseId);%>
<form action="FileUpload" method="get">	
<div>
</div>
	<div class="qustion" id="qus">
		<b>标题:</b><br> <input name="title" type="text" style="border-radius:3px;"/>
		<input type="hidden" name="sFile" id="file"><br>
	        <b>请选择文件:</b><br>
	        <input type="file" name="sourseFile" id="sF">
	
		<p><b>内容简介:</b></p>
		<textarea name="explain" style="width:336px ;height:159px;border-radius:3px"></textarea><br>
		
		<input type="submit" value="上传" onclick="passValue()" style="border-radius:3px;width:70px;"/>
	<a href="list.jsp">返回</a>
	</div>
	
</form>

	<script type="text/javascript">
		
			function login(){
				$('#loginTitle').css('color','#337Ab7');
				$('#loginForm').show();
				$('#registeTitle').css('color','#000');
				$('#registeForm').hide();
				var sex=document.getElementById("sex1").value;
				if(sex=="female")
					{
					document.getElementById("female").selected=true;
		}
				
			}
			function registe(){
				$('#loginTitle').css('color','#000');
				$('#loginForm').hide();
				$('#registeTitle').css('color','#337Ab7');
				$('#registeForm').show();
			}
			$(function(){
				$("#userdetail").popover({
		            trigger:'manual',
		            placement : 'bottom',
		            html: 'true',
		            content : '<div style="width:300px;height:300px;"></div>',
		            animation: false
		        }).on("mouseenter", function () {
		            var _this = this;
		            $(this).popover("show");
		            $(this).siblings(".popover").on("mouseleave", function () {
		                $(_this).popover('hide');
		            });
		        }).on("mouseleave", function () {
		            var _this = this;
		            setTimeout(function () {
		                if (!$(".popover:hover").length) {
		                    $(_this).popover("hide")
		                }
		            }, 0);
		        });
				//课程分类展示 
				$(".category").popover({
		            trigger:'manual',
		            placement : 'right',
		            html: 'true',
		            content : '',
		            animation: false
		        }).on("mouseenter", function () {
		            var cid = $(this).attr('c-id');
		            $('#' + cid).show();
		            $('#' + cid).hover(function(){
		            	$('#' + cid).show();
		            },function(){
		            	$('#' + cid).hide();
					});
		        }).on("mouseleave", function () {
		            var cid = $(this).attr('c-id');
		            $('#' + cid).hide();
		        });
			});
		</script>

</body>
</html>



















