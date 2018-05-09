var beforePhoto;
	$(function($) {
		var usid = $.trim($("#usid").val());
		$.post("userInfoServlet", {
			op : "findById",
			usid : usid
		}, function(data) {

			if (data.sex == "男") {
				$("#man").attr("checked", true);
			}
			if (data.sex == "女") {
				$("#girl").attr("checked", true);
			}
			if (data.sex == "保密") {
				$("#secret").attr("checked", true);
			}
			//$("#province").find("option[text='"+data.province+"']").attr("selected",true); //省份
			 $("#province").find("option:contains('"+data.province+"')").attr("selected",true);
			$("#citya").append("<option>"+data.city+"</option>");//城市
			var time=data.birth;
			var b = time.split("/");
			//alert('年份' + b[0] + '月份' + b[1] + '日' +b[2]);
			 $("#birth_year").find("option:contains('"+b[0]+"')").attr("selected",true);
			 $("#birth_month").find("option:contains('"+b[1]+"')").attr("selected",true);
			 $("#birth_day").find("option:contains('"+b[2]+"')").attr("selected",true);
		}, "json")
	})
	function selectFile() {
		//触发 文件选择的click事件  
		$("#singer_update_photo").trigger("click");
		beforePhoto = "";
	}
	//修改个人信息
	function changeInfo(usid) {
		var uname = $.trim($("#uname").val());
		var mark = $.trim($("#signature").val());
		var province = $.trim($("#province").val());
		var city = $.trim($("#citya").val());

		var birth = $.trim($("#birth_year").val()) + "/"
				+ $.trim($("#birth_month").val()) + "/"
				+ $.trim($("#birth_day").val());
		var sex = $('input[name="sex"]:checked').val();
		beforePhoto = $.trim($("#beforeStr").val());

		$.ajaxFileUpload({
			url : "userInfoServlet?op=updateUser",
			secureuri : false,
			fileElementId : "singer_update_photo",
			dataType : "text",
			data : {
				uname : uname,
				mark : mark,
				birth : birth,
				province : province,
				city : city,
				email : beforePhoto,
				usid : usid,
				sex : sex
			},
			success : function(data, status) {
				data = parseInt($.trim(data));
				if (data > 0) {
					alert("修改成功");
					location.href = "setting.jsp"
				} else {
					alert("修改失败");
				}

			}
		});
	}
	function getSex() {
		var value = "";
		var radio = $("sex");
		for (var i = 0; i < radio.length; i++) {
			if (radio[i].checked == true) {
				value = radio[i].value;
				break;
			}
		}
		return value;
	}
	
	var i=0;
	function selPro(){
		$("#citya").html("");
        var arr =[['东城区', '西城区','崇文区','宣武区','朝阳区','丰台区','石景山区', '海淀区','门头沟区', '房山区','通州区','顺义区','昌平区','大兴区','怀柔区','平谷区','密云县','延庆县']
                ,['和平区','河东区', '河西区', '南开区', '河北区', '红桥区', '塘沽区', '汉沽区', '大港区', '东丽区', '西青区', '津南区', '北辰区', '武清区', '宝坻区', '宁河县', '静海县', '蓟县']
                ,['黄浦区','卢湾区', '徐汇区','长宁区','静安区','普陀区','闸北区','虹口区', '杨浦区', '闵行区', '宝山区', '嘉定区', '浦东新区', '金山区', '松江区', '青浦区', '南汇区', '奉贤区', '崇明县']
                ,['万州区','涪陵区','渝中区','大渡口区','江北区','沙坪坝区','九龙坡区','南岸区','北碚区','万盛区','双桥区','渝北区','巴南区','黔江区','长寿区','江津区','合川区','永川区','南川区','綦江县','潼南县','铜梁县','大足县','荣昌县','璧山县','梁平县','城口县','丰都县','垫江县','武隆县','忠县','开县','云阳县','奉节县','巫山县','巫溪县','石柱土家族自治县','秀山土家族苗族自治县','酉阳土家族苗族自治县','彭水苗族土家族自治县']
                ,['武汉市','黄石市','十堰市', '宜昌市', '襄樊市', '鄂州市', '荆门市', '孝感市', '荆州市', '黄冈市', '咸宁市', '随州市', '恩施土家族苗族自治州','仙桃市', '潜江市', '天门市', '神农架林区']
                ,['石家庄市', '唐山市', '秦皇岛市', '邯郸市', '邢台市', '保定市', '张家口市', '承德市', '沧州市', '廊坊市', '衡水市']
                ,['福州市', '厦门市', '莆田市', '三明市', '泉州市', '漳州市', '南平市', '龙岩市', '宁德市']
                ,["广州市","韶关市","珠海市","深圳市","汕头市","佛山市","肇庆市","揭阳市","中山市","云浮市","江门市","湛江市","茂名市","惠州市","东莞市","阳江市","清远市","梅州市","汕尾市","河源市","潮州市"]
                ,['海口市','三亚市','五指山市', '琼海市', '儋州市', '文昌市', '万宁市', '东方市', '定安县', '屯昌县', '澄迈县', '临高县', '白沙黎族自治县', '昌江黎族自治县', '乐东黎族自治县', '陵水黎族自治县', '保亭黎族苗族自治县', '琼中黎族苗族自治县']
                ,['台北市', '高雄市', '基隆市', '台中市', '台南市', '新竹市', '嘉义市']
                ,['成都市','自贡市', '攀枝花市', '泸州市', '德阳市', '绵阳市', '广元市', '遂宁市', '内江市', '乐山市', '南充市', '眉山市', '宜宾市', '广安市', '达州市', '雅安市', '巴中市', '资阳市', '阿坝藏族羌族自治州', '甘孜藏族自治州', '凉山彝族自治州']
                ,['长沙市', '株洲市','湘潭市', '衡阳市', '邵阳市', '岳阳市', '常德市', '张家界市', '益阳市', '郴州市', '永州市', '怀化市', '娄底市', '湘西土家族苗族自治州']
                ,['合肥市', '芜湖市', '蚌埠市', '淮南市', '马鞍山市', '淮北市', '铜陵市', '安庆市', '黄山市', '滁州市','阜阳市','宿州市', '巢湖市', '六安市', '亳州市', '池州', '宣城市']
                ,['南京市', '无锡市', '徐州市', '常州市', '苏州市', '南通市', '连云港市', '淮安市', '盐城市', '扬州市', '镇江市', '泰州市', '宿迁市']
                ,['昆明市',' 曲靖市','玉溪市','保山市','昭通市','丽江市','思茅市','临沧市','楚雄彝族自治州','红河哈尼族彝族自治州','文山壮族苗族自治州','西双版纳傣族自治州','大理白族自治州','德宏傣族景颇族自治州','怒江傈僳族自治州','迪庆藏族自治州']
                ,['乌鲁木齐市', '克拉玛依市', '吐鲁番地区', '哈密地区', '昌吉回族自治州 ', '博尔塔拉蒙古自治州 ', '巴音郭楞蒙古自治州 ', '阿克苏地区', '克孜勒苏柯尔克孜自治州 ', '喀什地区', '和田地区', '伊犁哈萨克自治州', '塔城地区', '阿勒泰地区', '石河子市', '阿拉尔市', '图木舒克市', '五家渠市']
                ,['呼和浩特市', '包头市', '乌海市', '赤峰市', '通辽市', '鄂尔多斯市', '呼伦贝尔市', '巴彦淖尔市', '乌兰察布市', '兴安盟', '锡林郭勒盟', '阿拉善盟']
                ,['兰州市','嘉峪关市', '金昌市', '白银市', '天水市', '武威市', '张掖市', '平凉市', '酒泉市', '庆阳市', '定西市', '陇南市', '临夏回族自治州', '甘南藏族自治州']
                ,['南宁市','柳州市','桂林市','梧州市','北海市','防城港市','钦州市','贵港市','玉林市','百色市','贺州市','河池市','来宾市','崇左市']
                ,['银川市','石嘴山市','吴忠市','固原市','中卫市']
                ,['中西区', '湾仔区', '东区', '南区', '油尖旺区', '深水埗区', '九龙城区', '黄大仙区', '观塘区', '荃湾区', '葵青区', '沙田区', '西贡区', '大埔区', '北区', '元朗区', '屯门区', '离岛区']
                ,['澳门']
                ,['杭州市', '宁波市', '温州市', '嘉兴市', '湖州市', '绍兴市', '金华市', '衢州市', '舟山市', '台州市', '丽水市']
                ,['沈阳市' ,'大连市' ,'鞍山市' ,'抚顺市' ,'本溪市' ,'丹东市' ,'锦州市' ,'营口市' ,'阜新市' ,'辽阳市' ,'盘锦市' ,'铁岭市' ,'朝阳市' ,'葫芦岛市']
                ,['哈尔滨市','齐齐哈尔市','鸡西市','鹤岗市','双鸭山市', '大庆市', '伊春市', '佳木斯市', '七台河市', '牡丹江市', '黑河市', '绥化市', '大兴安岭地区']
                ,['济南市','青岛市','淄博市','枣庄市','东营市','烟台市','潍坊市','济宁市','泰安市','威海市','日照市','莱芜市','临沂市','德州市','聊城市','滨州市','菏泽市']
                ,['南昌市','景德镇市','萍乡市','九江市','新余市','鹰潭市','赣州市','吉安市','宜春市','抚州市','上饶市']
                ,['太原市','大同市', '阳泉市', '长治市', '晋城市', '朔州市', '晋中市', '运城市', '忻州市', '临汾市', '吕梁市']
                ,['西安市','铜川市','宝鸡市', '咸阳市', '渭南市', '延安市', '汉中市', '榆林市', '安康市', '商洛市']
                ,['长春市', '吉林市', '四平市', '辽源市', '通化市', '白山市', '松原市', '白城市', '延边朝鲜族自治州']
                ,['贵阳市','六盘水市', '遵义市', '安顺市', '铜仁地区', '黔西南布依族苗族自治州', '毕节地区', '黔东南苗族侗族自治州', '黔南布依族苗族自治州']
                ,['西宁市' ,'海东地区', '海北藏族自治州', '黄南藏族自治州', '海南藏族自治州', '果洛藏族自治州', '玉树藏族自治州', '海西蒙古族藏族自治州']
                ,['拉萨市','昌都地区', '山南地区', '日喀则地市', '那曲地区', '阿里地区', '林芝地区']
                ];
        /*拿到省份的索引*/
		var myselect = document.getElementById("province");
        var index = myselect.selectedIndex;
		var pro=myselect.options[index].value;
		if(index==0){
			i+=1;
		}
		
        /*拿到省份数组中对应的城市*/
        var citys = arr[index];
        /*拿到子菜单节点*/
        var subselNode = document.getElementById("citya");
        /*移除子菜单中的城市
        注意：循环时不要“i++”,因为循环条件在递减，若在进行i++，会产生删除不干净的错误
        */
        for(var i=1; i<subselNode.options.length; ){
            subselNode.removeChild(subselNode.options[i]);
        }
        for(var i=0; i<citys.length; i++){
            /*创建节点*/
            var optNode = document.createElement("option");
            /*拿出数组对应的城市*/
            optNode.innerText = citys[i];
            /*将城市添加到子菜单中*/
            subselNode.appendChild(optNode);
        }
	 }
	  function selCity(){
		var myselect = document.getElementById("citya");
        var index = myselect.selectedIndex;
		var city=myselect.options[index].value;
	}

