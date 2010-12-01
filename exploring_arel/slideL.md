!SLIDE transition=toss
## UpdateManager ##

!SLIDE smaller incremental transition=toss

    @@@ruby
    users = Arel::Table.new(:users)
    manager = Arel::UpdateManager.new(users.engine)
    manager.table(users)
    manager.set([
        [ users[:blog_name], 'Cranium Is Ajar' ],
        [ users[:updated_at], DateTime.now ]
    ])
    manager.where( users[:email].eq('bram@craniumisajar.com') )
    manager.to_sql
     => "UPDATE "users" 
         SET "blog_name" = 'Cranium Is Ajar', 
             "updated_at" = '2010-12-01 18:43:31' 
         WHERE "users"."email" = 'bram@craniumisajar.com'"


