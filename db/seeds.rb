#Create movies
first_movie = Movie.create title: 'MS Dhoni', release_date: '30/09/2016', ticket_fee: '150'.to_d
second_movie = Movie.create title: 'Pink', release_date: '16/09/2016', ticket_fee: '180'.to_d

#Create theaters
inox = Theater.create name: 'INOX'
pvr = Theater.create name: 'PVR'
cinepolis = Theater.create name: 'Cinepolis'

#Create Coupons
Coupon.create code: 'mb40', amount: '40'.to_d
Coupon.create code: 'mb60', amount: '60'.to_d

#Assigning/Screening movies in theaters
inox.movies << first_movie
inox.movies << second_movie

pvr.movies << first_movie
pvr.movies << second_movie

cinepolis.movies << first_movie
