// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require ckeditor/init
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

function pageIndex(length, listID, pageID){

    this.max_element = length - 1;
   	this.iterator_start = 0;
    this.page_number = 1;
    this.listID = listID;
    this.pageID = pageID;

    this.increment = function(){
        if (this.iterator_start + 10 <= this.max_element) {
            this.iterator_start += 10;
            this.page_number += 1;
        }

        this.hide_divs()
    }

    this.decrement = function(){
        if (this.iterator_start - 10 >= 0) {
            this.iterator_start -= 10;
            this.page_number -= 1;
        }

        this.hide_divs()
    }

    this.hide_divs = function(){
        document.getElementById(this.pageID).innerHTML = this.page_number
        var Posts = document.getElementById(this.listID).childNodes;

        //Hide the divs of the Posts
        for (i=0; i<Posts.length; i++){
          if (i > this.iterator_start*2 && i < this.iterator_start + 21) {
            Posts[i].className = ""
          } else {
            Posts[i].className = "hidden_class";
          }
        }
    }

    this.initialize = function(postClass, postID){

    	this.hide_divs()

        $(postClass).click(function(){
          var Posts = document.getElementById(postID).childNodes;

          //Initialize the click
          for(i=0; i<Posts.length; i++){
            if (Posts[i].dataset){
              if (Posts[i].dataset.id == $(this).attr('data-id')){
                Posts[i].className = "selected";
              }
              else{
                Posts[i].className = "hidden_class";
              }
            }
          }
        })
    }

}