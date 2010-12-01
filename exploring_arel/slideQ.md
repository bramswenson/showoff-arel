!SLIDE transition=toss
## ANDS and ORS ##

!SLIDE smaller incremental transition=toss

    @@@ruby
    users = Arel::Table.new(:users)
    # AND operator
    users.
      where(
        users[:email].matches('%craniumisajar%').
      and(
        users[:created_at].gteq(1.year.ago)
      )).project(Arel.sql('*').to_sql
     => "SELECT * FROM "users" 
         WHERE "users"."email" ILIKE '%craniumisajar%' 
         AND "users"."created_at" >= '2009-12-01 20:00:03.917537'"

    # OR operator
    users.
      where(
        users[:email].matches('%craniumisajar%').
      or(
        users[:updated_at].lt(1.day.ago)
      )).project(Arel.sql('*').to_sql
     => "SELECT * FROM "users" 
         WHERE ("users"."email" ILIKE '%craniumisajar%' 
         OR "users"."updated_at" < '2010-11-30 20:05:26.590664')"
