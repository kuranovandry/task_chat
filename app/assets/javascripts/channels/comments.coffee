App.comments = App.cable.subscriptions.create "CommentsChannel",
  collection: -> $("[data-channel='comments']")

  connected: ->
    setTimeout =>
      @followCurrentWorker()
      @installPageChangeCallback()

  received: (data) ->
    @collection().append(data.comment)
    location.reload()


  followCurrentWorker: ->
    if workerId = @collection().data('worker-id')
      @perform 'follow', worker_id: workerId
    else
    @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.comments.followCurrentWorker()
