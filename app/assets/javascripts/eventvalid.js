function validateEventForm() {

	$('#event_form').validate({
		debug: true,
		rules: {
			"event[event_name]": {
				required: true,
				maxlength: 30
				},
			"event[venue]": {
				required: true,
				maxlength: 30
			},
			"event[date]": {
				required: true
			},
			"event[description]": {
				required: true
			},
			"event[time]": {
				required: true
			}
		},


		errorElement: "span",
		errorClass: "help-block",
		messages: {
			"event[event_name]": {
				required: "Event name can't be blank.",
				maxlength: "Limit exceeded"		
			},
			"event[venue]": {
				required: "Venue can't be blank.",
				maxlength: "Limit exceeded"
			},
			"event[date]": {
				required: "Date can't be blank."
			},
			"event[description]": {
				required: "Description can't be blank."
			},
			"event[time]": {
				required: "Time can't be blank."
			}
		},
		highlight: function(element) {
			$(element).parent().parent().addClass("has-error");
		},
		unhighlight: function(element) {
			$(element).parent().parent().removeClass("has-error");
		},
		invalidHandler: function(event, validator) {

// 'this' refers to the form
var errors = validator.numberOfInvalids();
if (errors) {
// Populating error message
var errorMessage = errors == 1
? 'You missed 1 field. It has been highlighted'
: 'You missed ' + errors + ' fields. They have been highlighted';
// Removing the form error if it already exists
$("#div_user_js_validation_error").remove();
errorHtml = "<div id='div_user_js_validation_error' class=\"alert alert-danger\" data-alert=\"alert\" style=\"margin-bottom:5px;\">"+ errorMessage +"</div>"
$("#div_modal_generic div.modal-body-main").prepend(errorHtml);
// Show error labels
$("div.error").show();
} else {
// Hide error labels
$("div.error").hide();
// Removing the error message
$("#div_user_js_validation_error").remove();
}
},


submitHandler: function(form) {
	form.submit();
}
});
}