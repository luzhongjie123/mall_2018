<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018\11\23 0023
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
    $(function () {
        $.getJSON("js/json/class_1.js",function (data) {
            $.each(data,function (i,n) {
                $("#class_1_select").append("<option value="+n.id+">"+n.flmch1+"</option>");
            })
        })
    })
    
    function  get_class_2(class_1_id){

        $.getJSON("js/json/class_2_"+class_1_id+".js",function (data) {
            $("#class_2_select").empty();
            $.each(data,function (i,n) {
                $("#class_2_select").append("<option value="+n.id+">"+n.flmch2+"</option>");

            })
            get_class_3(class_1_id);
        })
    }

    function  get_class_3(class_2_id){
        $("#tm_select").empty();
        $.getJSON("js/json/tm_class_1_"+class_2_id+".js",function (data) {
            $.each(data,function (i,n) {
                $("#tm_select").append("<option value="+n.id+">"+n.ppmch+"</option>");
            })
        })
    }
    
    function goto_spu_add() {

        var class_1_id=$("#class_1_select").val();
        var class_2_id=$("#class_2_select").val();
        var tm_class_1_id=$("#tm_select").val();
        alert("132")
        window.location.href="goto_product_add.do?flbh1="+class_1_id+"&flbh2="+class_2_id+"&pp_id="+tm_class_1_id;
    }
</script>


<body>
一级:<select id="class_1_select" onchange="get_class_2(this.value);"><option>请选择</option></select><br/>
二级:<select id="class_2_select" onchange="get_class_3(this.value)"><option>请选择</option></select><br/>
商品:<select id="tm_select"><option>请选择</option></select><br/>

<a href="javascript:goto_spu_add()">提交</a>
</body>
</html>
