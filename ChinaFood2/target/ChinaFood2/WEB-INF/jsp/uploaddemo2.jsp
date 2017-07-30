<%--
  Created by IntelliJ IDEA.
  User: huyu
  Date: 2017/7/27
  Time: 0:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>多张图片上传测试</title>
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/imgup.css"/>
    <script src="/static/js/jQuery1.7.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/imgUp.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/ajaxfileupload.js" type="text/javascript" charset="utf-8"></script>
    <script>
       /* function  ajaxuoload() {
            $.ajaxFileUpload({
                url:"/uploadtest",
                secureuri:false,
                fileElementId:"file",
                dataType:"text",
                success:function (data) {
                    console.log(data);
                   $("#url").append(data);
                }
            });
            return false;
        }*/
       /*点击input的框就开始上传*/
     /*  $(document).ready(function () {
           $(".file").change(function () {
               $.ajaxFileUpload({
                   url: "/uploadtest",
                   type: "post",
                   secureuri: false,
                   fileElementId: "file",
                   dataType: "text",
                   success: function (data) {
                       console.log(data);
                       $("#url").append(data);
                   }
               });
           });
       });*/
    </script>
</head>
<body>
<%--<form action="/uploadtest" method="post" class="formupload" enctype="multipart/form-data" onsubmit="return ajaxuoload();">
    <input type="file" id="file" name="file" multiple="multiple" accept="image/gif, image/jpeg, image/png, image/jpg, image/bmp" />
    <input type="submit" value="提交">
</form>--%>
<span id="url"></span>

    <div class="container mt40">
        <div class="img-box full">
            <section class=" img-section">
                <p class="up-p">作品图片：<span class="up-span">最多可以上传5张图片，马上上传</span></p>
                <div class="z_photo upimg-div clear" >
                    <section class="z_file fl">
                        <img src="/static/img/a11.png" class="add-img">
                        <input type="file" name="file" id="file" class="file" accept="image/jpg,image/jpeg,image/png,image/bmp" multiple />
                    </section>
                </div>
            </section>
        </div>
        <aside class="mask works-mask">
            <div class="mask-content">
                <p class="del-p ">您确定要删除作品图片吗？</p>
                <p class="check-p"><span class="del-com wsdel-ok">确定</span><span class="wsdel-no">取消</span></p>
            </div>
        </aside>
    </div>

</body>
</html>

