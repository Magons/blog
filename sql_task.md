create temp table users(id bigserial, group_id bigint);
insert into users(group_id) values (1), (1), (1), (2), (1), (3);
В этой таблице, упорядоченой по ID необходимо:
  1. выделить непрерывные группы по group_id с учетом указанного порядка записей (их 4)

  select group_id, count(*)
  from (select USERS.*,
               (row_number() over (order by id) -
                row_number() over (partition by group_id order by id)
               ) as grp
        from USERS
       ) USERS
  group by grp, group_id;

  2. подсчитать количество записей в каждой группе

  SELECT COUNT (*) AS count_all, group_id AS group_id FROM USERS GROUP BY group_id;

  3. вычислить минимальный ID записи в группе

  SELECT MIN(id) AS min, group_id AS group_id FROM USERS GROUP BY group_id;
