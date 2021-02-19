function toggle_sidebar() {
  if ($("#teal_secondary_col").css("display") == "none") {
    $("#teal_primary_col").attr("class", "col-sm-9").resize();
    $("#teal_secondary_col").delay(600).fadeIn(50);
  } else {
    $("#teal_secondary_col").fadeOut(1);
    $("#teal_primary_col").attr("class", "col-sm-12").resize();
  }
}