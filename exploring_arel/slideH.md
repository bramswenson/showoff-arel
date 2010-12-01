!SLIDE smaller transition=toss

    @@@ruby
    # There are many predicates available
    Arel::Predications.instance_methods.sort
      => ["asc", "desc", "does_not_match", "does_not_match_all", 
          "does_not_match_any", "eq", "eq_all", "eq_any", "gt", 
          "gt_all", "gt_any", "gteq", "gteq_all", "gteq_any", 
          "in", "in_all", "in_any", "lt", "lt_all", "lt_any",
          "lteq", "lteq_all", "lteq_any", "matches", "matches_all", 
          "matches_any", "not_eq", "not_eq_all", "not_eq_any", 
          "not_in", "not_in_all", "not_in_any" ] 

    # and some expressions as well
    Arel::Expressions.instance_methods.sort
      => ["average", "count", "maximum", "minimum", "sum"] 


