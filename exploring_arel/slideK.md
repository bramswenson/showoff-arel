!SLIDE smaller transition=toss

    # how about something more complex
    users_table.where(
      email_attr.matches('%arel%')
    ).project(
      Arel.sql('*')
    ).to_sql
     => "SELECT * FROM "users" WHERE "users"."email" ILIKE '%arel%'"

