# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  input = $('#artArea')
  output = $('#seen')

  input.keyup (e) ->
    console.log(input.val())
    output.text(input.val())

  playing = false

  playSlides = ->
    show = $('#show')
    counter = 0

    slides = []
    $("ul li").each ->
      slides.push($(this).text())

    setInterval () ->
      show.text(slides[counter])
      counter += 1
    , 500

    playing = true

    if counter == slides.length
      show.text(slides[0])
      playing = false


  playButton = $('#playButton')
  playButton.click ->
    playSlides()
