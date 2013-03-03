class @ImagePreloader
  constructor: (options = {}) ->
    @loadedImageCount = 0
    @urls = options.urls || []
    @onImageLoadCallback = options.onImageLoad
    @onCompleteCallback = options.onComplete

  start: =>
    _this = @
    for imageUrl in @urls
      image = new Image()
      image.onabort = -> _this.onImageLoad(@.src)
      image.onerror = -> _this.onImageLoad(@.src)
      image.onload = -> _this.onImageLoad(@.src)
      image.src = imageUrl

  onImageLoad: (url) =>
    @loadedImageCount += 1
    details =
      url: url
      loadedImageCount: @loadedImageCount
      totalImageCount: @urls.length
    @onImageLoadCallback?(details)

    if @loadedImageCount >= @urls.length
      @onCompleteCallback?(@urls)
