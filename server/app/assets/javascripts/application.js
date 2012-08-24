// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
	$("div#tabs").tabs();
	$('#add-row').click(function() {
		return !$('#select1 option:selected').remove().appendTo('#select2');
	});
	$('#remove-row').click(function() {
		return !$('#select2 option:selected').remove().appendTo('#select1');
	});
});
$(document).ready(function() {

	$('#nav li').hover(function() {
		//show its submenu
		$('ul', this).slideDown(100);

	}, function() {
		//hide its submenu
		$('ul', this).slideUp(100);
	});


});
