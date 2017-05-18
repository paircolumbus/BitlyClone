# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
url_pattern = /^(http|https)?:\/\/[a-zA-Z0-9-\.]+\.[a-z]{2,4}/

$(document).ready ->
  $("#errors").hide()

$(document).on 'ready page:load', ->
  $('#new_url').submit ->
    url = $('#url_long_url').val()

    if url_pattern.test(url) == false
      $('#errors').show()
      event.preventDefault()
    return
  return
