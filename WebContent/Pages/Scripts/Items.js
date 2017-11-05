							/*Fields Validation*/

	function isEmptyValue() {
	var target=arguments[0];
	if(target.value.length==0 || (target.value.length>0 && target.value.charAt(0)==' ')) {
	var msg="Please Select or Provide Value for \""+target.name.toUpperCase()+"\"";
	document.all?info(msg):alert(msg);
		target.focus();
		return false;
		} return true;
	}	
	function leftTrim() {
	var string=arguments[0];
	if(string.length==0) return string;
	while(string.charAt(0)==' ') string=string.substring(1);
	return string;
	}

	function rightTrim() {
	var string=arguments[0];
	if(string.length==0) return string;
	while(string.charAt(string.length-1)==' ') string=string.substring(string.length-2);
	return string;
	}

	function formValidate(frm) {
	for(var f=0;f<frm.elements.length;f++) {
	if(frm[f].type=="text" || frm[f].type=="textarea" || frm[f].type=="password" || frm[f].type=="select-one") {
		var check=isEmptyValue(frm[f]);
		status=check;
		if(!check) return false;
			}
		}  return true;
	}

	function creditCardValidate(frm) {
	for(var f=0;f<frm.elements.length;f++) {
	if(frm[f].type=="text" || frm[f].type=="textarea" || frm[f].type=="password" || frm[f].type=="select-one") {
		var check=isEmptyValue(frm[f]);
		//status=check;
		if(!check) return false;
			}
		} if(!checkCredit(frm.cardno,frm.cardtype)) return false;
		  return true;
	}
	
	function changePassword() {
	var frm=arguments[0];
	var check=formValidate(frm);
	if(!check) return false;
	if(frm.pass.value==frm.repass.value) return true;
	else  {
       var wmsg="Confirm Password Not Mathced With The Password U Supplied"
       document.all?info(wmsg):alert(wmsg);
       frm.repass.focus();
       return false;}
	}

	function blockKey() {
	obj=document.all?arguments[0].srcElement:arguments[0].target;
	if(arguments.length==2 && obj.value.length>=arguments[1])  obj.value=obj.value.substring(0,arguments[1]-1);
	var keycode=document.all?event.keyCode:arguments[0].which;
	var keychar=String.fromCharCode(keycode);
	if( (keycode==null)||(keycode==0) ||(keycode==8) ||(keycode==9)||(keycode==13) ||(keycode==27) || ("0123456789").indexOf(keychar)>-1) {
	return true;}
	return false;
	}
	//document.onkeypress=function(e) {alert(document.all?event.keyCode:e.which);}
   function getDays() {
   var cdl="<select name='day'  style='width:70px' class=ctrl>"
   cdl+="<option selected value='null'>Day</option>";
   for(day=1;day<32;day++)
   cdl+="<option value='"+day+"'>"+day+"</option>";
   cdl+="</select>";
   document.write(cdl);
   }

   function getYears() {
   var cyl="<select name='year'  style='width:70px' class=ctrl>";
   cyl+="<option selected value='null'>Year</option>";  
   for(year=1900;year<2005;year++)
   cyl+="<option value='"+year+"'>"+year+"</option>";
   cyl+="</select>";
   document.write(cyl);
   }

  function getMonths() {
  months=["jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"];
  var cyl="<select name='month'  style='width:70px' class=ctrl>";
  for(month=0;month<months.length;month++)
  cyl+="<option value='"+months[month]+"'>"+months[month]+"</option>";
  cyl+="</select>";
  document.write(cyl);
  }

function getAges() {
	  var cal="<select name='age' style='width:50px' class=ctrl>"
	  for(day=18;day<61;day++)
	  cal+="<option value='"+day+"'>"+day+"</option>";
	  cal+="</select>";
	  document.write(cal);
}

								/*VBScript*/

if(document.all) {
	document.write("<SCRIPT LANGUAGE=VBS>");
	document.write("Function info(msg)");
	document.write("msgbox msg,vbokonly or vbinformation,\":: Sathya Technologies ::\"");
	document.write("End Function");
	document.write("</SCRIP"+"T>");
}

function alphaNumeric() {
	obj=document.all?arguments[0].srcElement:arguments[0].target;
	if(arguments.length==2 && obj.value.length>=arguments[1])  obj.value=obj.value.substring(0,arguments[1]-1);
	var keycode=document.all?event.keyCode:arguments[0].which;
	var keychar=String.fromCharCode(keycode);
	var regexp=/^[a-zA-Z0-9-_]*$/; //return regexp.test(obj.value);
    var bkspace=document.all?"":8;
    return ( (keycode==null) || (keycode==0) || (keycode==32) || (keycode==45) || (keycode >=48 && keycode<=57) || (keycode >=65 && keycode<=90) || (keycode >=97 && keycode<=122) || keycode==bkspace)
}

