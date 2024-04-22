-- Session 1
 BEGINE;
 SHOW TRANSACTION ISOLATION LEVEL; -- read committed

--Session 2
 BEGINE;
 SHOW TRANSACTION ISOLATION LEVEL; -- read committed

--Session 1
 SELECT SUM(rating) FROM pizzeria; -- sum =  21.9

--Session 2
 UPDATE pizzeria SET rating = 1 WHERE name  = 'Pizza Hut';
 COMMIT;

--Session 1
 SELECT SUM(rating) FROM pizzeria; -- sum =  19.9
 COMMIT;
 SELECT * from pizzeria where name  = 'Pizza Hut'; --sum = 19.9

--Session 2
 SELECT * from pizzeria where name  = 'Pizza Hut'; --sum = 19.9