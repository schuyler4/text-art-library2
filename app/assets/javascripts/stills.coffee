# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  add_slide_btn = $('#addslide')

  add_slide_btn.on 'click', ->
    console.log("hello")