function emailID() {
	obj=document.all?arguments[0].srcElement:arguments[0].target;
	if(arguments.length==2 && obj.value.length>=arguments[1])  obj.value=obj.value.substring(0,arguments[1]-1);
	var keycode=document.all?event.keyCode:arguments[0].which;
	var keychar=String.fromCharCode(keycode);
	var regexp=/^[a-zA-Z0-9-_]*$/; //return regexp.test(obj.value);
    var bkspace=document.all?"":8;
    return ((keycode==64) || (keycode==46) || (keycode >=48 && keycode<=57) || (keycode >=65 && keycode<=90) || (keycode >=97 && keycode<=122) || keycode==bkspace)
}

function password() {
	obj=document.all?arguments[0].srcElement:arguments[0].target;
	if(arguments.length==2 && obj.value.length>=arguments[1])  obj.value=obj.value.substring(0,arguments[1]-1);
	var keycode=document.all?event.keyCode:arguments[0].which;
	var keychar=String.fromCharCode(keycode);
	var regexp=/^[a-zA-Z0-9-_]*$/; //return regexp.test(obj.value);
    var bkspace=document.all?"":8;
    return ((keycode >=48 && keycode<=57) || (keycode >=65 && keycode<=90) || (keycode >=97 && keycode<=122) || keycode==bkspace)
}

function isValidDomain(frm1) {
	 var domains=new Array("com","edu","org","net","mil")
	 var amail=frm1.alternate_email;
	 var cond=amail.value.substring(amail.value.lastIndexOf(".")+1);
	 for(i=0;i<domains.length;i++) 
		 if(domains[i]==cond)  return true 
		 alert("Invalid Domain Name");
		 amail.focus();
		 return false;
}

function isValidSymbol(frm1) {      
	 var amail=frm1.alternate_email;
	 if(amail.value.indexOf("@")==-1||amail.value.indexOf(".")==-1) {
	 alert("Invalid Email-Id");
	 amail.focus();
	 return false;
	 } return true;
}
					
			/*******************Credit Card Validation**********************/

var ccErrorNo = 0;
var ccErrors = new Array ()
ccErrors [0] = "Unknown card type";
ccErrors [1] = "No card number provided";
ccErrors [2] = "Credit card number is in invalid format";
ccErrors [3] = "Credit card number is invalid";
ccErrors [4] = "Credit card number has an inappropriate number of digits";
function checkCreditCard (cardnumber, cardname) {
var cards = new Array();
  cards [0] = {name: "Visa", 
               length: "13,16", 
               prefixes: "4",
               checkdigit: true};
  cards [1] = {name: "Master-Card", 
               length: "16", 
               prefixes: "51,52,53,54,55",
               checkdigit: true};
  cards [2] = {name: "Diners-Club", 
               length: "14,", 
               prefixes: "300,301,302,303,304,305,36,38",
               checkdigit: true};
  cards [3] = {name: "Carte-Blanche", 
               length: "14", 
               prefixes: "300,301,302,303,304,305,36,38",
               checkdigit: true};
  cards [4] = {name: "American-Express", 
               length: "15", 
               prefixes: "34,37",
               checkdigit: true};
  cards [5] = {name: "Discover", 
               length: "16", 
               prefixes: "6011",
               checkdigit: true};
  cards [6] = {name: "JCB", 
               length: "15,16", 
               prefixes: "3,1800,2131",
               checkdigit: true};
  cards [7] = {name: "Enroute", 
               length: "15", 
               prefixes: "2014,2149",
               checkdigit: true};
  var cardType = -1;
  for (var i=0; i<cards.length; i++) {
    if (cardname.toLowerCase () == cards[i].name.toLowerCase()) {
      cardType = i;
      break;
    }
  }
  if (cardType == -1) {
     ccErrorNo = 0;
     return false; 
  }
  if (cardnumber.length == 0)  {
     ccErrorNo = 1;
     return false; 
  }
  var cardNo = cardnumber
  var cardexp = /^([0-9]{4})\s?([0-9]{4})\s?([0-9]{4})\s?([0-9]{1,4})$/;
  if (!cardexp.exec(cardNo))  {
     ccErrorNo = 2;
     return false; 
  }
  cardexp.exec(cardNo);
  cardNo = RegExp.$1 + RegExp.$2 + RegExp.$3 + RegExp.$4;
  if (cards[cardType].checkdigit) {
    var checksum = 0;                                  // running checksum total
    var mychar = "";                                   // next char to process
    var j = 1;                                         // takes value of 1 or 2
    var calc;
    for (i = cardNo.length - 1; i >= 0; i--) {
      calc = Number(cardNo.charAt(i)) * j;
      if (calc > 9) {
        checksum = checksum + 1;
        calc = calc - 10;
      }
      checksum = checksum + calc;
      if (j ==1) {j = 2} else {j = 1};
    } 
    if (checksum % 10 != 0)  {
     ccErrorNo = 3;
     return false; 
    }
  }  
  var LengthValid = false;
  var PrefixValid = false; 
  var undefined; 
  var prefix = new Array ();
  var lengths = new Array ();
  prefix = cards[cardType].prefixes.split(",");
    for (i=0; i<prefix.length; i++) {
    var exp = new RegExp ("^" + prefix[i]);
    if (exp.test (cardNo)) PrefixValid = true;
  }
  if (!PrefixValid) {
     ccErrorNo = 3;
     return false; 
  }
  lengths = cards[cardType].length.split(",");
  for (j=0; j<lengths.length; j++) {
    if (cardNo.length == lengths[j]) LengthValid = true;
  }
  
  if (!LengthValid) {
     ccErrorNo = 4;
     return false; 
  };   
    return true;
}
 function checkCredit() {
 if (!checkCreditCard (arguments[0].value,arguments[1].value)) {
	 document.all?info(ccErrors[ccErrorNo]):alert(ccErrors[ccErrorNo])
	 arguments[0].focus();
	 return false;}
	 return true;
	 }

				/*****************Date Validation*****************/

