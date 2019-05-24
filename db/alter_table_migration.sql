ALTER TABLE pokemon RENAME TO TempOldPokemon;
CREATE TABLE pokemon (id INTEGER PRIMARY KEY, name TEXT, type TEXT, hp INTEGER DEFAULT 60);
INSERT INTO pokemon (id, name, type) SELECT id, name, type FROM TempOldPokemon;
DROP TABLE TempOldPokemon;
