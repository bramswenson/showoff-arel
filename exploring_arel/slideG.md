!SLIDE smaller transition=toss

    @@@ruby
    # predicates in action return Arel::Node instances
    users = Arel::Table.new(:users)
    users[:email].eq('bram@craniumisajar.com').class
     => Arel::Nodes::Equality

    # which can transform to sql
    users[:email].eq('bram@craniumisajar.com').to_sql
     => ""users"."email" = 'bram@craniumisajar.com'"

    # matching predicate syntax is sql not regex
    users[:email].matches('%craniumisajar%').to_sql
     => ""users"."email" ILIKE '%craniumisajar%'"

    # matching predicate syntax is sql not regex
    users[:email].matches('%craniumisajar%').to_sql
     => ""users"."email" ILIKE '%craniumisajar%'"

    # there are some nice "any" and "all" predicates
    # for passing in multiple predicate options at once
    users[:email].matches_any([ '%craniumisajar%', '%gmail%']).to_sql
     => "("users"."email" ILIKE '%craniumisajar%' OR 
          "users"."email" ILIKE '%gmail%')" 

    # count is an expression
    users[:email].count.to_sql
     => "COUNT("users"."email")" 
    users[:email].count(true).to_sql
      => "COUNT(DISTINCT "users"."email")"
    
