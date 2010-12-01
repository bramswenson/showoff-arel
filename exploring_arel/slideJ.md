!SLIDE transition=toss
## SelectManager ##

!SLIDE smaller incremental transition=toss
    @@@ruby
    # many methods of Arel::Table
    # return Arel::TreeManager subclasses
    users.where(users[:email].matches('%craniumisajar%')).
      project(Arel.sql('*')).class
     => Arel::SelectManager 
    
    # TreeManagers construct complete queries
    users.where(users[:email].matches('%craniumisajar%')).
      project(Arel.sql('*')).to_sql
     => "SELECT * FROM "users" 
         WHERE "users"."email" ILIKE '%craniumisajar%'"
    
    # remember to add project for any select clauses
    users.where(users[:email].matches('%craniumisajar%')).
      project(users[:email]).to_sql
     => "SELECT "users"."email" FROM "users" 
         WHERE "users"."email" ILIKE '%craniumisajar%'"

