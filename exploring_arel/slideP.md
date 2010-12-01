!SLIDE transition=toss
## And Groups? ##

!SLIDE smaller incremental transition=toss

    @@@ruby
    posts = Arel::Table.new(:posts)
    ratings = Arel::Table.new(:ratings)
    manager = Arel::SelectManager.new(posts.engine)
    manager.from(posts)
    manager.join(ratings).on(post[:id].eq(ratings[:post_id]))
    manager.group(posts[:title])
    manager.project(posts[:title], ratings[:rating].average)
    manager.to_sql
     => "SELECT "posts"."title", 
         AVG("ratings"."rating") AS avg_id 
         FROM "posts" INNER JOIN "ratings" 
         ON "posts"."id" = "ratings"."post_id" 
         GROUP BY "posts"."title"" 

    
