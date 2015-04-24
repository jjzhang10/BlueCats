# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

init=() ->
	c1=document.getElementById("internship_counseling_student")
	c1.onchange=f1
	c2=document.getElementById("internship_LPC_intern")
	c2.onchange=f2

f1=() ->
	c1=document.getElementById("internship_counseling_student")
	s=document.getElementById("counseling_student")
	if (c1.checked)
		s.setAttribute("class", "")
	else
		s.setAttribute("class", "hide")
		
f2=() ->
	c2=document.getElementById("internship_LPC_intern")
	s=document.getElementById("LPC_intern")
	if (c2.checked)
		s.setAttribute("class", "")
	else
		s.setAttribute("class", "hide")
	
window.onload = init
