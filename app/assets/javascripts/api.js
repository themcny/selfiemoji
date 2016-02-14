$(document).ready(function(){
//call functions
  // hideCamera();
});
function hideCamera(){
  $(document).on("click", "#shoot-button", function(e){
    $('#camera-container').addClass('hidden');
    $.ajax({
      url: "/pictures/last_picture",
      type: "GET"
    })
    .done(function(response) {
      $('#latest-picture-container').append(
        "<img src=headshots/" + response.photo + ">"
      )
    })
    .fail(function() {
      console.log("Failure")
    })
    $('#latest-picture-container').removeClass('hidden');
  })
}

//
//
// function getEmotionData(){
//   $(document).on('click', "#get_emotion", function(e){
//     e.preventDefault();
//     $.ajax({
//         url: "https://api.projectoxford.ai/emotion/v1.0/recognize?" + $.param(params),
//           beforeSend: function(xhrObj){
//               // Request headers
//               xhrObj.setRequestHeader("Content-Type","application/json");
//               xhrObj.setRequestHeader("Ocp-Apim-Subscription-Key","{subscription key}");
//           },
//           type: "POST",
//           // Request body
//           data: "{body}",
//       })
//       .done(function(data) {
//           alert("success");
//       })
//       .fail(function() {
//           alert("error");
//       });
//     });
//   })
// }
