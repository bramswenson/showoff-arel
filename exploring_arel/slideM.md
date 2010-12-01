!SLIDE transition=toss
## DeleteManager ##

!SLIDE small incremental transition=toss

    @@@ruby
    users = Arel::Table.new(:users)
    manager = Arel::DeleteManager.new(users.engine)
    manager.from(users)
    manager.where( users[:email].eq('bram@craniumisajar.com') )
    manager.to_sql
     => "DELETE FROM "users" 
         WHERE "users"."email" = 'bram@craniumisajar.com'" 

