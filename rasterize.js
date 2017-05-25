var WebPage = require('webpage');
var system = require('system');
var url = system.args[1];

page = WebPage.create();
page.viewportSize = { width: 1366, height: 768 };
page.open(url);

var hasReceivedStatusCode = false;

page.onResourceReceived = function (res) {
  if (!hasReceivedStatusCode && res.stage === 'end') {
      console.log(res.status);
      hasReceivedStatusCode = true;
  }
};

page.onLoadFinished = function () {
    setTimeout(function () {
        page.render('results/' + url.replace(/[:/]/g, '-').replace() + '.png');
        phantom.exit();
    }, 1000);
}

page.onError = function (msg, trace) {
    //silence
};