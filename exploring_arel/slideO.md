!SLIDE smaller incremental transition=toss

    @@@ruby
    users = Arel::Table.new(:users)
    ratings = Arel::Table.new(:ratings)
    manager = Arel::SelectManager.new(users.engine)
    manager.from(users)
    manager.join(ratings).on(users[:id].eq(ratings[:rater_id]))
    manager.project(Arel.sql('*'))
    manager.to_sql
     => "SELECT * FROM "users" 
         INNER JOIN "ratings" 
         ON "users"."id" = "ratings"."rater_id""
    
