
$.get('site.min.json')
.success(function(data) {
  json = JSON.parse(data);
  var body = $('#data').find('tbody');
  for (var i = 0; i < json.length; i++) {
    var e = json[i];
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
