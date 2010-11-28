!SLIDE smaller transition=toss

    @@@ruby
    # predicates in action return Arel::Node instances
    email_attr.eq('arel@rails.com').class
     => Arel::Nodes::Equality

    # which can transform to sql
    email_attr.eq('arel@rails.com').to_sql
     => ""users"."email" = 'arel@rails.com'"

    # matching predicate syntax is sql not regex
    email_attr.matches('%arel%').to_sql
     => ""users"."email" ILIKE '%arel%'"

    # matching predicate syntax is sql not regex
    email_attr.matches('%arel%').to_sql
     => ""users"."email" ILIKE '%arel%'"

    # there are some nice "any" and "all" predicates
    # for passing in multiple predicate options at once
    email_attr.matches_any([ '%arel%', '%rails%']).to_sql
     => "("users"."email" ILIKE '%arel%' OR 
          "users"."email" ILIKE '%rails%')" 

    # count is an expression
    email_attr.count.to_sql
     => "COUNT("users"."email")" 
    email_attr.count(true).to_sql
      => "COUNT(DISTINCT "users"."email")"
    
