a = prices: [
  {
    'Name': 'TataSteel'
    'MarketCap': '$320,800'
  }
  {
    'Name': 'Adani Powers'
    'MarketCap': '$170,750'
  }
  {
    'Name': 'Nestle'
    'MarketCap': '$86,000'
  }
  {
    'Name': 'ONGC'
    'MarketCap': '433,060'
  }
  {
    'Name': 'Wayne Enterprises'
    'MarketCap': '$162,700'
  }
]
$.each a.Cars, (key, value) ->
  $('#example').append $('<td></td>').val(value.carID).html(value.CarType)
  return
$('#example').change ->
  alert $(this).val()
  return