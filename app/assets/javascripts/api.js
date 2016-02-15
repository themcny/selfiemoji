$(document).ready(function(){
//call functions
  emojify();
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
    })
  })
}
