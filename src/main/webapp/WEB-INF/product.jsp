<%--
  Created by IntelliJ IDEA.
  User: 卢中杰
  Date: 2018/12/5
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script TYPE="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.css"/>--%>
<%--<script TYPE="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contentLength}/bootstrap-3.3.7-dist/js/bootstrap.js"></script>--%>

<body>

<div STYLE="text-align: right;margin-right: 100px"><button type="button" class="btn btn-info" id="productAddbtn">添加</button></div>

<table class="table">
    <tr>
        <th>#</th>
        <td>商品名称</td>
        <td>商品图片</td>
        <td>视频描述</td>
        <td>操作</td>
    </tr>


    <c:forEach items="${products}" var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.shp_mch}</td>
            <td><img src="../upload/image/${product.shp_tp}" style="max-width: 50px;max-height: 50px"/></td>
            <td>${product.shp_msh}</td>
            <td><button type="button" class="btn btn-danger">删除</button></td>
        </tr>
    </c:forEach>

</table>

<!-- Modal -->
<div class="modal fade" id="product_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content"style="width: 1000px;margin-left: -250px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
               <!--添加商品-->
                <form class="" style="line-height: 3em;" method="post" action="product_add.do" enctype="multipart/form-data" >
                    一级:<select name="flbh1"  class="form-control" id="class_1_select" onchange="get_class_2(this.value)" style="max-width: 150px;display: inline">
                    <option value="">请选择</option>
                </select>
                    二级<select name="flbh2" class="form-control" id="class_2_select" onchange="get_class_3(this.value);"style="max-width: 150px;display: inline">
                    <option value="">请选择</option>
                </select>
                    商品<select name="pp_id" class="form-control" id="tm_select"style="max-width: 150px;display: inline">
                    <option value="">请选择商品</option>
                </select>
                    <br/>
                    <label for="exampleInputEmail1">商品添加</label>
                    <input type="test" name="shp_mch" class="form-control" id="exampleInputEmail1" placeholder="商品">
                    <%--商品描述:<textarea name="shp_msh" cols="50" rows="10"></textarea><br>--%>
                    商品描述:<textarea name="shp_msh" class="form-control" rows="5" style="max-width: 300px"></textarea>
                    商品图片:<br>
                    <div id="d_0" style="float: left;margin-left: 10px;border: 1px red solid">
                        <input id="file_0" type="file" name="files" style="display: none" onchange="replace_image(0)"/>
                        <img id="image_0" onclick="click_image(0)" src="../image/upload_hover.png" style="cursor:pointerwidth: 100px;height: 100px">
                    </div>
                    <input type="submit" value="提交">
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

<script>

    $(function () {
        $("#productAddbtn").click(function () {
            $("#product_add").modal({
                backdrop:"static"
            });
        })
    });

    $(function () {
        $.getJSON("js/json/class_1.js", function (data) {
            $.each(data, function (i, n) {
                $("#class_1_select").append("<option value=" + n.id + ">" + n.flmch1 + "</option>");
            })
        })
    });

    function get_class_2(class_1_id) {
        $.getJSON("js/json/class_2_" + class_1_id + ".js", function (data) {
            $("#class_2_select").empty();
            $.each(data, function (i, n) {
                $("#class_2_select").append("<option value=" + n.id + ">" + n.flmch2 + "</option>");

            })
            // get_class_3(class_1_id);
        })

    }

    function get_class_3(class_2_id) {
        $("#tm_select").empty();
        $.getJSON("js/json/tm_class_1_" + class_2_id + ".js", function (data) {
            $.each(data, function (i, n) {
                $("#tm_select").append("<option value=" + n.id + ">" + n.ppmch + "</option>");
            })
        })
    }


    function click_image(index) {
        $("#file_" + index).click();
    }

    function replace_image(index) {
        //获得图片选择框长度
        var length = $(":file").length;
        if (length > 3) {
            alert("图片够多啦(...)");
            return false;
        }
        if ((index + 1) == length) {
            add_image(index);
        }

        //获得图片对象
        var blob_image = $("#file_" + index)[0].files[0];
        var url = window.URL.createObjectURL(blob_image);
        //替换image
        $("#image_" + index).attr("src", url);


    }

    function add_image(index) {
        var a = '<div id="d_' + (index + 1) + '" style="float: left;margin-left: 10px;border: 1px red solid">';
        var b = '<input id="file_' + (index + 1) + '"  type="file" name="files" style="display: none" onchange="replace_image(' + (index + 1) + ')"/>';
        var c = '<img id="image_' + (index + 1) + '" onclick="click_image(' + (+index + 1) + ')" src="../image/upload_hover.png" style="cursor:pointer;width: 100px;height: 100px">';
        var d = '</div>';
        $("#d_" + index).after(a + b + c + d);
    }


</script>
</html>
