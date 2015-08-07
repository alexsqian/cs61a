create table parents as
  select "abraham" as parent, "barack" as child union
  select "abraham"          , "clinton"         union
  select "delano"           , "herbert"         union
  select "fillmore"         , "abraham"         union
  select "fillmore"         , "delano"          union
  select "fillmore"         , "grover"          union
  select "eisenhower"       , "fillmore";

create table dogs as
  select "abraham" as name, "long" as fur, 26 as height union
  select "barack"         , "short"      , 52           union
  select "clinton"        , "long"       , 47           union
  select "delano"         , "long"       , 46           union
  select "eisenhower"     , "short"      , 35           union
  select "fillmore"       , "curly"      , 32           union
  select "grover"         , "short"      , 28           union
  select "herbert"        , "curly"      , 31;

create table sizes as
  select "toy" as size, 24 as min, 28 as max union
  select "mini",        28,        35        union
  select "medium",      35,        45        union
  select "standard",    45,        60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
create table size_of_dogs as
select name, size from dogs, sizes where min < height and max >= height;


-- All dogs with parents ordered by decreasing height of their parent
create table by_height as
select name from dogs, parents where name = child order by -height;


-- Sentences about siblings that are the same size
create table sentences as
  with 
    siblings(name1, name2, size) as (
      select a.name, b.name, a.size from size_of_dogs as a, size_of_dogs as b, parents as c, parents as d
      where a.name < b.name and a.size = b.size and a.name = c.child and b.name = d.child and c.parent = d.parent
    )
select name1 || ' and ' || name2 || ' are ' || size || ' siblings' from siblings;


-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
create table stacks as
  with
    stackers(dogs, totalheight, numb, lastdogheight) as (
      select e.name, e.height, 1, e.height from dogs as e union
      select dogs || ', ' || f.name, totalheight+f.height, numb+1, f.height
      from stackers as s, dogs as f
      where lastdogheight < f.height and numb < 4
    )
select dogs, totalheight from stackers where totalheight >= 170;


create table tallest as
select max(height), name from dogs group by height/10 having count(*) >1;


-- All non-parent relations ordered by height difference
create table non_parents as
select "REPLACE THIS LINE WITH YOUR SOLUTION";