var arrYears = new Array();
var arrMonths = new Array();
var arrDays = new Array();
function dateObj(dObj, mObj, yObj) {
	this.dayObj = dObj;
	this.dayObj.parent = this;
	this.monthObj = mObj;
	this.monthObj.parent = this;
	this.monthObj.onchange = populateDays;
	this.yearObj = yObj;
	this.yearObj.parent = this;
	this.yearObj.onchange = populateDays;
	this.dayObj.onchange = updateSelDay;
	this.selDay;
}

function initDates(yFrom, yTo, selectedYear, selectedMonth, selectedDay, dateObject) {
	initYears(yFrom, yTo);
	initMonths();
	initDays();
	dateObject.selDay = selectedDay;
	populateYears(arrYears, selectedYear, dateObject);
	populateMonths(arrMonths, selectedMonth, dateObject);
	populateDays(selectedDay, dateObject);
}

function initYears(yFrom, yTo) {	
	var IDX = 0;
	for(var i = yFrom; i < (yTo+1); i++, IDX++) arrYears[IDX] = i;
}

function initMonths() {
	arrMonths[0] = 'January';
	arrMonths[1] = 'Febuary';
	arrMonths[2] = 'March';
	arrMonths[3] = 'April';
	arrMonths[4] = 'May';
	arrMonths[5] = 'June';
	arrMonths[6] = 'July';
	arrMonths[7] = 'August';
	arrMonths[8] = 'September';
	arrMonths[9] = 'October';
	arrMonths[10] = 'November';
	arrMonths[11] = 'December';
}

function initDays() {
	arrDays[0] = 31;
	arrDays[1] = 28;
	arrDays[2] = 31;
	arrDays[3] = 30;
	arrDays[4] = 31;
	arrDays[5] = 30;
	arrDays[6] = 31;
	arrDays[7] = 31;
	arrDays[8] = 30;
	arrDays[9] = 31;
	arrDays[10] = 30;
	arrDays[11] = 31;
}

function populateYears(arrIn, selYear, dObj) {
	dObj.yearObj.options.length = 0;
	
	for(var i = 0; i < arrIn.length; i++)	{
		dObj.yearObj.options.length += 1;
		dObj.yearObj.options[i].value = arrYears[i];
		dObj.yearObj.options[i].text = arrYears[i];
		if(arrYears[i] == selYear)	dObj.yearObj.options[i].selected = true;
	}
}

function populateMonths(arrIn, selMonth, dObj) {
	dObj.monthObj.options.length = 0;
	for(var i = 0; i < arrIn.length; i++)	{
		dObj.monthObj.options.length += 1;
		dObj.monthObj.options[i].value = (i+1);
		dObj.monthObj.options[i].text = (i+1);//arrMonths[i];
		if(i == selMonth - 1) dObj.monthObj.options[i].selected = true;
	}
}

