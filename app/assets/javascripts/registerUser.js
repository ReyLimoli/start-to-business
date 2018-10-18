$( document ).on('turbolinks:load', function() {
  $("#user_user_type_investor").click(function(){
    $("div.user_amount_available_to_invest").show();
    $("#new_user .form-inputs").show();
  });

  $("#user_user_type_idealizer").click(function(){
    $("div.user_amount_available_to_invest").hide();
    $("#new_user .form-inputs").show();
  });

  if($("#user_user_type_idealizer").attr('checked') || $("#user_user_type_investor").attr('checked')){
    $("#new_user .form-inputs").show();
  }

  if($("#user_user_type_idealizer").attr('checked')){
    $("div.user_amount_available_to_invest").hide();
  }
});
