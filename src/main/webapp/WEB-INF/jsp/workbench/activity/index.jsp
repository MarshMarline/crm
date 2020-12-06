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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css"
          rel="stylesheet"/>

    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" ></script>
    <script type="text/javascript"
            src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
    <link rel="stylesheet" type="text/css" href="jquery/bs_pagination/jquery.bs_pagination.min.css">
    <script type="text/javascript" src="jquery/bs_pagination/jquery.bs_pagination.min.js"></script>
    <script type="text/javascript" src="jquery/bs_pagination/en.js"></script>

    <script type="text/javascript">

        $(function () {

            pageList(1,5);

            $(".time").datetimepicker({
                minView: "month",
                language:  'zh-CN',
                format: 'yyyy-mm-dd',
                autoclose: true,
                todayBtn: true,
                pickerPosition: "bottom-left"
            });

            /*
                操作模态窗口的方式：
                需要操作的模态窗口的jquery对象，调用modal方法，为该方法传递参数 show:打开模态窗口   hide：关闭模态窗口
            */

            //打开修改模态窗口，发送ajax请求获取修改前信息并铺进文本框
            $("#editbtn").click(function () {
                $.ajax({
                    type:'post',
                    url:"workbench/activity/edit.do",
                    data:{
                        "id":$("input[name=xz]:checked").val()
                    },
                    success:function (res) {
                        $("#edit-marketActivityOwner").empty();
                        $.each(res.users, function (i, n){
                            $("#edit-marketActivityOwner").append($("<option value="+n.id+"></option>").append(n.name));
                        });
                        $("#edit-marketActivityOwner").val(res.activity.owner);
                        $("#edit-marketActivityName").val(res.activity.name);
                        $("#edit-startTime").val(res.activity.startDate);
                        $("#edit-endTime").val(res.activity.endDate);
                        $("#edit-cost").val(res.activity.cost);
                        $("#edit-describe").val(res.activity.description);
                    },
                    error:errorfun()
                });
            });

            $("#getListbtn").click(function (){
                //点击查询按钮的时候，我们应该将搜索框中的信息保存起来,保存到隐藏域中
                $("#hidden-name").val($.trim($("#search-name").val()));
                $("#hidden-owner").val($.trim($("#search-owner").val()));
                $("#hidden-startDate").val($.trim($("#search-startDate").val()));
                $("#hidden-endDate").val($.trim($("#search-endDate").val()));
                pageList(1,5);
            });

            //删除Activity
            $("#deletebtn").click(
                function () {
                    var ok = confirm("您确认要删除选中的"+$("input[name=xz]:checked").length+"条记录？");
                    if(!ok){return;};
                    var $xz = $("input[name=xz]:checked");
                    var ids = "id="+$xz[0].value;
                    for(var i = 1; i < $xz.length; i ++){
                        ids += "&id="+$xz[i].value;
                    }
                    $.ajax({
                        type:'get',
                        url:"workbench/activity/delete.do",
                        data:ids,
                        success:function (res) {
                            if(res.flag){
                                alert("成功删除" + res.count + "条记录！");
                                //第二个参数表示用户选择的每页显示数
                                pageList(1,$("#activityPage").bs_pagination('getOption', 'rowsPerPage'));
                            }else{
                                alert(res.msg);
                            }
                        },
                        error:function () {
                            alert("删除失败！")
                        }
                    });
                }
            );

            //打开添加活动模态窗口，发送ajax请求获取用户信息放进所有者下拉列表
            $("#addbtn").click(function () {
                $("#createActivityModal").modal("show");
                $.ajax({
                    type:'get',
                    /*
                    //走后台，目的是为了取得用户信息列表，为所有者下拉框铺值
                    * 老师说这里其实只查用户姓名就可以了，
                    * 但是以后如果有扩充，就有可能用到用户的其他信息，所以为了保险，就查用户的所有信息
                    * */
                    url:"workbench/activity/getUsers.do",
                    success:function (res){
                        $("#create-marketActivityOwner").empty();
                        $.each(res, function (i, n){
                            $("#create-marketActivityOwner").append($("<option value="+n.id+"></option>").append(n.name));
                        });
                        $("#create-marketActivityOwner").val("${user.id}");
                    },
                    error:errorfun
                });

            });

            $("#updatebtn").click(function () {
                $.ajax({
                    type:'post',
                    url:"workbench/activity/updateActivity.do",
                    data:{
                        id:$("input:checkbox[name=xz]:checked").val(),
                        owner:$.trim($("#edit-marketActivityOwner").val()),
                        name:$.trim($("#edit-marketActivityName").val()),
                        startDate:$.trim($("#edit-startTime").val()),
                        endDate:$.trim($("#edit-endTime").val()),
                        cost:$.trim($("#edit-cost").val()),
                        description:$.trim($("#edit-describe").val()),
                        editBy:"${user.name}"
                    },
                    success:function(res){
                        if(res.flag){
                            alert("保存成功！");
                            /*
							注意：
								我们拿到了form表单的jquery对象
								对于表单的jquery对象，提供了submit()方法让我们提交表单
								但是表单的jquery对象，没有为我们提供reset()方法让我们重置表单（坑：idea为我们提示了有reset()方法）

								虽然jquery对象没有为我们提供reset方法，但是原生js为我们提供了reset方法
								所以我们要将jquery对象转换为原生dom对象

								jquery对象转换为dom对象：
									jquery对象[下标]

								dom对象转换为jquery对象：
									$(dom)
						    */
                            $("#addActivity")[0].reset();
                            //第一个参数表示停留在当前页，第二个参数表示用户选择的每页显示数
                            pageList($("#activityPage").bs_pagination('getOption', 'currentPage')
                                ,$("#activityPage").bs_pagination('getOption', 'rowsPerPage'));

                        }else{
                            alert("保存失败");
                        }
                    },

                    error:function () {
                        alert("error");
                    }
                })
            });

            //添加活动
            $("#save").click(function(){
                $.ajax({
                    type:'post',
                    url:"workbench/activity/saveActivity.do",
                    data:{
                        //以后要习惯用$.trim()删空格哦
                        //id:"",
                        owner:$.trim($("#create-marketActivityOwner").val()),
                        name:$.trim($("#create-marketActivityName").val()),
                        startDate:$.trim($("#create-startTime").val()),
                        endDate:$.trim($("#create-endTime").val()),
                        cost:$.trim($("#create-cost").val()),
                        description:$.trim($("#create-describe").val()),
                        //createTime:"",
                        //取得当前登录用户的id
                        //在js中使用el表达式，el表达式一定要套用在字符串中
                        createBy:"${user.name}"
                        //editTime:"",
                        //editBy:""
                    },
                    success:function(res){
                        if(res.flag){
                            alert("保存成功！");
                            /*
							注意：
								我们拿到了form表单的jquery对象
								对于表单的jquery对象，提供了submit()方法让我们提交表单
								但是表单的jquery对象，没有为我们提供reset()方法让我们重置表单（坑：idea为我们提示了有reset()方法）

								虽然jquery对象没有为我们提供reset方法，但是原生js为我们提供了reset方法
								所以我们要将jquery对象转换为原生dom对象

								jquery对象转换为dom对象：
									jquery对象[下标]

								dom对象转换为jquery对象：
									$(dom)
						    */
                            $("#addActivity")[0].reset();
                            //第二个参数表示保留的用户写入的每页显示数量
                            pageList(1,$("#activityPage").bs_pagination('getOption', 'rowsPerPage'));

                        }else{
                            alert("保存失败");
                        }
                    },

                    error:function () {
                      alert("error");
                    }
                })
            });

            //为全选框绑定全选事件
            $("#qx").change(function () {
                $(":checkbox[name=xz]").prop("checked",$("#qx").prop("checked"));
                $("#deletebtn").prop("disabled",!($(":checkbox[name=xz]:checked").length!=0));
            })


/*          这种写法是错误的，动态生成的元素不能以普通绑定事件的方式操作
            $(":checkbox[name=xz]").bind("change",function () {
            });
            动态生成的元素，我们要以on方法的形式来触发事件

            语法：
            $(需要绑定元素的有效的外层元素).on(绑定事件的方式,需要绑定的元素的jquery对象,回调函数)

            */

            //为动态生成的普通复选框绑定事件
            $("#activityList").on("change",$(":checkbox[name=xz]"),btnrefresh);

        });

        //刷新按钮
        function btnrefresh() {
            //复选框全选或全不选的时候和全选框统一
            $("#qx").prop("checked",$(":checkbox[name=xz]").length == $(":checkbox[name=xz]:checked").length);
            //当没有复选框被选中时设置删除按钮为disable
            $("#deletebtn").prop("disabled",!($(":checkbox[name=xz]:checked").length!=0));
            //当只有一个复选框被选中时修改按钮的disable改为false
            $("#editbtn").prop("disabled",!($(":checkbox[name=xz]:checked").length==1));
        }

        function pageList(pageNo,pageSize){
            //清空全选框
            //$("#qx").prop("checked",false);

            //查询前，将隐藏域中保存的信息取出来，重新赋予到搜索框中
            $("#search-name").val($("#hidden-name").val());
            $("#search-owner").val($("#hidden-owner").val());
            $("#search-startDate").val($("#hidden-startDate").val());
            $("#search-endDate").val($("#hidden-endDate").val());

            $.ajax({
                type:'get',
                url:"workbench/activity/pageList.do",
                data:{
                    "pageSize":pageSize,
                    "pageNo":pageNo,
                    "name":$.trim($("#search-name").val()),
                    "owner":$.trim($("#search-owner").val()),
                    "startDate":$.trim($("#search-startDate").val()),
                    "endDate":$.trim($("#search-endDate").val())
                },

                success:function(res){
                    var html = "";
                    $.each(res.dataList, function (i,act) {
                        html += '<tr class="active">';
                        html += '<td><input type="checkbox" name="xz" value='+act.id+' /></td>';
                        html += '<td><a style="text-decoration: none; cursor: pointer;"';
                        html += '<td><a onclick="window.location.href=\'workbench/activity/detail.do?id='+act.id+'\'">'+act.name+'</a></td>';
                        html += '<td>'+act.owner+'</td>';
                        html += '<td>'+act.startDate+'</td>';
                        html += '<td>'+act.endDate+'</td>';
                        html += '</tr>';
                    });

                    $("#activityList").html(html);

                    var totalPages = res.total%pageSize == 0 ? res.total/pageSize : parseInt(res.total/pageSize) +  1;

                    $("#activityPage").bs_pagination({
                        currentPage: pageNo, // 页码
                        rowsPerPage: pageSize, // 每页显示的记录条数
                        maxRowsPerPage: 20, // 每页最多显示的记录条数
                        totalPages: totalPages, // 总页数
                        totalRows: res.total, // 总记录条数

                        visiblePageLinks: 3, // 显示几个卡片

                        showGoToPage: true,
                        showRowsPerPage: true,
                        showRowsInfo: true,
                        showRowsDefaultInfo: true,

                        //该回调函数时在，点击分页组件的时候触发的
                        onChangePage : function(event, data){
                            pageList(data.currentPage , data.rowsPerPage);
                        }
                    });

                    //刷新复选框和删改按钮的状态
                    btnrefresh();

                },

                error:errorfun
            });
        }

        function errorfun(){
            /*
            :p
            */
        }

    </script>
