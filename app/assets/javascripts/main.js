/*
  Bootstrap the application
*/

console.log('hi')
require(['jquery', 'backbone', 'page'], function($, Backbone, PageView) {

  var page = new PageView({el: $('body')});

});

console.log('yo')