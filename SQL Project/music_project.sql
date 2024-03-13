Q1: Who is the senior most employee based on job title?

Select * from employee
order by levels Desc
limit 1

Q2:Which countries have the most Invoices?

select count(*) as c,billing_country 
from invoice group by billing_country 
order by c Desc

Q3: What are top 3 values of total invoice?

select total from invoice order by total Desc limit 3

Q4: Which city has the best customers? Want to throw a promotional Music Festival in the city we made the most money. 
	Write a query that returns one city that has the highest sum of invoice totals.
	Return both the city_name and sum of all invoice totals.

	select billing_city, SUM(total) as invoice_total 
	from invoice group By billing_city 
	order by invoice_total Desc limit 1

Q5. Who is the best customer? Find the person who has spent the most money.

select customer.customer_id,customer.first_name, customer.last_name, sum(invoice.total) as total
from customer JOIN invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id
order by total Desc limit 

select customer.first_name, customer.last_name, sum(invoice.total) as total
from customer, invoice
where customer.customer_id=invoice.customer_id
group by customer.customer_id
order by total Desc limit 1

Question SET 2

Q1:return email,first name, last name, & genre of all rock music listeners. 
	Return your list ordered alphebetically by email.

	select distinct email,first_name,last_name
	from customer 
	join invoice on customer.customer_id=invoice.customer_id
    join invoice_line on invoice.invoice_id=invoice_line.invoice_id
	where track_id IN(select track_id from track
						join genre on track.genre_id=genre.genre_id
						where genre.name like 'Rock'
	) order by email;


	
	select distinct customer.email,customer.first_name,customer.last_name,genre.name 
	from customer join invoice on customer.customer_id=invoice.customer_id
    join invoice_line on invoice.invoice_id=invoice_line.invoice_id
    join track on invoice_line.track_id=track.track_id
    join genre on track.genre_id=genre.genre_id
	where genre.name like 'Rock'
	order by customer.email

Q2. Invite the artist who has written most rock music in our dataset. Return the artist name
and total track count of the top 10 rock bands.

	select artist.artist_id, artist.name,count(artist.artist_id) as number_of_songs
	from genre join track on genre.genre_id=track.genre_id
	join  album on track.album_id=album.album_id
	join artist on album.artist_id=artist.artist_id
	where genre.name like 'Rock'
	group by artist.artist_id
	order by number_of_songs Desc
	limit 10

Q3:Return all the track names that have a song length longer than the average song length.
	Return the Name and milliseconds for each track.
	Order by the song length with the longest songs listed first.

	select name, milliseconds from track
	where milliseconds>(select avg(milliseconds) from track)
	order by milliseconds Desc


	
	

 


