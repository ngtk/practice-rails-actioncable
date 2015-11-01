$ ->
  $('[data-channel="document"]').on 'keyup', ->
    $(this).closest('form').submit()
