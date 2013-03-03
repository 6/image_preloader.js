Simple javascript class for preloading images.

### Usage

```javascript
var preloader = new ImagePreloader({
  urls: ['array', 'of', 'image', 'urls'],
  imageLoad: function(details) { ... },
  complete: function(images) { ... }, 
});
```

### Credits

Loosely based off image preloader gist by eikes: [https://gist.github.com/eikes/3925183](https://gist.github.com/eikes/3925183)
