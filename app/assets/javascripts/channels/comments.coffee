App.comments = App.cable.subscriptions.create "CommentsChannel",
  collection: -> $("[data-channel='comments']")

  connected: ->
    setTimeout =>
      @followCurrentWorker()
      @installPageChangeCallback()

  received: (data) ->
    @collection().append(data.comment) unless @userIsCurrentUser(data.comment)

  userIsCurrentUser: (comment) ->
    $(comment).attr('data-user-id') is $('meta[name=current-user]').attr('id')

  followCurrentWorker: ->
    tinysort('section#comments>div>article', {attr:'data-created-at', order:'desc'});
    tinysort('section#comments>div>article', {attr:'data-possition', order:'desc'});
    if workerId = @collection().data('worker-id')
      @perform 'follow', worker_id: workerId
    else
    @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.comments.followCurrentWorker()
