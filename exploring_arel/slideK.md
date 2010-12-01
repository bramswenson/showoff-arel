!SLIDE transition=toss
## InsertManager ##

!SLIDE small incremental transition=toss

    @@@ruby
    users = Arel::Table.new(:users)
    manager = Arel::InsertManager.new(users.engine)
    manager.insert([
        [ users[:email], 'bram@craniumisajar.com' ],
        [ users[:blog_name], 'Cranium Is Ajar' ]
    ])
     => "INSERT INTO "users" ("email", "blog_name") 
         VALUES ('joe@craniumisajar.com', 'Cranium Is Ajar')"


