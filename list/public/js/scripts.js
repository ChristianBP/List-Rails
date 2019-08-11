$(document).ready(function() {
	borderwidth = $("[class*='borderwidth-']");
	classList = borderwidth.attr("class").split(' ').forEach(function(className) {
		if(className.startsWith("borderwidth-")) {
			width = className.replace("borderwidth-", "");
			borderwidth.css("cssText", borderwidth.css("cssText") + "border-width:" + width + "px !important;");
		}
	});
	
});