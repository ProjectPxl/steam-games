define([
  'jquery',
  'underscore',
  'backbone'
],
function($, _, Backbone) {

  var GameListView = Backbone.View.extend({
    
    initialize: function(){
      $.getJSON( "http://0.0.0.0:3000/giveaways/new", function( data ) {
        console.log(data)
      });
    }

  });


  return GameListView;

});