// 140字
var txt = document.getElementById("signature");
txt.onkeydown = function() {
	var txt = this.value;
	if (txt.length > 139) {
		alert("error");
	} else {
		document.getElementById("remain").innerHTML = 139 - txt.length;
	}
}

// 年月日
window.onload = function() {
	// 首先，先放年
	for (var i = new Date().getFullYear(); i >= 1900; i--) {
		// id 文本值 value值
		addOption("birth_year", i, i);
	}

	// 然后，放月
	for (var i = 1; i <= 12; i++) {
		addOption("birth_month", i, i);
	}
	// 先默认每个月都放31天
	for (var i = 1; i <= 31; i++) {
		addOption("birth_day", i, i);
	}
}

function setDays(year, month, day) {
	var monthDays = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
	var myyear = year.options[year.selectedIndex].text;
	var mymon = month.options[month.selectedIndex].text;

	var num = monthDays[mymon - 1];

	if (mymon == 2 && isLeapYear(myyear)) {
		num++;
	}

	for (var j = day.options.length - 1; j > num; j--) {
		day.remove(j);// 29
	}
	for (var k = day.options.length; k < num; k++) {
		addOption("birth_day", k, k);
	}

	// console.log(myyear+"--"+mymon+"--"+num);
}

function addOption(id, txt, value) {
	var option = document.createElement("option");
	option.text = txt;
	option.value = value;
	// 添加
	document.getElementById(id).options.add(option);
}
function isLeapYear(year) {
	return ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0);
}

// "回到顶部"按钮的显示或隐藏
/*document.getElementsByClassName("body1")[0].onscroll = function() {
	var top = document.getElementsByClassName("body1")[0].scrollTop;

	if (top > 0) {

		document.getElementById("toTop").style.display = "block";
	} else {

		document.getElementById("toTop").style.display = "none";
	}
}*/