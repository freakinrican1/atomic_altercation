$(document).ready(function(){
  
  $("#p1_name_error").hide();
  $("#p2_name_error").hide();

 //  $("#container").on("click", function(){
//     $("#p1_name").hide();
//     $("#p2_name").hide();
//    $("#p1_name_error").show();
//    $("#p2_name_error").show();
// });

  
  
  $("#start_game").find("input").on("change", function(){
     // By default, let the form be valid.
     var valid_form = true;

     var player1Name = $("#p1_name").val();
     var player2Name = $("#p2_name").val();
     if (player1Name === "" || player2Name === "" ){
       // $("#p_name").next().show();
       valid_form = false;
     };

     if (valid_form === false){
       $("#submit_button").prop("disabled", true)
     }
     
     else {
       $("#submit_button").prop("disabled", false);
     };

   });
 
});