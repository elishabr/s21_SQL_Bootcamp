-- Session 1
 BEGINE;
 SHOW TRANSACTION ISOLATION LEVEL; -- read committed

--Session 2
 BEGINE;
 SHOW TRANSACTION ISOLATION LEVEL; -- read committed

--Session 1
 UPDATE pizzeria SET rating = 2 WHERE id = 1;

--Session 2
 UPDATE pizzeria SET rating = 3 WHERE id = 2;

--Session 1
 UPDATE pizzeria SET rating = 2 WHERE id = 2;

--Session 2
 UPDATE pizzeria SET rating = 3 WHERE id = 1;
    -- ОШИБКА:  обнаружена взаимоблокировка
    -- ПОДРОБНОСТИ:  Процесс 11608 ожидает в режиме ShareLock блокировку "транзакция 599"; заблокирован процессом 3188.
    -- Процесс 3188 ожидает в режиме ShareLock блокировку "транзакция 600"; заблокирован процессом 11608.
    -- ПОДСКАЗКА:  Подробности запроса смотрите в протоколе сервера.
    -- КОНТЕКСТ:  при изменении кортежа (0,15) в отношении "pizzeria"

--Session 1
 COMMIT;

--Session 2
 COMMIT;

