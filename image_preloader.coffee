class @ImagePreloader
  constructor: (options = {}) ->
    @loadedCount = 0
    {@urls, @imageLoad, @complete} = options

  start: =>
    _this = @
    for imageUrl in (@urls || [])
      image = new Image()
      image.onabort = -> _this.onImageLoad(@)
      image.onerror = -> _this.onImageLoad(@)
      image.onload = -> _this.onImageLoad(@)
      image.src = imageUrl

  onImageLoad: (image) =>
    @loadedCount += 1
    details =
      url: image.src
      loadedCount: @loadedCount
      totalCount: @urls.length
    @imageLoad?(details)

    if @loadedCount >= @urls.length
      @complete?(@urls)
