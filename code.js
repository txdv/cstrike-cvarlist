
$.get('site.min.json')
.success(function(data) {
  var data = JSON.parse(data);
  var body = $('#data').find('tbody');
  for (var i = 0; i < data.length; i++) {
    var e = data[i];
    body.append($('<tr>')
      .append($('<td>').text(e.cvar))
      .append($('<td>').text(e.value.default))
      .append($('<td>').text(e.value.min))
      .append($('<td>').text(e.value.max))
      .append($('<td>').text(e.type))
      .append($('<td>').text(e.category))
      .append($('<td>').text(e.description))
    );
  }
  $('#info').text("successfully loaded");
})
.error(function(data) {
  $('#info').text("failed to load");
})
