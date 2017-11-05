	var msg=" Matrimony Place for Find ing Life Partner";
	var chars=0;
	var tp="";
	var next=0;
	var ypos=15;
	var fade=100;
	function doText(text) {
		if(chars<=text.length-1) {
			 tp+=text.charAt(chars);
			 document.getElementById('tele').innerHTML=tp.substring(1);//hcursor();
			 chars++;
			 } else scrollIt();
			 setTimeout("doText(msg)",50);
		}
	var hcurs=["|", "!", "_", "\/", "/", "|"];
	function hcursor() {
	return (hcurs[Math.round(7*Math.random())]);
	}
	function scrollIt() {
	if(ypos>=1) {
					ypos-=1;
					fade-=4;
					if(ypos<1) document.getElementById('tele').innerHTML="          ";
		    } else {
				ypos=15;
				nmsg();
				chars=0;
				tp=0;
				fade=100;
			}  
			document.getElementById('tele').style["top"]=ypos;
			document.getElementById('tele').style[document.all?"filter":"MozOpacity"]=document.all?"alpha(opacity="+fade+")":fade/100;
	}
	function nmsg() {
		msg=nm[next];
		if(next==3) next=0;
		else next++;
	}
var site = new Object();
var nbsp="&nbsp;&nbsp;"
var cursor=document.all?"hand":"pointer";
site.header = function(title,watermark,toplogo) {
	var head=new String("");
	var spaces=new String(nbsp);
	for(var spc=0;spc<150;spc++) spaces+=nbsp;
	head +='<LINK HREF="../Styles/Matrimony.css" REL="STYLESHEET">';
	head += '<TITLE>::'+nbsp+title+nbsp+'::'+spaces+"</TITLE>";
	head += "<BODY LEFTMARGIN=0 TOPMARGIN=0 BGPROPERTIES=FIXED background='"+watermark+"'>";
	head += "<TABLE WIDTH=780 align=center cellspacing=0 cellpadding=0 border=0 bgcolor=#fbfaf8>"
	head += "<TR><TD><img src='"+toplogo+"' border=0 alt='Matrimony.com' height=60></TD>";
	head += "<TD><center><h1 id=tele class=tele></h1></center></TD></TR></TABLE>"
	document.write(head);
}

var $header = {toString: function(){
	return site.header("Telugu Matrimony.com");
	}
}
function disableAnchor() {
	var lks=document.getElementsByTagName("A");
	for(lk=0;lk<lks.length;lk++) {
   lks[lk].onmouseover=function() {status=this.innerHTML;return true;}
   lks[lk].onmouseout=function() {status="Done";return true;}
   lks[lk].onfocus=function() {status="Done";this.blur();return true;}
   lks[lk].oncontextmenu=function() {
					if(this.href.indexOf("javascript:")!=-1) return;
					var cfrm=confirm("Would You Like To Open This Link In New Window");				
					if(cfrm) open(this.href);
	   }
	}
}

var ini=0,fader;
var fcolor=["000000","111111","222222","333333","444444","555555","666666","777777","888888","999999","aaaaaa","bbbbbb","cccccc","dddddd","eeeeee","ffffff","honeydew"]
//fcolor=fcolor.reverse();
function bgFade(obj) {
objt=eval(obj);
ini++;
objt.style.backgroundColor=fcolor[ini];
if(ini==fcolor.length) {
	ini=0;
	return}
fader=setTimeout("bgFade(objt)",50);
}

onload=function() {
		doText(msg);
		fadingTooltipsInit();
		getNavigate();
		/********************/
		var ipt=document.getElementsByTagName("INPUT");
		var tar=document.getElementsByTagName("TEXTAREA");
		var but=document.getElementsByTagName("BUTTON");
		var comb=document.getElementsByTagName("SELECT");
		var errors=document.getElementsByTagName("LI");
	    for(var j=0;j<but.length;j++) {
			 but[j].style["cursor"]=cursor;
			 but[j].onmouseover=but[j].onfocus=function() { this.style.background='green'}
			 but[j].onmouseout=but[j].onblur=function() {this.style.background="#234923"}
		}
	    for(var j=0;j<ipt.length;j++) {
		if(ipt[j].type!="checkbox" && ipt[j].type!="radio" && ipt[j].className!="disable") {
		ipt[j].onfocus=function() { bgFade(this);this.select();}
		ipt[j].onblur=function() {this.style.background=(this.className=='ctrl'?"#fbfaf0":"#fbfaf0");}
			 }
		 }
		for(var j=0;j<tar.length;j++) {
 		tar[j].onfocus=function() { bgFade(this);this.style.height='70px';this.select();}
		tar[j].onblur=function() {this.style.background=(this.className=='ctrl'?"#fbfaf0":"#fbfaf0");this.style.height='18px';}
		}
		for(var j=0;j<comb.length;j++) {
		if(comb[j].className!="mycontrol") {
		comb[j].onfocus=function() {this.style.background="honeydew";}
		comb[j].onblur=function() {this.style.background="#fbfaf0";}
			 }
		}
		//for(var er=0;er<errors.length;er++) fadeError(errors[er]);
		document.onselectstart=function() {
		var el=event.srcElement;
			if(el.tagName=="INPUT" || el.tagName=="TEXTAREA" || el.tagName=="SELECT") return true;
			return false;
		}
		document.oncontextmenu=function(evt) {
		var	resolveTag=document.all? event.srcElement:evt.target;
		if(resolveTag.tagName=="BODY" || resolveTag.tagName=="HTML") {
			 location="view-source:"+location;
		 	 return false;
			 } else return false;
		 }
		 try {
			disableAnchor();
			 } catch(Exception) { }


}

