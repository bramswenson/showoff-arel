!SLIDE smaller transition=toss

    @@@ruby
    # many methods of Arel::Table
    # return Arel::TreeManager subclasses
    users_table.where(
      email_attr.matches('%arel%')
    ).project(
      Arel.sql('*')
    ).class
     => Arel::SelectManager 
    
    # remember to add project for any select clauses
    users_table.where(
      email_attr.matches('%arel%')
    ).project(
      email_attr
    ).to_sql
     => "SELECT "users"."email" FROM "users" WHERE "users"."email" ILIKE '%arel%'"


