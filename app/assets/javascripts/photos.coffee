# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  $('.photo-unlike').on "ajax:success", (event, data) ->
    target = $(this)
    target.addClass('hide')
    target.siblings('.photo-like').removeClass('hide')
    target.siblings('.likes-count').text(data.likes)

  $('.photo-like').on "ajax:success", (event, data) ->
    target = $(this)
    target.addClass('hide')
    target.siblings('.photo-unlike').removeClass('hide')
    target.siblings('.likes-count').text(data.likes)
