# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  playing = false

  playSlides = ->
    playing = true
    slides = []
    $("ul li").each ->
      slides.push($(this).text())

    setInterval () ->
      show.text(slides[counter])
      counter += 1

      if counter == slides.length + 1
        show.text(slides[0])
        playing = false

    , 500

    show = $('#show')
    counter = 0


  play = $('#play')

  play.click ->
    if !playing
      playSlides()