function viewPhoto() {
	var url=arguments[0];
	window.open(url,"","width=500 height=400,scrolling=yes,left=150,top=50");
}



							/*Fading Tooltip*/

var ie5 = (document.getElementById && document.all); 
var ns6 = (document.getElementById && !document.all);
obj=document.createElement("DIV");
obj.setAttribute("id","box");

var timerID = null;
var opak = 0;
var index = 0;
var mouseX = 5;
var mouseY = 20;
function mozOpacity(){
	if(ns6){
		opacity = opak + 7;
		opak = opacity;
		timerID = setTimeout("mozOpacity()", 70);
		obj.style.MozOpacity = opacity/100;// + '%';
	}
}

function stopMozOpacity(){
	if(ns6){
		if(timerID!=null){
			clearTimeout(timerID);
			timerID=null;
		}
		obj.style.MozOpacity = 0.0;
		opak = 0;
	}
}

function changeMsg(evt){
	try{
			var et=document.all?event.srcElement:evt.target;
			idx=et.getAttribute("count");
			var trans=Math.random()*6
			if(ie5) {
				obj.style.filter="revealTrans(transition=3,duration=0.3)";
				obj.filters[0].Apply();
				obj.style.visibility = "visible";
				obj.filters[0].Play();
				obj.innerHTML = msgg[idx];
			}
			else if(ns6){
				obj.style.visibility = "visible";
				obj.innerHTML = msgg[idx];
				if (opak < 100)	mozOpacity();
			}
	}catch(error) { window.status=error.description;}
}

function hideMsg(){
	if(ie5){
		obj.style.visibility="hidden";
	}
}

function getMouseMove(e){
	if(ie5){
		obj.style.left = document.body.scrollLeft + event.clientX + mouseX;
		obj.style.top = document.body.scrollTop + event.clientY + mouseY;
	}
	else if(ns6){
		obj.style.left = window.pageXOffset + e.clientX + mouseX;
		obj.style.top = window.pageYOffset + e.clientY + mouseY;
	}
}

function fadingTooltipsInit(){
	if(ie5 || ns6){
		obj = document.getElementById('box');
		lnk = document.links;
		for(var i=0;i<lnk.length;i++){
			if(ie5){
				if(lnk[i].className=='tree') {
					lnk[i].attachEvent("onmouseout", hideMsg);
					lnk[i].attachEvent("onmouseover", changeMsg);
				}

			}
			else if(ns6){
				if(lnk[i].className=='tree') {
					lnk[i].addEventListener("mouseout", stopMozOpacity, false);
					lnk[i].addEventListener("mouseover", changeMsg, false);}
			}
		}
	}
}
document.onmousemove=getMouseMove;
var udd=true;
var cr=1;
function fadeError(obj) {
	error=eval(obj);
	if(cr>2||cr<2) udd=!udd;
	if(error.className=='error') error.style.color=udd?"linen":"green";
	if(cr<2) cr++;
	else cr--;
	setTimeout("fadeError(error)",100);
	}

function getNavigate() {
	var trows=document.getElementsByTagName("TR");
	for(var i=0;i<trows.length;i++) {
			if(trows[i].className=="click") {
					trows[i].style["cursor"]=document.all?"hand":"pointer";
					trows[i].onmouseover=function() {this.style.background='floralwhite';}
					trows[i].onmouseout=function() {this.style.background='whitesmoke';}
					trows[i].onclick=function() {
							try{
							var test=this.cells[0].childNodes[0].nodeName;
							if(test!="INPUT") {
								document.hideform.profileid.value=this.cells[0].innerHTML;
								document.hideform.submit();
							}
						   } catch(error) { }}
			  }
		}
}