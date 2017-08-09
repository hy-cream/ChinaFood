//处理图片数量
var imgArr = [];//上传文件的路径集合
$(function(){
	var delParent;

    var defaults = {
		fileType         : ["jpg","png","bmp","jpeg"],   // 上传文件的类型
		fileSize         : 1024 * 1024 * 10                  // 上传文件的大小 10M
	};
		/*点击图片的文本框*/
	$(".file").change(function(){	 
		var idFile = $(this).attr("id");
		var file = document.getElementById(idFile);
		var imgContainer = $(this).parents(".z_photo"); //存放图片的父亲元素
		var fileList= file.files; //获取的图片文件
		console.log("filelist------------=",fileList);
		var input = $(this).parent();//文本框的父亲元素

		//遍历得到的图片文件
		var numUp = imgContainer.find(".up-section").length;
		var totalNum = numUp + fileList.length;  //总的数量
		if(fileList.length > 5 || totalNum > 5 ){
			alert("上传图片数目不可以超过5个，请重新选择");  //一次选择上传超过5个 或者是已经上传和这次上传的到的总数也不可以超过5个
		}
		else if(numUp < 5){
			/*验证文件规范*/
			fileList = validateUp(fileList);
			for(var i = 0;i<fileList.length;i++){
			 var imgUrl = window.URL.createObjectURL(fileList[i]);
			 console.log("imaurl------",imgUrl);
			     imgArr.push(imgUrl);
			 var $section = $("<section class='up-section fl loading'>");
			     imgContainer.prepend($section);
			 var $span = $("<span class='up-span'>");
			     $span.appendTo($section);
			
		     var $img0 = $("<img class='close-upimg'>").on("click",function(event){
				    event.preventDefault();
					event.stopPropagation();
					$(".works-mask").show();
					delParent = $(this).parent();
				});   
				$img0.attr("src","img/a7.png").appendTo($section);
		     var $img = $("<img class='up-img up-opcity'>");
		         $img.attr("src",imgArr[i]);
		         $img.appendTo($section);
		     var $p = $("<p class='img-name-p'>");
		         $p.html(fileList[i].name).appendTo($section);
		     var $input = $("<input id='taglocation' name='taglocation' value='' type='hidden'>");
		         $input.appendTo($section);
		     var $input2 = $("<input id='tags' name='tags' value='' type='hidden'/>");
		         $input2.appendTo($section);
		      
		   }

		}
		setTimeout(function(){
             $(".up-section").removeClass("loading");
		 	 $(".up-img").removeClass("up-opcity");
		 },450);
		 numUp = imgContainer.find(".up-section").length;
		if(numUp >= 5){
			$(this).parent().hide();
		}
	});
	
	
   
    $(".z_photo").delegate(".close-upimg","click",function(){
     	  $(".works-mask").show();
     	  delParent = $(this).parent();
	});
		
	$(".wsdel-ok").click(function(){
		$(".works-mask").hide();
		var numUp = delParent.siblings().length;
		if(numUp < 6){
			delParent.parent().find(".z_file").show();
		}
		 delParent.remove();
	});
	
	$(".wsdel-no").click(function(){
		$(".works-mask").hide();
	});
		
		function validateUp(files){
			var arrFiles = [];//替换的文件数组
			for(var i = 0, file; file = files[i]; i++){
				//获取文件上传的后缀名
				var newStr = file.name.split("").reverse().join("");
				if(newStr.split(".")[0] != null){
						var type = newStr.split(".")[0].split("").reverse().join("");
						console.log(type+"===type===");
						if(jQuery.inArray(type, defaults.fileType) > -1){
							// 类型符合，可以上传
							if (file.size >= defaults.fileSize) {
								alert(file.size);
								alert('您这个"'+ file.name +'"文件大小过大');	
							} else {
								// 在这里需要判断当前所有文件中
								arrFiles.push(file);
							}
						}else{
							alert('您这个"'+ file.name +'"上传类型不符合');	
						}
					}else{
						alert('您这个"'+ file.name +'"没有类型, 无法识别');	
					}
			}
			return arrFiles;
		}
})

/*-----------------发布食物的验证------------------*/

/*菜系类别的选择-*/
$(document).ready(function() {
    //给select里面的第一个option设置为选中状态
	$(".selectCate").prop('selectIndex',0);
	/*var selectFisrt=$("#selectdiv").children("select");
	console.log(selectFisrt);
  	selectFisrt.each(function (index,select) {
		$("select").prop('selectedIndex', 0);
    });
	//测试获得所有选中的option
    var selects=$("select option:selected");
    console.log(selects);*/
	//给input多选框中设置默认选择第一个
	var checkboxs=$(".selectAll").children("div");
	console.log(checkboxs);
	checkboxs.each(function (index,checkbox) {
        $(this).children("input:checkbox").prop('checked',false);
		$(this).children("input:checkbox").eq(0).prop('checked',true);
		console.log($(this).children("input"));
    });
	var check=$("input:checkbox:checked").val();
	console.log(check);
    //select的change事件
    $(".selectAll>select").change(function () {
		var now=$(this).children("option[selected]").val();
		console.log(now)
    });
});

