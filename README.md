Simple javascript class for preloading images.

### Usage

```javascript
var preloader = new ImagePreloader({
  urls: ['array', 'of', 'image', 'urls'], // URLs can be relative or absolute
  imageLoad: function(imageDetails) { ... },
  complete: function(imageUrls) { ... }, 
});
preloader.start();
```

The optional callbacks are:

#### `imageLoad`

Fired when an image finishes loading. Provides an `imageDetails` hash containing:

```javascript
{
  url: 'url-of-image',
  loadedCount: 2, // how many images have been loaded so far
  totalCount: 4 // total image count
}
```

#### `complete`

Fired when all images have finished loading. Provides an array of the image URLs.

### Credits

Loosely based off image preloader gist by eikes: [https://gist.github.com/eikes/3925183](https://gist.github.com/eikes/3925183)
