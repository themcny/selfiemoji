// $(document).ready(function(){
// //call functions
// });
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