function populateDays(selDay, dObj) {
	if(dObj == null) dObj = this.parent;
	var month = dObj.monthObj.selectedIndex;
	var days = arrDays[month];
	if(selDay == null)	{
		selDay = dObj.selDay;
		if(selDay > days)	{
			selDay = days;
			dObj.selDay = selDay;
		}
	}
	dObj.dayObj.options.length = 0; //reset day list
	if(month == 1)	{
		intYear=dObj.yearObj.options[dObj.yearObj.selectedIndex].value;
		if(intYear % 4 == 0 && (intYear % 100 != 0 || intYear % 400 == 0)) 
			days = arrDays[month] + 1;
	}

	for(var i = 1; i < days + 1; i++)	{
		dObj.dayObj.options.length += 1;
		dObj.dayObj.options[i-1].value = i;
		dObj.dayObj.options[i-1].text = i;
		if(i == selDay)	dObj.dayObj.options[i-1].selected = true;
	}
}

function updateSelDay(dObj) {
	if(dObj == null) dObj = this.parent;
	dObj.selDay = dObj.dayObj.selectedIndex + 1;
}


						/*File Upload Controls*/

/*	var c=1;
	var doc=document.getElementById('files');
	var obj=doc.childNodes[1];
	var add="Add One More";
	var del="Remove All";
	var len=(obj.childNodes);
	function addOne() {
		c++;
		tr=document.createElement("DIV");
		tr.style.paddingTop="5px";
		tr.setAttribute("id","tr"+c);
		sub=document.createElement("INPUT");
		sub.setAttribute("name","file"+c);
		sub.className="input"
		sub.style["width"]="200px";
		link=document.createElement("A");
		link.setAttribute("href","javascript:removeField("+c+")");
		link.setAttribute("id","a"+c);
		tnode=document.createTextNode("Remove It");
		link.appendChild(tnode);
		sub.setAttribute("type","file");
		tr.appendChild(sub);
		tr.appendChild(document.createTextNode("  "));
		tr.appendChild(link);
		if(obj.lastChild.innerHTML==del) {
		//	alert("Sorry! Only 3 Files are Allowed");
		//	setHTML();
			return;
		}
		if(len!=5) obj.insertBefore(tr,obj.lastChild);
		setHTML();
	
	}
	function removeField() {
		for(var i=0;i<obj.childNodes.length;i++) {
		cont=obj.childNodes[i];
		if(getId(cont)=='tr'+arguments[0]) obj.removeChild(cont);
		} setHTML();
	}
	function getId() {
	try{
		status=arguments[0].getAttribute('id');	
		return arguments[0].getAttribute('id');	
	   } catch(e) { return "no id"; }
	}
	function setHTML() {
		obj["lastChild"]["innerHTML"]=(len.length==5)?del:add;
	}
*/
					/*Credit Card Sample Format*/
/*

crdno=[
		["Visa","4111 1111 1111 1111"],
		["MasterCard","5500 0000 0000 0004"], 
		["American Express","3400 0000 0000 009"], 
		["Diner's Club","3000 0000 0000 04"], 
		["Carte Blanche","3000 0000 0000 04"], 
		["Discover","6011 0000 0000 0004"], 
		["JCB","2131 0000 0000 0008"], 
		["enRoute","2014 0000 0000 009"]
   	]

*/
var cf=false;
function checkAll() {
	var arg=arguments[0];
	var et=document.all?arguments[1].srcElement:arguments[1].target;
	if(cf==false) {
					for(var i=0;i<arg.elements.length;i++) {
					if(arg.elements[i].type=="checkbox") arg.elements[i].checked=true;
					if(document.all) et.innerHTML="<U>U</u>n Check All";
					} cf=true;
	} else {
				for(var i=0;i<arg.elements.length;i++) {
				if(arg.elements[i].type=="checkbox") arg.elements[i].checked=false;
				if(document.all) et.innerHTML="<U>C</u>heck All";
				} cf=false;
	}
 }

function showMessage() {
try{
	win=open("","","width=500,height=400,left=120,top=120");
	var str=new String("<title>Telugu Matrimony.com</title>");
	str+="<BODY leftmargin=20 topmargin=20 oncontextmenu=\"return false\" bgcolor=linen>";
	str+="<DIV style='text-align:justify;color:gray;font:100 12px tahoma;border:1px solid gray;-moz-border-radius:20px;padding:10px;width:450px;height:350px;overflow:scroll'>";
	win.document.write(str+document.getElementById('message').innerHTML+"</div></body></html>");
	win.document.close();
} catch(error) { window.status=error.description;}
}