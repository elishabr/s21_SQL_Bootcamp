-- DROP INDEX idx_person_name;
CREATE INDEX idx_person_name ON person(UPPER(name));
SET ENABLE_SEQSCAN = OFF;
EXPLAIN
    ANALYSE
SELECT * FROM person
WHERE UPPER(name) = 'KATE';