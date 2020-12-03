<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>"/>
    <link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
    <script>

        $(function(){

            //页面加载完毕后如果当前不是顶层窗口，把当前窗口变为顶层窗口
            if(window.top!=window){
                window.top.location = window.location;
            }

            //页面加载完毕后清空输入框内容
            $("#loginAct").val("");
            $("#loginPwd").val("");
            //页面加载完毕后，让用户的文本框自动获得焦点
            $("#loginAct").focus();
            onkeydown = function (event) {
                if(event.keyCode == 13){
                    login();
                }
            }
        })

        function login() {

            var loginAct = $.trim($("#loginAct").val());
            var loginPwd = $.trim($("#loginPwd").val());

            if(loginAct == '' || loginPwd == ''){
                $("#msg").text("用户名或密码不能为空！");
                return;
            }
            $.ajax({
                type:'post',
                url:'settings/user/login.do',
                data:{
                    "loginAct":loginAct,
                    "loginPwd":loginPwd
                },
                success:callback,
                error:errorfun,
                dataType:'json'
            });
        }

        /*
        * {
        *   "success":flag,
        *   "msg":"错误信息"
        * }
        * */
        function callback(res) {
            if(res.success == true){
                /*jsp中不能直接定位到webinf下的文件，所以通过controller帮忙再次发起请求
                * 我查了很久，但是没有查到更好的解决方法*/
                window.location.href = "uri.do?uri=index";
            }else{
                $("#msg").text(res.msg);
            }
        }
        
        function errorfun() {
            $("#msg").text("error");
        }

    </script>
</head>
<body>
<div style="position: absolute; top: 0px; left: 0px; width: 60%;">
    <img src="image/IMG_7114.JPG" style="width: 100%; height: 90%; position: relative; top: 50px;">
</div>
<div id="top" style="height: 50px; background-color: #3C3C3C; width: 100%;">
    <div style="position: absolute; top: 5px; left: 0px; font-size: 30px; font-weight: 400; color: white; font-family: 'times new roman'">CRM &nbsp;<span style="font-size: 12px;">&copy;2020&nbsp;动力节点</span></div>
</div>

    <div style="position: absolute; top: 120px; right: 100px;width:450px;height:400px;border:1px solid #D5D5D5">
        <div style="position: absolute; top: 0px; right: 60px;">
            <div class="page-header">
                <h1>登录</h1>
            </div>
            <form action="login.do" class="form-horizontal" role="form" method="post">
                <div class="form-group form-group-lg">
                    <div style="width: 350px;">
                        <input class="form-control" type="text" id="loginAct" placeholder="用户名">
                    </div>
                    <div style="width: 350px; position: relative;top: 20px;">
                        <input class="form-control" type="password" id="loginPwd" placeholder="密码">
                    </div>
                    <div class="checkbox"  style="position: relative;top: 30px; left: 10px;">

                        <span id="msg" style="color: #d9534f"></span>

                    </div>
                    <button type="button" class="btn btn-primary btn-lg btn-block"  onclick="login()" style="width: 350px; position: relative;top: 45px;">登录</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
