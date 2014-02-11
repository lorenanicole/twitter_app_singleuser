$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('#majical_unicorns').on("click", function(event) {
    event.preventDefault();
    $('#loading').show();
    $('#fetch input[type="text"]').prop('disabled', true);
    var url = $('#fetch').attr('action');
    var user = $('#fetch input[type="text"]').val();
    $.post(url, { username: user },function(response) {
      $('#fetch input[type="text"]').prop('disabled', false);
      $('#loading').css('display','none');
      $('#comments').empty();
      $('#comments').append(response);
    });
  });


   $('#lolo_tweet').on("click", function(event) {
    event.preventDefault();
    $('#loading').show();
    $('#tweet input[type="text"]').prop('disabled', true);
    var url = $('#tweet').attr('action');
    var tweet = $('#tweet input[type="text"]').val();
    $.post(url, { tweeting: tweet }, function(response) {
      $('#tweet input[type="text"]').prop('disabled', false);
      $('#loading').css('display','none');
      $('#response').empty();
      $('#response').append(response);
    });
  });
});
