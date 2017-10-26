package com.ofs.profile;
import org.apache.struts.validator.ValidatorForm;
public class RegisterForm extends ValidatorForm {
	String profileid;
	String username;
	String age;
	String year;
	String month;
	String day;
	String hrs;
	String mins;
	String meridian;
	String pob;
	String gender;
	String height;
	String icf;
	String weight;
	String kp;
	String mothertongue;
	String physicalstatus;
	String caste;
	String subcaste;
	String gotram;
	String star;
	String sunsign;
	String kujadosham;
	String eatinghabits;
	String education;
	String occupation;
	String annualincome;
	String city;
	String state;
	String phoneno;
	String regdby;
	String refby;
	String status;
	String noofchildren;
	String childrenlivingstatus;
	String religion;
	String country;
	String citizenship;
	String resident;
	String employment;
	String email;
	String pwd1;
	String pwd2;
	String termsandconditions;
	public void setProfileid(String profileid) {
		this.profileid=profileid;
	}
	public void setUsername(String  username) {
		this.username=username;
	}
	public void setAge(String age) {
		this.age=age;
	}
	public void setYear(String year) {
		this.year=year;
	}
	public void setMonth(String month) {
		this.month=month;
	}
	public void setDay(String day) {
		this.day=day;
	}
	public void setHrs(String hrs) {
		this.hrs=hrs;
	}
	public void setMins(String mins) {
		this.mins=mins;
	}
	public void setMeridian(String meridian) {
		this.meridian=meridian;
	}
	public void setPob(String pob) {
		this.pob=pob;
	}
	public void setGender(String gender) {
		this.gender=gender;
	}
	public void setHeight(String height) {
		 this.height=height;
	 }
	public void setIcf(String icf) {
		this.icf=icf; // ICF --> inches or cms or feet
	}
	public void setWeight(String weight) {
		this.weight=weight;
	}
	public void setKp(String kp) {
		this.kp=kp; // kp --> kilo or pounds
	}
	public void setMothertongue(String mothertongue) {
		this.mothertongue=mothertongue;
	}
	public void setPhysicalstatus(String  physicalstatus) {
		this.physicalstatus=physicalstatus;
	}
	public void setCaste(String caste) { 
		this.caste=caste;
	}
	public void setSubcaste(String subcaste) {
		this.subcaste=subcaste;
	}
	public void setGotram(String gotram) {
		this.gotram=gotram;
	} 
	public void setStar(String  star) {
		this.star=star;
	} 
	public void setSunsign(String  sunsign) {
		this.sunsign=sunsign;		
	} 
	public void setKujadosham(String kujadosham) {
		this.kujadosham=kujadosham;
	} 
	public void setEatinghabits(String eatinghabits) {  
		this.eatinghabits=eatinghabits;
	}
	public void setEducation(String education) {    
		this.education=education;
	}
	public void setOccupation(String  occupation) {  
		this.occupation=occupation;
	}
	public void setAnnualincome(String  annualincome) {
		this.annualincome=annualincome;
	}
	public void setCity(String city) {   
		this.city=city;
	}
	public void setState(String  state) {  
		this.state=state;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno=phoneno;
	}
	public void setRegdby(String  regdby) { 
		this.regdby=regdby;
	}
	public void setRefby(String refby) {  
		this.refby=refby;
	}
	public void setStatus(String  status) { 
		this.status=status;
	}
	public void setNoofchildren(String noofchildren) { 
		this.noofchildren=noofchildren;
	 }
	public void setChildrenlivingstatus(String childrenlivingstatus) { 
		this.childrenlivingstatus=childrenlivingstatus;
	}
	public void setReligion(String  religion) {  
		this.religion=religion;
	}
	public void setCountry(String country) { 
		this.country=country;
	}
	public void setCitizenship(String citizenship) {
		this.citizenship=citizenship;
	}
	public void setResident(String resident) {
		this.resident=resident;
	}
	public void setEmployment(String  employment) {
		this.employment=employment;
	}
	public void setEmail(String email) { 
		this.email=email;
	}
	public void setPwd1(String pwd1) {  
		this.pwd1=pwd1;
	}
	public void setPwd2(String pwd2) {  
		this.pwd2=pwd2;
	}
	public void setTermsandconditions(String termsandconditions) {
		this.termsandconditions=termsandconditions;
	}
	public String getProfileid() {
		return profileid;
	}
	public String getUsername(){ 
		return  username;
	}
	public String getAge(){ 
		return age;
	}
	public String getYear() {
		return year;
	}
	public String getMonth() {
		return month;
	}
	public String getDay() {
		return day;
	}
	public String getHrs() {
		return hrs;
	}
	public String getMins() {
		return mins;
	}
	public String getMeridian() {
		return meridian;
	}
	public String getPob() {
		return pob;
	}
	public String getGender(){ 
		return   gender;
	}
	public String getHeight(){ 
		return height;
	}
	public String getIcf(){ 
		return   icf;
	}
	public String getWeight(){ 
		return   weight;
	}
	public String getKp(){ 
		return  kp;
	}
	public String getMothertongue(){ 
		return   mothertongue;
	}
	public String getPhysicalstatus(){ 
		return   physicalstatus;
	}
	public String getCaste(){
		return   caste;
	}
	public String getSubcaste() {
		return subcaste;
	}
	public String getGotram(){
		return   gotram;
	}
	public String getStar(){ 
		return   star;
	}
	public String getSunsign(){ 
		return   sunsign;
	}
	public String getKujadosham(){
		return   kujadosham;
	}
	public String getEatinghabits(){ 
		return   eatinghabits;
	}
	public String getEducation(){ 
		return   education;
	}
	public String getOccupation(){ 
		return   occupation;
	}
	public String getAnnualincome(){ 
		return   annualincome;
	}
	public String getCity(){ 
		return   city;
	}
	public String getState(){ 
		return   state;
	}
	public String getPhoneno(){ 
		return   phoneno;
	}
	public String getRegdby(){ 
		return   regdby;
	}
	public String getRefby(){ 
		return   refby;
	}
	public String getStatus(){ 
		return   status;
	}
	public String getNoofchildren(){ 
		return   noofchildren;
	}
	public String getChildrenlivingstatus(){
		return   childrenlivingstatus;
	}
	public String getReligion(){ 
		return   religion;
	}
	public String getCountry(){ 
		return   country;
	}
	public String getCitizenship(){ 
		return   citizenship;
	}
	public String getResident(){ 
		return   resident;
	}
	public String getEmployment(){ 
		return   employment;
	}
	public String getEmail(){ 
		return   email;
	}
	public String getPwd1(){
		return   pwd1;
	}
	public String getPwd2(){
		return   pwd2;
	}
	public String getTermsandconditions(){
		return   termsandconditions;
	}
}