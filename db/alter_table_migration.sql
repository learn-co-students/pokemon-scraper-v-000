ALTER TABLE pokemon ADD COLUMN hp INTEGER;

UPDATE pokemon SET hp = 60 WHERE id between 1 and 10;
