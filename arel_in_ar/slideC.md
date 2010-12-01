!SLIDE transition=toss
## How does ActiveRecord use ARel ##

!SLIDE smaller transition=toss

    @@@ruby
    # activerecord/lib/active_record/relation.rb
    def to_a
      return @records if loaded?

      @records = eager_loading? ? 
        find_with_associations : 
        # >>> THE MAGIC IS HERE <<<
        @klass.find_by_sql(arel.to_sql)

      preload = @preload_values
      preload +=  @includes_values unless eager_loading?
      preload.each { |associations| 
        @klass.send(:preload_associations, @records, associations) 
      }

      readonly = @readonly_value.nil? ? @implicit_readonly : @readonly_value
      @records.each { |record| record.readonly! } if readonly

      @loaded = true
      @records
    end 

