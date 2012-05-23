$(document).ready(function() {
	$('a[rel="popover"]').popover();
	$('#vehicle-toggle button').on('click', function() {
		$('.vehicle-group').hide();
		target = $(this).attr('data-target');
		$('#' + target).show();
	});
});