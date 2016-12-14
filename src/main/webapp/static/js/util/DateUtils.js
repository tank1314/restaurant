﻿DateUtils=typeof DateUtils =="undefined"?{}:DateUtils;
DateUtils.date2String= function (fmt,date) {
	if(date==null)
		date=new Date();
	else if(typeof date ==='number' )
		date=new Date(date);
	var o = {
			"M+": date.getMonth() + 1, //月份
			"d+": date.getDate(), //日
			"h+": date.getHours() % 12 == 0 ? 12 : date.getHours() % 12, //小时
					"H+": date.getHours(), //小时
					"m+": date.getMinutes(), //分
					"s+": date.getSeconds(), //秒
					"q+": Math.floor((date.getMonth() + 3) / 3), //季度
					"S": date.getMilliseconds() //毫秒
	};
	var week = {
			"0": "/u65e5",
			"1": "/u4e00",
			"2": "/u4e8c",
			"3": "/u4e09",
			"4": "/u56db",
			"5": "/u4e94",
			"6": "/u516d"
	};
	if (/(y+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
	}
	if (/(E+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "/u661f/u671f" : "/u5468") : "") + week[date.getDay() + ""]);
	}
	for (var k in o) {
		if (new RegExp("(" + k + ")").test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		}
	}
	return fmt;
}
DateUtils.string2Date=function (fmt,dateStr) {
	var date=new Date();
	var o = {
			"y+":function(y){date.setYear(parseInt(y))},
			"M+": function(m){date.setMonth(parseInt(m)-1)}, //月份
			"d+": function(d){date.setDate(parseInt(d))}, //日
			"h+": function(h){date.setHours(parseInt(h))}, //小时
			"H+":function(H){date.setHours(parseInt(H))}, //小时
			"m+": function(m){date.setMinutes(parseInt(m))}, //分
			"s+": function(s){date.setSeconds(parseInt(s))}, //秒
//			"q+":function(y){date.setYear(parseInt(y))}, //季度
			"S": function(S){date.setMilliseconds(parseInt(S))} //毫秒
	};
	for (var k in o) {
		var r=new RegExp("(" + k + ")");
		var mat=fmt.match(r)
		if (mat) {
			var val=dateStr.substr(mat.index,mat[0].length);
			o[k](val);
		}
	}
	return date;
}
/**
 * 获取当天小时 与分钟部分的总分钟数 2015-11-1 01:01:55  -->61
 * @param d
 * @return
 */
DateUtils.getMinutesFromTime=function(d)
{
	return d.getHours()*60+ d.getMinutes();
	//return ca.getTimeInMillis();
}
/**
 * 当前小时数 转换成 字符串的时间
 * @param ms
 * @return
 */
DateUtils.getTimeStrFromMinutes=function(min)
{
	var _h=parseInt(min/60);
	var _m=min%60;
	return (_h<10?("0"+_h):_h+"")+":"+(_m<10?("0"+_m):_m+"");
}
//Object.defineProperty(Date.prototype,"string2Date",{
//	writable : false,
//	enumerable : false,
//	configurable :false
//});
//Object.defineProperty(Date.prototype,"date2String",{
//	writable : false,
//	enumerable : false,
//	configurable :false
//});
function main()
{
	console.log(new Date().pattern("hh:mm:ss yyyyy-MM-dd"));
	console.log(DateUtils.parse("hh:mm:ss yyyy-MM-dd","12:55:33 2012-12-31").pattern("yyyy-MM-dd hh:mm:ss"));
}