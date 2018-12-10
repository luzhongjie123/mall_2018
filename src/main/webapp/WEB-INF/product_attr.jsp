<%--
  Created by IntelliJ IDEA.
  User: 卢中杰
  Date: 2018/12/6
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script TYPE="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    $(function () {
        //显示一级下拉框
        $.getJSON("js/json/class_1.js", function (data) {
            $.each(data, function (i, n) {
                $("#class_1_select").append("<option value=" + n.id + ">" + n.flmch1 + "</option>");
            })
        });
        //添加事件
        $("#attrAddBtn").click(function () {
            $("#attr_add").modal({
                backdrop:"static"
            });
        });

        $.getJSON("js/json/class_1.js", function (data) {
            $.each(data, function (i, n) {
                $("#attr_class_1_select").append("<option value=" + n.id + ">" + n.flmch1 + "</option>");
            })
        })
    });



    function get_class_2(class_1_id) {
        $.getJSON("js/json/class_2_" + class_1_id + ".js", function (data) {
            $("#class_2_select").empty();
            $.each(data, function (i, n) {
                $("#class_2_select").append("<option value=" + n.id + ">" + n.flmch2 + "</option>");

            })
        })
    }


        function get_attr_class_2(class_1_id) {
            $.getJSON("js/json/class_2_" + class_1_id + ".js", function (data) {
                $("#attr_class_2_select").empty();
                $.each(data, function (i, n) {
                    $("#attr_class_2_select").append("<option value=" + n.id + ">" + n.flmch2 + "</option>");
                })
            })
        }


        function get_attr_list(flbh2) {
            $.post("get_attr_list.do", {flbh2: flbh2}, function (result) {
                $("#attrListHtml").html(result);
            });

    }
</script>
<body>
一级:<select name="flbh1"  class="form-control" id="class_1_select" onchange="get_class_2(this.value)" style="max-width: 150px;display: inline">
    <option value="">请选择</option>
</select>
二级<select name="flbh2" class="form-control" id="class_2_select" onchange="get_attr_list(this.value)"style="max-width: 150px;display: inline">
    <option value="">请选择</option>
</select>
<div STYLE="text-align: right;margin-right: 100px"><button type="button" class="btn btn-info" id="attrAddBtn">添加</button></div>
<div id="attrListHtml"></div>


<!--点击添加打开模态框-->
<div class="modal fade" id="attr_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content"style="width: 1000px;margin-left: -250px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                <!--添加属性-->
                <form method="post"action="/attr_add.do">
                    一级<select name="attr_flbh1"  class="form-control" id="attr_class_1_select" onchange="get_attr_class_2(this.value)" style="max-width: 300px;display: inline">
                    <option value="">请选择</option>
                </select>
                    二级<select name="attr_flbh2" class="form-control" id="attr_class_2_select" style="max-width: 300px;display: inline">
                    <option value="">请选择</option>
                </select>

                    <table class="table table-hover">
                        <tr><td>属性名:<input type="text"name="list_attr[0].shxm_mch"></td><td></td><td>添加属性值</td></tr>
                        <tr><td>属性值:<input type="text"name="list_attr[0].list_value[0].shxzh"></td><td>单位:<input type="text" name="list_attr[0].list_value[0].shxzh_mch"></td><td>删除</td></tr>
                        <tr><td>属性值:<input type="text"name="list_attr[0].list_value[1].shxzh"></td><td>单位:<input type="text" name="list_attr[0].list_value[1].shxzh_mch"></td><td>删除</td></tr>
                    </table>

                    <button type="submit" class="btn btn-success"style="margin-left: 800px" >保存</button>

                    <!-- Modal -->

                </form>

                <!---->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>




</body>

</html>
