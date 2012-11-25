$(function () {
	$( '#projects-tabs a:first').tab('show');
})

$('a[data-toggle="tab"]').on('shown', function(e) {
	e.target;
	e.relatedTarget;
});

//===================== accordion for projects ===============

$('#accordion-projects').on('click', 'a', function(e){
		$(this).collapse('show');
		$('.accordion-body').collapse('hide');
});