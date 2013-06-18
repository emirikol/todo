# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



$( ()->
  if $('#todo-list').length == 1
    $.ajax(
      url: '/notes.json',
      success: (d)->
        $.each(d, (i, note)->
          $('#todo-list').prepend(HandlebarsTemplates['todos/todo'](note))
        )

    )

  $('#new_note').submit( (e)->
    foo = new FormData(this)
    $.ajax(
      url: '/notes',
      method: 'POST',
      data: foo,
      processData: false,
      contentType: false,
      success: (d)->
        $('#todo-list').prepend(HandlebarsTemplates['todos/todo'](d))
      error: (d)->
        console.info(d)
    )
    e.preventDefault()
  )
)