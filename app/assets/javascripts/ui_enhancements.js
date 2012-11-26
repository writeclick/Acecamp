$(function () {
	$( '#projects-tabs a:first').tab('show');
//===================== sortable tasks ===================
	var tasklist_count = $(".sortable-tasks").length;
	for(var i=1; i < tasklist_count; i++) {
		$( "#sortable" + i ).sortable();
	    $( "#sortable" + i ).disableSelection();

	};

	$(function() {
        $( "[id^=sortable]" ).sortable({
            connectWith: ".connectedSortable"
        }).disableSelection();
    });

//==================== sortable tasklists ===============
	var list_count = $(".sortable-lists").length;
	for(var j=1; j < list_count; j++) {
		$( "#sortable-list" + j ).sortable();
	    $( "#sortable-list" + j ).disableSelection();
	};

	$(function() {
        $( "[id^=sortable-list]" ).sortable({
            connectWith: ".connectedSortableList"
        }).disableSelection();
    });


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
