(function() {
  var x = document.location + ''
  if (x.indexOf('github.com') > -1) {
    var t = document.title
    document.title = t + ' (GitHub)'
  }
})()

