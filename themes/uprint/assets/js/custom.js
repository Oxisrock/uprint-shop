/*
 * Custom code goes here.
 * A template should always ship with an empty custom.js
 */
$('#add_cart_custom').click(function() {
    $('button.add-to-cart').click();
    console.log('dio click');
});
$('#desing_yes').click(function() {
        $('.product-customization').hide('slow');
});
$('#desing_no').click(function() {
        $('.product-customization').show('slow');
});