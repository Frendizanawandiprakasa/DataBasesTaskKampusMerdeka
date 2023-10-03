select 
film.title as Judul_Film,
sum (payment.amount) as total_pendapatan

from film 

join 
inventory   on inventory.film_id  = film.film_id

join 
rental on inventory.inventory_id = rental.inventory_id 

join 
payment on rental.rental_id = payment.rental_id 

group by film.title 

order by total_pendapatan desc ;


1C
select
f.film_id as Id,
f.title as Judul_Film,

f.rental_rate as Harga_Rental,
sum (p.amount) as Total_Pendapatan 

from film f

left join inventory i 
on f.film_id = i.film_id 
left join rental r 
on r.inventory_id = i.inventory_id 
left join payment p 
on r.rental_id =p.rental_id 

where p.amount is  not null 

group by f.film_id 
order by Total_Pendapatan desc 




--3B
SELECT COUNT(*) AS jumlah_pembatalan
FROM rental
WHERE rental_date >= '2005-05-24 22:54:33.000' AND rental_date <= '2006-02-16 02:30:53.000'
AND return_date IS NULL;


SELECT film.title AS judul_film, 
       SUM(film.rental_rate) AS pendapatan_sewa
FROM film
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY pendapatan_sewa DESC;

SELECT
    film.title AS judul_film,
    SUM(payment.amount) AS pendapatan_sewa
FROM
    film
JOIN
    inventory ON film.film_id = inventory.film_id
JOIN
    rental ON inventory.inventory_id = rental.inventory_id
JOIN
    payment ON rental.rental_id = payment.rental_id
GROUP BY
    film.title
ORDER BY
    pendapatan_sewa DESC;


select count(f.release_year
) 

from film f 

where f.release_year = 2006

SELECT
    film.title AS "Judul Film",
    COUNT(rental.rental_id) AS "Jumlah Peminjam"
FROM
    rental
JOIN
    inventory ON rental.inventory_id = inventory.inventory_id
JOIN
    film ON inventory.film_id = film.film_id
GROUP BY
    film.title
ORDER BY
    COUNT(rental.rental_id) DESC
LIMIT
    10;

SELECT
    city.city_id AS Id,
	city.city AS "Kota",
    SUM(payment.amount) AS "Total Pendapatan"
FROM
    rental
JOIN
    customer ON rental.customer_id = customer.customer_id
JOIN
    address ON customer.address_id = address.address_id
JOIN
    city ON address.city_id = city.city_id
JOIN
    payment ON rental.rental_id = payment.rental_id
GROUP BY
    city.city_id 
ORDER BY
    SUM(payment.amount) DESC
LIMIT
    5;

SELECT AVG( f.rental_duration)
FROM film f  ;


SELECT
    EXTRACT(YEAR FROM rental_date) AS "Tahun",
    EXTRACT(MONTH FROM rental_date) AS "Bulan",
    COUNT(*) AS "Jumlah Peminjaman"
FROM
    rental
GROUP BY
    EXTRACT(YEAR FROM rental_date),
    EXTRACT(MONTH FROM rental_date)
ORDER BY
    "Tahun",
    "Bulan";

select 
film.title ,
film.description 

from film

where film.description ilike '%drama%'


SELECT
    actor.actor_id,
    actor.first_name AS "Nama Depan",
    actor.last_name AS "Nama Belakang",
    COUNT(film_actor.film_id) AS "Jumlah Film"
FROM
    actor
JOIN
    film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY
    actor.actor_id
ORDER BY
    "Jumlah Film" DESC
LIMIT
    5;

SELECT
    customer.customer_id AS "Customer ID",
    customer.first_name AS "Nama Depan",
    customer.last_name AS "Nama Belakang",
    COUNT(rental.rental_id) AS "Rental Count",
    SUM(payment.amount) AS "Total Payment"
FROM
    customer
LEFT JOIN
    rental ON customer.customer_id = rental.customer_id
LEFT JOIN
    payment ON rental.rental_id = payment.rental_id
GROUP BY
    customer.customer_id
ORDER BY
    "Total Payment" DESC
LIMIT
    10;


SELECT
    film.film_id,
    film.title AS "Judul Film"
FROM
    film
LEFT JOIN
    inventory ON film.film_id = inventory.film_id
LEFT JOIN
    rental ON inventory.inventory_id = rental.inventory_id
WHERE
    rental.rental_id IS NULL;

SELECT
    category.name AS "Kategori Film",
    COUNT(rental.rental_id) AS "Total Peminjaman"
FROM
    rental
JOIN
    inventory ON rental.inventory_id = inventory.inventory_id
JOIN
    film_category ON inventory.film_id = film_category.film_id
JOIN
    category ON film_category.category_id = category.category_id
GROUP BY
    category.name
ORDER BY
    "Total Peminjaman" DESC
LIMIT
    5;
