</head>
<body>

<input type="hidden" id="hidden-name">
<input type="hidden" id="hidden-owner">
<input type="hidden" id="hidden-startDate">
<input type="hidden" id="hidden-endDate">

<!-- 创建市场活动的模态窗口 -->
<div class="modal fade" id="createActivityModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">创建市场活动</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" id="addActivity">

                    <div class="form-group">
                        <label for="create-marketActivityOwner" class="col-sm-2 control-label">所有者<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="create-marketActivityOwner">
                            </select>
                        </div>
                        <label for="create-marketActivityName" class="col-sm-2 control-label">名称<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-marketActivityName">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-startTime" class="col-sm-2 control-label">开始日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control time" id="create-startTime" readonly>
                        </div>
                        <label for="create-endTime" class="col-sm-2 control-label">结束日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control time" id="create-endTime" readonly>
                        </div>
                    </div>
                    <div class="form-group">

                        <label for="create-cost" class="col-sm-2 control-label">成本</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-cost">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="create-describe" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea class="form-control" rows="3" id="create-describe"></textarea>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <!--
						data-dismiss="modal"
							表示关闭模态窗口
				-->
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="save">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改市场活动的模态窗口 -->
<div class="modal fade" id="editActivityModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">修改市场活动</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form">

                    <div class="form-group">
                        <label for="edit-marketActivityOwner" class="col-sm-2 control-label">所有者<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="edit-marketActivityOwner">
                            </select>
                        </div>
                        <label for="edit-marketActivityName" class="col-sm-2 control-label">名称<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-marketActivityName" value="发传单">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="edit-startTime" class="col-sm-2 control-label">开始日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control time" id="edit-startTime" readonly/>
                        </div>
                        <label for="edit-endTime" class="col-sm-2 control-label">结束日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control time" id="edit-endTime" readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-cost" class="col-sm-2 control-label">成本</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-cost" value="5,000">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-describe" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <%--
                            关于文本域textarea：
                                （1）一定是要以标签对的形式来呈现,正常状态下标签对要紧紧的挨着
                                （2）textarea虽然是以标签对的形式来呈现的，但是它也是属于表单元素范畴
                                   我们所有的对于textarea的取值和赋值操作，应该统一使用val()方法（而不是html()方法）
                            --%>
                            <textarea class="form-control" rows="3" id="edit-describe"></textarea>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="updatebtn">更新</button>
            </div>
        </div>
    </div>
