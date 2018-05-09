// 设置移入移出事件
var btmbar = document.getElementsByClassName("btmbar")[0];
btmbar.addEventListener("mouseover", btmover, false);
function btmover() {
	btmbar.style.bottom = "0px";
}
btmbar.addEventListener("mouseout", btmOut, false)
function btmOut() {
	btmbar.style.bottom = "-46px";
}

// 对锁加点击事件
var flg = true;

var lock = document.getElementsByClassName("btn")[0];
lock.addEventListener("click", aaa);
function aaa() {
	//debugger;
	if (flg) {
		//alert(1);
		lock.style['background-position-x'] = '-100px';
		btmbar.removeEventListener("mouseout", btmOut)
		btmbar.style.bottom = "0px";
	} else {
		//alert(2);
		btmbar.addEventListener("mouseout", btmOut, false)
		lock.style['background-position-x'] = '-65px';
	}
	;
	flg = !flg;
}

//"回到顶部"按钮的显示或隐藏
/*document.getElementsByClassName("body1")[0].onscroll = function () {
var top=document.getElementsByClassName("body1")[0].scrollTop;

if (top>0) {

		document.getElementById("toTop").style.display = "block";
	}else{

		document.getElementById("toTop").style.display = "none";
		}
	}*/

//改变nav的背景
function change_bg(obj){
	var a=document.getElementById("nv").getElementsByTagName("a");
	for(var i=0;i<a.length;i++){
		a[i].className="";
	}
	obj.className="n_tj";
}

function change_hd(obj){
	var h=document.getElementById("head").getElementsByTagName("a");
	for(var i=0;i<h.length;i++){
		h[i].className="";
	}
	obj.className="first_a";
}	
