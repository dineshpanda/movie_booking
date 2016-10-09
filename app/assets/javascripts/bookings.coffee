# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready =
  $(document).on 'click','#apply_coupon', (e)->
    e.preventDefault()
    movie = $('#booking_movie_id').val()
    coupon = $('#booking_coupon_code').val()
    if(coupon)  
      $.ajax
        url: '/bookings/validate_coupon.js'
        data:
          movie_id: movie 
          coupon_code: coupon
    else
      alert 'Enter a coupon code'
            

$(document).ready ready
$(document).on 'page:load', ready
