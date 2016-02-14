$(document).ready(function(){
//call functions
});


function getEmotionData(){
  $(document).on('click', "#get_emotion", function(e){
    e.preventDefault();
    $.ajax({
        url: "https://api.projectoxford.ai/emotion/v1.0/recognize?" + $.param(params),
          beforeSend: function(xhrObj){
              // Request headers
              xhrObj.setRequestHeader("Content-Type","application/json");
              xhrObj.setRequestHeader("Ocp-Apim-Subscription-Key","{subscription key}");
          },
          type: "POST",
          // Request body
          data: "{body}",
      })
      .done(function(data) {
          alert("success");
      })
      .fail(function() {
          alert("error");
      });
    });
  })
}








  require 'net/http'

  uri = URI('https://api.projectoxford.ai/emotion/v1.0/recognize')
  uri.query = URI.encode_www_form({
      # Request parameters
      'faceRectangles' => '{string}'
  })

  request = Net::HTTP::Post.new(uri.request_uri)
  # Request headers
  request['Content-Type'] = 'application/json'
  # Request headers
  request['Ocp-Apim-Subscription-Key'] = '{subscription key}'
  # Request body
  request.body = "{body}"

  response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
  end

 // puts response.body
