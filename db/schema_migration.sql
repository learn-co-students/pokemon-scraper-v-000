


-- schema_migration.sql  creates pokemon table (FAILED - 1)
--   has an autoincrementing id column (FAILED - 2)
--   has a name column (FAILED - 3)
--   has a type column (FAILED - 4)
  
  
  CREATE TABLE IF NOT EXISTS pokemon (
      id INTEGER PRIMARY KEY,
      name TEXT,
      type TEXT);