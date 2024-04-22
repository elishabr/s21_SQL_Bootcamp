-- Session 1
 BEGINE;
 SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
 SHOW TRANSACTION ISOLATION LEVEL; -- REPEATABLE READ

--Session 2
 BEGINE;
 SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
 SHOW TRANSACTION ISOLATION LEVEL; -- REPEATABLE READ

--Session 1
 SELECT SUM(rating) FROM pizzeria; -- sum =  19.9

--Session 2
 UPDATE pizzeria SET rating = 5 WHERE name  = 'Pizza Hut';
 COMMIT;

--Session 1
 SELECT SUM(rating) FROM pizzeria; -- sum =  19.9
 COMMIT;
 SELECT * from pizzeria where name  = 'Pizza Hut'; --sum = 23.9

--Session 2
 SELECT * from pizzeria where name  = 'Pizza Hut'; --sum = 23.9