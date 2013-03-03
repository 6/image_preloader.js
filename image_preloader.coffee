class @ImagePreloader
  constructor: (options = {}) ->
    @loadedCount = 0
    {@urls, @imageLoad, @complete} = options

  start: =>
    _this = @
    for imageUrl in (@urls || [])
      image = new Image()
      image.onabort = -> _this.onImageLoad(@.src)
      image.onerror = -> _this.onImageLoad(@.src)
      image.onload = -> _this.onImageLoad(@.src)
      image.src = imageUrl

  onImageLoad: (url) =>
    @loadedCount += 1
    details =
      url: url
      loadedCount: @loadedCount
      totalCount: @urls.length
    @imageLoad?(details)

    if @loadedCount >= @urls.length
      @complete?(@urls)
