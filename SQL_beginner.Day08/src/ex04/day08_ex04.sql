-- Session 1
 BEGINE;
 SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
 SHOW TRANSACTION ISOLATION LEVEL; -- SERIALIZABLE

--Session 2
 BEGINE;
 SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
 SHOW TRANSACTION ISOLATION LEVEL; -- SERIALIZABLE

--Session 1
 SELECT * from pizzeria where name  = 'Pizza Hut'; --rating = 3.6

--Session 2
 UPDATE pizzeria SET rating = 3 WHERE name  = 'Pizza Hut';
 COMMIT;

--Session 1
 SELECT * from pizzeria where name  = 'Pizza Hut'; --rating = 3.6
 COMMIT;
 SELECT * from pizzeria where name  = 'Pizza Hut'; --rating = 3

--Session 2
 SELECT * from pizzeria where name  = 'Pizza Hut'; --rating = 3