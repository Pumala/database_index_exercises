#############################
# Optimize Lookup Time
#############################

# Write a query to find the restaurant with the name 'Nienow, Kiehn and DuBuque'. Run the query and record the query run time.
explain select * from restaurant where name = 'Nienow, Kiehn and DuBuque';

# Create an index for the restaurant's name column. This may take a few minutes to run.
create index on restaurant (name);

#############################
# Optimize Sort time
#############################

# Write a query to find the top 10 reviewers based on karma. Run it and record the query run time.
select name, karma from reviewer order by karma desc limit 10;

# Create an index on a column (which column?) to make the above query faster.
create index on reviewer (karma);

#############################
# Optimize Join Time
#############################

# Write a query to list the restaurant reviews for 'Nienow, Kiehn and DuBuque'. Run and record the query run time.
select * from review inner join restaurant on review.restaurant_id = restaurant.id where restaurant.name = 'Nienow, Kiehn and DuBuque';

# Write a query to find the average star rating for 'Nienow, Kiehn and DuBuque'. Run and record the query run time.
explain select restaurant.name, avg(stars) from review inner join restaurant on review.restaurant_id = restaurant.id where restaurant.name = 'Nienow, Kiehn and DuBuque' group by restaurant.name;

# Create an index for the foreign key used in the join to make the above queries faster.
create index on review (restaurant_id);

#############################
# Bonus: Optimize Join Time 2
#############################

# Write a query to list the names of the reviewers who have reviewed 'Nienow, Kiehn and DuBuque'. Note the query run time and save the query plan.
select restaurant.name as restaurant, reviewer.name as reviewer from reviewer inner join review on reviewer.id = review.reviewer_id inner join restaurant on restaurant.id = review.restaurant_id where restaurant.name = 'Nienow, Kiehn and DuBuque';

# Write a query to find the average karma of the reviewers who have reviewed 'Nienow, Kiehn and DuBuque'. Note the query run time and save the query plan.
explain select restaurant.name, avg(karma) from reviewer inner join review on reviewer.id = review.reviewer_id inner join restaurant on restaurant.id = review.restaurant_id where restaurant.name = 'Nienow, Kiehn and DuBuque' group by restaurant.name;
