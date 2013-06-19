# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



$( ()->

  get_notes = (editable = true, data = {})->
    $.ajax(
      url: '/notes.json',
      data: data,
      success: (d)->
        $('#todo-list').html('')
        $.each(d, (i, note)->
          note.editable = true
          $('#todo-list').prepend(HandlebarsTemplates['todos/todo'](note))
        )
        $('[data-done="done"]').addClass('done')
    )

  if $('#todo-list').length == 1
    get_notes()

    $('#public').click( ()->
      get_notes(false, {filter: 'all'})
    )
    $('#private').click( ()->
      get_notes()
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

  $('#todo-list').on('click','input[type="checkbox"]', ()->
    done = !!this.checked
    item = $(this).parents('.note')
    $.ajax(
      method: 'PUT',
      url: "/notes/#{item.data('id')}",
      data: {note: {done:  done  }  },
      success: ()=>
        if done
          item.addClass('done')
        else
          item.removeClass('done')
        console.info('foo')
    )

  )
)