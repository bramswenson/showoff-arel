!SLIDE smaller transition=toss

    @@@ruby
    # activerecord/lib/active_record/relation/predicate_builder.rb
          case value
          when Array, ActiveRecord::Associations::AssociationCollection,
               ActiveRecord::Relation
            values = value.to_a
            # Notice only the use of "in" and "eq" predicates
            # such a shame :(
            attribute.in(values)
          when Range
            attribute.in(value)
          else
            attribute.eq(value)
          end
        end
      end
 
      predicates.flatten
    end 



