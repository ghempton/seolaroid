$ ->
  $('.replace').html('This is some dynamic content')

  loadDynamic = ->
    $('body').load('/dynamic.html')

  $(window).bind 'popstate', (e) ->
    console.log window.location.pathname
    return unless window.location.pathname == '/dynamic'
    loadDynamic()

  $('a.dynamic').click (e) ->
    loadDynamic()
    window.history.pushState('dynamic', null, 'dynamic');
    e.preventDefault()
    false