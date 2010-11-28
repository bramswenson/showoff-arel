!SLIDE smaller transition=toss
### TreeManagers put it all together ###

    @@@ruby
    # most other useful methods of Arel::Table
    # return Arel::TreeManager subclasses
    users_table.where(email_attr.matches('%arel%')).class
      => Arel::SelectManager

    # the TreeManager is an organized structure of Nodes
    # representing the query
    users_table.where(email_attr.matches('%arel%')).to_sql
     => "SELECT  FROM "users" WHERE "users"."email" ILIKE '%arel%'" 

    users_table.
