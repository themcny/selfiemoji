$(document).ready(function(){
//call functions
  emojify();
  takeAnother();
});

function emojify(){
  $(document).on('click', "#emojify", function(e){
    e.preventDefault();
    var imgSrc = $(this).parent().next().attr('src')
    $.ajax({
      url: '/pictures/get_emotion',
      type: 'POST',
      data: {image: imgSrc}
    }).done(function(response){
      console.log("success!!!!! :$")
      $('#latest-picture-container').children().remove();
      $('#latest-picture-container').append('<img src="new.png">');
      $('#latest-picture-container').append('<button id="take-another">Take another</button>')
    })
  })
}

function takeAnother(){
  $(document).on('click', "#take-another", function(e){
    e.preventDefault();
    $("#latest-picture-container").addClass('hidden');
    $("#camera-container").removeClass('hidden');
  })
}