// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( document ).on('turbolinks:load', function() {
//----- OPEN
  $('[data-popup-open]').on('click', function(e)  {
      e.preventDefault();
      var targeted_popup_class = jQuery(this).attr('data-popup-open');
      $('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
    });
//----- CLOSE
  $('[data-popup-close]').on('click', function(e)  {
    e.preventDefault();
      var targeted_popup_class = jQuery(this).attr('data-popup-close');
      $('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
    });

    $(".dropdown-content span").on("click", function(){
      let price = this.dataset.price;
      $("#pay-in-price").html(price)
    })
    $(".dropdown-content2 span").on("click", function(){
      let price = this.dataset.price;
      $("#size").html(price)
    })
    $(".QRpay ").on("click", function(){

      $(".QRcode").fadeIn()
    })
});
