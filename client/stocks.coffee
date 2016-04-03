Template.stocks.events 'click button#add': (event, template) ->
  text = $('#input_stock').val()
  template.$('#list')
          .append '<span class="checkbox-fa"><label class="checkbox"><input type="checkbox">'+ text
  document.getElementById('input_stock').value = '' 


Template.stocks.events 'click button#delete': (event,template)->
  template.$('#list').toggle()


Template.stocks.events 'click button#remove': (event,template) ->
  template.$(".checkbox input:checked")
          .parent()
          .remove();