App.document = App.cable.subscriptions.create "DocumentChannel",
  content: -> $("[data-channel='document']")

  connected: ->
    setTimeout =>
      @follow()
      @installPageChangeCallback()
    , 1000

  received: (data) ->
    @content().val(data.content) unless @userIsCurrentUser(data.modified_user_id)

  userIsCurrentUser: (modified_user_id) ->
    modified_user_id is parseInt($('meta[name=current-user]').attr('id'))
  follow: ->
    documentId = @content().data('document-id')
    @perform 'follow', document_id: documentId

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.document.follow()
