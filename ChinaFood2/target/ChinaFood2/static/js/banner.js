//轮播图
$(document).ready(function(e) {

    var unslider04 = $('#banner').unslider({

		dots: true

	}),

	data04 = unslider04.data('unslider');

	

	$('.unslider-arrow04').click(function() {

        var fn = this.className.split(' ')[1];

        data04[fn]();

    });

});

//tab层切换div内容
$(document).ready(function(){
	var $tab_li = $('#tab ul li');
	$tab_li.hover(function(){
		$(this).addClass('selected').siblings().removeClass('selected');
		var index = $tab_li.index(this);
		$('div.tab_box > div').eq(index).show().siblings().hide();
	});	
});

//评论滚动
$(function() { 
	var $this = $("#all-board");
	var scrollTimer;
	$this.hover(function() {
		clearInterval(scrollTimer);
	}, function() {
		scrollTimer = setInterval(function() {
			scrollNews($this);
		}, 2000);
	}).trigger("mouseleave");

function scrollNews(obj) {
	var $self = obj.find("ul");
	var lineHeight = $self.find("div:first").height();
	$self.animate({
		"marginTop": -250 + "px"
	}, 600, function() {
		$self.css({
			marginTop: 0
		}).find("div:first").appendTo($self);
	})
}
});
