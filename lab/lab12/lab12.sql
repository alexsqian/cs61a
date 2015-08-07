-- Requires the contents of file states.sql to be loaded first.
.read states.sql

-- Tables in states.sql:
--   states(state):       US States + DC - HI - AK
--   landlocked(state):   Table of landlocked (not adjacent to ocean) states
--   adjacencies(s1, s2): States that are adjacent to each other

create table california as
  select * from adjacencies where s1 = "CA";

-- Finds lengths of possible paths between two states
create table distances as
  with
    distance(start, end, hops) as (
      select state, state, 0 from states union
      select start, s1, hops + 1 from distance, adjacencies, states where end = s2 and s1 = state and hops <15
    )
  select * from distance;

create table three_hops as
  select s1 as start, s2 as end from adjacencies union
  select start.s1 as start, end.s2 as end, hops + 1 from adjacencies as start, adjacencies as end, states where start.s2 = start and end.s1 = end;