</div>


<div>
    <div style="position: relative; left: 10px; top: -10px;">
        <div class="page-header">
            <h3>市场活动列表</h3>
        </div>
    </div>
</div>
<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
    <div style="width: 100%; position: absolute;top: 5px; left: 10px;">

        <div class="btn-toolbar" role="toolbar" style="height: 80px;">
            <form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">名称</div>
                        <input class="form-control" type="text" id="search-name">
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">所有者</div>
                        <input class="form-control" type="text" id="search-owner">
                    </div>
                </div>


                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">开始日期</div>
                        <input class="form-control" type="text" id="search-startDate"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">结束日期</div>
                        <input class="form-control" type="text" id="search-endDate">
                    </div>
                </div>

                <button type="button" class="btn btn-default" id="getListbtn">查询</button>

            </form>
        </div>
        <div class="btn-toolbar" role="toolbar"
             style="background-color: #F7F7F7; height: 50px; position: relative;top: 5px;">
            <div class="btn-group" style="position: relative; top: 18%;">
                <!--
                    点击创建按钮，观察两个属性和属性值

                    data-toggle="modal"：
                        表示触发该按钮，将要打开一个模态窗口

                    data-target="#createActivityModal"：
                        表示要打开哪个模态窗口，通过#id的形式找到该窗口

                    现在我们是以属性和属性值的方式写在了button元素中，用来打开模态窗口
                    但是这样做是有问题的：
                        问题在于没有办法对按钮的功能进行扩充

                    所以未来的实际项目开发，对于触发模态窗口的操作，一定不要写死在元素当中，
                    应该由我们自己写js代码来操作

                 -->
                <button type="button" class="btn btn-primary" id="addbtn">
                    <span class="glyphicon glyphicon-plus"></span> 创建
                </button>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#editActivityModal" id="editbtn" disabled>
                    <span class="glyphicon glyphicon-pencil"></span> 修改
                </button>
                <button type="button" class="btn btn-danger" id="deletebtn" disabled="true"><span class="glyphicon glyphicon-minus"></span> 删除</button>
            </div>

        </div>
        <div style="position: relative;top: 10px;">
            <table class="table table-hover">
                <thead>
                <tr style="color: #B3B3B3;">
                    <td><input type="checkbox" id="qx"/></td>
                    <td>名称</td>
                    <td>所有者</td>
                    <td>开始日期</td>
                    <td>结束日期</td>
                </tr>
                </thead>
                <tbody id = "activityList">
<%--                <tr class="active">
                    <td><input type="checkbox"/></td>
                    <td><a style="text-decoration: none; cursor: pointer;"
                           onclick="window.location.href='uri.do?uri=activity/detail';">发传单</a></td>
                    <td>zhangsan</td>
                    <td>2020-10-10</td>
                    <td>2020-10-20</td>
                </tr>--%>
                </tbody>
            </table>
        </div>

        <div style="height: 50px; position: relative;top: 30px;" >
            <div id = "activityPage">

            </div>
        </div>

    </div>

</div>
</body>
</html>