class SQLRunner
  def initialize(db)
    @db = db
  end

  def execute_schema_migration_sql
    sql = File.read('db/schema_migration.sql')
    @db.execute_batch(sql)
  end
end
