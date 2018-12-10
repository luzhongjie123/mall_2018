<%--
  Created by IntelliJ IDEA.
  User: 卢中杰
  Date: 2018/12/6
  Time: 23:00
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
    var check_id;
    $(function () {
        $.getJSON("js/json/class_1.js", function (data) {
            $.each(data, function (i, n) {
                $("#class_1_select").append("<option value=" + n.id + ">" + n.flmch1 + "</option>");
            })
        });

        //点击复选框弹出答应的属性
        $("#product_attr").on("click","#checkbox",function () {
            var checkbox_id=$(this).val();
            var checkbox_checked=$(this).is(':checked');
            if(checkbox_checked){
                $("#val_"+checkbox_id).show();
            }else{
                $("#val_"+checkbox_id).hide();
            }


        })

    });

    function get_class_2(class_1_id) {
        $("#class_2_select").append("<option value=''>请选择</option>");
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
            $("#tm_select").append("<option value=''>请选择商品</option>");
            $.each(data, function (i, n) {
                $("#tm_select").append("<option value=" + n.id + ">" + n.ppmch + "</option>");
            })
        });

        $.post("get_attr_list_ajax.do",{flbh2:class_2_id},function (result) {
            $("#product_attr").empty();
            var check_attr;
            var radio_attr;
            var div_attr;

            $.each(result,function (i,f) {
                    check_attr="<lable><input type='checkbox' name='list_attr["+i+"].shxm_id' id='checkbox' value='"+f.id+"' style='margin-left: 20px'>"+f.shxm_mch+"</lable>";
                $("#product_attr").append(check_attr);

            })
            $("#product_attr").append("<br>");
            $.each(result,function (i,f) {
                radio_attr="";
                    $.each(f.list_value,function (e,n) {
                        radio_attr+="<lable><input type='radio' name='list_attr["+i+"].shxzh_id' value='"+n.id+"' style='margin-left: 20px'>"+n.shxzh+n.shxzh_mch+"</lable>";

                    });
                    radio_attr+="<br>";
                    $("<div id='val_"+f.id+"'style='display: none'></div>").append(radio_attr).appendTo("#product_attr");
            })

        })
    }

    function get_spu(pp_id) {

        var flbh2=$("#class_2_select").val();
        $.post("get_spu.do", {pp_id:pp_id,flbh2:flbh2}, function (result) {
            $("#spu_select").empty();
            $.each(result,function (i,n) {
                $("#spu_select").append("<option value="+n.id+">"+n.shp_mch+"</option>")

            })
        })
    }



</script>
<body>
<form method="post" action="save_sku.do">
一级:<select name="flbh1"  class="form-control" id="class_1_select" onchange="get_class_2(this.value)" style="max-width: 150px;display: inline">
    <option value="">请选择</option>
</select>
二级<select name="flbh2" class="form-control" id="class_2_select" onchange="get_class_3(this.value);"style="max-width: 150px;display: inline">
    <option value="">请选择</option>
</select>
品牌<select name="pp_id" class="form-control" id="tm_select" onchange="get_spu(this.value)" style="max-width: 150px;display: inline">
    <option value="">请选择商品</option>
</select>
商品<select name="shp_id" class="form-control" id="spu_select" style="max-width: 150px;display: inline">
    <option value="请选择商品"></option>
</select>

<br>
分类属性:

<div  id="product_attr">
    <%--<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 1--%>
    <%--<input type="checkbox">sad--%>
</div>


<br>
<div class="form-group">
    <label for="exampleInputPassword1">商品库存名称:</label>
    <input type="test" name="sku_mch" class="form-control" id="exampleInputPassword1" placeholder="商品库存名称">

</div>

<div class="form-group">
    <label for="exampleInputPassword2">商品库存数量</label>
    <input type="test" name="kc" class="form-control" id="exampleInputPassword2" placeholder="商品库存数量">
</div>

<div class="form-group">
    <label for="exampleInputPassword3">商品库存价格</label>
    <input type="test" name="jg" class="form-control" id="exampleInputPassword3" placeholder="商品库存价格">
</div>

<div class="form-group">
    <label for="exampleInputPassword4">商品库存地址</label>
    <input type="test" name="kcdz" class="form-control" id="exampleInputPassword4" placeholder="商品库存地址">
</div>

<button type="submit" class="btn btn-primary">添加</button>
</form>
</body>
</html>
