-- Session 1
 BEGINE;
 SHOW TRANSACTION ISOLATION LEVEL; -- read committed

--Session 2
 BEGINE;
 SHOW TRANSACTION ISOLATION LEVEL; -- read committed

--Session 1
 SELECT * from pizzeria where name  = 'Pizza Hut'; --rating = 4

--Session 2
 UPDATE pizzeria SET rating = 3.6 WHERE name  = 'Pizza Hut';
 COMMIT;

--Session 1
 SELECT * from pizzeria where name  = 'Pizza Hut'; --rating = 3.6

--Session 2
 SELECT * from pizzeria where name  = 'Pizza Hut'; --rating = 3.6

--Session 1
 COMMIT;
 SELECT * from pizzeria where name  = 'Pizza Hut'; --rating = 3.6