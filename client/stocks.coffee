Template.stocks.events 'click button#add': (event, template) ->
  text = $('#input_stock').val()
  template.$('#list').append '<li class="list-group-item">' + text + '</li>'
  document.getElementById('input_stock').value = '' 


Template.stocks.events 'click button#delete': (event,template)->
  template.$('#list').toggle()


Template.stocks.events 'click button#remove': (event,template) ->
  template.$('li').remove()