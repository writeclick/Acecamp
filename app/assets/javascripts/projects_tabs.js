$(function () {
	$( '#projects_tabs a:first').tab('show');
})

// $('#projects_tabs').on("click", "a", function(e){
//   e.preventDefault();
//   $(this).tab('show');
// });

$('a[data-toggle="tab"]').on('shown', function(e) {
	e.target
	e.relatedTarget
});