$(document).ready(function () {
	/*准备时间框获得焦点*/
    $("#prepareTime").focus(function () {

        $(this).parent().css("border-color", "#2fb2f5");

    });
	/*输出框失去焦点时*/
    $("#prepareTime").blur(function () {
        $(this).parent().css("border-color", "#999999");
        var time=$(this).val().trim();
        if(time.length==0||!/^[0-9\d]{1,3}$/.test(time)){
            $("#prepareTimeError").text("时间格式错误");
        }else{
            $("#prepareTimeError").text("✔");

        }
    });
});

$(document).ready(function () {
	/*准备时间框获得焦点*/
    $("#cookingTime").focus(function () {

        $(this).parent().css("border-color", "#2fb2f5");
    });
	/*输出框失去焦点时,不为空，并且填的是数字*/
    $("#cookingTime").blur(function () {
        $(this).parent().css("border-color", "#999999");
        var time=$(this).val().trim();
        if(time.length==0||!/^[0-9\d]{1,3}$/.test(time)){
            $("#cookingTimeError").text("时间格式错误");
        }else{
            $("#cookingTimeError").text("✔");

        }
    });
});

$(document).ready(function () {
	/*主材料*/
    $("#main").focus(function () {

        $(this).css("border-color", "#2fb2f5");
    });
	/*输出框失去焦点时,不为空，并且填的是数字*/
    $("#main").blur(function () {
        $(this).css("border-color", "#999999");
        var text=$(this).val().trim();
        if(text.length==0){
            $("#mainError").text("内容不能为空");
        }else{
            $("#mainError").text("✔");
        }
    });
});

$(document).ready(function () {

    $("#other").focus(function () {

        $(this).css("border-color", "#2fb2f5");
    });
	/*辅助材料*/
    $("#other").blur(function () {
        $(this).css("border-color", "#999999");
        var text=$(this).val().trim();
        if(text.length==0){
            $("#otherError").text("内容不能为空");
        }else{
            $("#otherError").text("✔");

        }
    });
});

$(document).ready(function () {
	/*详细介绍*/
    $("#detail").focus(function () {

        $(this).css("border-color", "#2fb2f5");
    });
    $("#detail").blur(function () {
        $(this).css("border-color", "#999999");
        var text=$(this).val().trim();
        if(text.length==0){
            $("#detailError").text("内容不能为空");
        }else{
            $("#detailError").text("✔");
        }
    });
});
$(document).ready(function () {
	/*详细介绍*/
    $("#cookName").focus(function () {

        $(this).css("border-color", "#2fb2f5");
    });
    $("#cookName").blur(function () {
        $(this).css("border-color", "#999999");
        var text=$(this).val().trim();
        if(text.length==0){
            $("#nameError").text("名字不能为空");
        }else{
            $("#nameError").text("✔");
        }
    });

	/*一句话描述*/
    $("#description").focus(function () {
        $(this).css("border-color", "#2fb2f5");
    });
    $("#description").blur(function () {
        $(this).css("border-color", "#999999");
        var text=$(this).val().trim();
        if(text.length==0){
            $("#desError").text("描述不能为空");
        }else{
            $("#desError").text("✔");
        }
    });
});

/*发布的提交按钮*/
function upload() {

	/*console.log(imgArr);
	return true;*/
    var check=$(".checkUpload");
    var flag=1;
    for(var i=0;i<check.length;i++){
        if(check[i].val()!="✔"){
            flag=0;
            break;
        }
    }
    //必须上传至少一张图片
    var files=$("#file").files;
	if(files.length==0){
		flag=0;
	}
    if(flag) {
        return true;
    } else{
        alert("发布信息不完整");
        return false;
    }

		/*var data={name:$("#cookName").val().trim(),};
		 //发送ajax请求
		 $.ajax({
		 type:"POST",
		 url:"/addFood",
		 contextType:"application/json",
		 data:JSON.stringify(data),
		 success:function (su) {
		 if(su=="success"){
		 alert("发布成功");
		 window.location.href="/index";
		 }else{
		 alert("发布失败");
		 }
		 },
		 error:function (fa) {
		 alert("发布请求失败");
		 }
		 });
    }else {
        alert("信息填写错误");
    }*/

}