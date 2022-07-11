-- Task 1(two ways)
select c.name, count(fc.film_id)
from film
         join film_category fc on film.film_id = fc.film_id
         join category c on c.category_id = fc.category_id
group by 1
order by 2 desc;

select name, count(*)
from film_category
         join category c on c.category_id = film_category.category_id
group by 1;

-- Task 2
select concat(first_name, ' ', last_name), count(rental_id)
from rental
         join inventory i on rental.inventory_id = i.inventory_id
         join film_actor fa on i.film_id = fa.film_id
         join actor a on fa.actor_id = a.actor_id
group by 1
order by 2 desc
limit 10;

-- Task 3
select name, sum(amount)
from category
         join film_category fc on category.category_id = fc.category_id
         join inventory i on fc.film_id = i.film_id
         join rental r on i.inventory_id = r.inventory_id
         join payment p on r.rental_id = p.rental_id
group by 1
order by 2 desc
limit 1;

-- Task 4
select film.title, film.film_id
from film
         full outer join (select distinct inventory.film_id from inventory) inv on film.film_id = inv.film_id
where inv.film_id IS NULL;


-- Task 5
select concat(first_name, ' ', last_name) as names, count(fc.film_id)
from category
         join film_category fc on category.category_id = fc.category_id
         join film_actor fa on fc.film_id = fa.film_id
         join actor a on fa.actor_id = a.actor_id
where name = 'Children'
group by 1
order by 2 desc
limit 3;

-- Task 6
select country,
       sum(case when active = '1' then 1 else 0 end) as active,
       sum(case when active = '0' then 1 else 0 end) as inactive
from customer
         join address a on customer.address_id = a.address_id
         join city c on c.city_id = a.city_id
         join country c2 on c2.country_id = c.country_id
group by 1
order by inactive desc;

-- Task 7
select name, city, sum(rental_duration) as hours
from rental
         join inventory i on i.inventory_id = rental.inventory_id
         join film f on f.film_id = i.film_id
         join customer c on rental.customer_id = c.customer_id
         join film_category fc on f.film_id = fc.film_id
         join category c2 on fc.category_id = c2.category_id
         join address a on c.address_id = a.address_id
         join city c3 on c3.city_id = a.city_id
where city like 'a%'
  and city like '%-%'
group by 1, 2
order by 3 desc
limit 1






