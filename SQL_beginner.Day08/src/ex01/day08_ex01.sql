-- Session 1
 BEGINE;
 SHOW TRANSACTION ISOLATION LEVEL;

--Session 2
 BEGINE;
 SHOW TRANSACTION ISOLATION LEVEL;

--Session 1
 SELECT * from pizzeria where name  = 'Pizza Hut';

--Session 2
 SELECT * from pizzeria where name  = 'Pizza Hut';

--Session 1
 UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

--Session 2
 UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

--Session 1
 COMMIT;

--Session 2
 COMMIT;

--Session 1
 SELECT * from pizzeria where name  = 'Pizza Hut'; --rating = 3.6

--Session 2
 SELECT * from pizzeria where name  = 'Pizza Hut'; --rating = 3.6
