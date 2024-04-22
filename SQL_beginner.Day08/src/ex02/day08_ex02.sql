-- Session 1
 BEGINE;
 SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
 SHOW TRANSACTION ISOLATION LEVEL; -- repeatable read

--Session 2
 BEGINE;
 SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
 SHOW TRANSACTION ISOLATION LEVEL; -- repeatable read

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
 --ОШИБКА:  не удалось сериализовать доступ из-за параллельного изменения
 COMMIT; --ROLLBACK

--Session 1
 SELECT * from pizzeria where name  = 'Pizza Hut'; --rating = 4

--Session 2
 SELECT * from pizzeria where name  = 'Pizza Hut'; --rating = 4