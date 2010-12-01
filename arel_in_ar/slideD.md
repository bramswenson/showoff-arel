!SLIDE smaller transition=toss

    @@@ruby
    # activerecord/lib/active_record/relation/query_methods.rb
    def build_arel
      arel = table

      arel = build_joins(arel, @joins_values) unless 
        @joins_values.empty?

      (@where_values - ['']).uniq.each do |where|
        where = Arel.sql(where) if String === where
        arel = arel.where(Arel::Nodes::Grouping.new(where))
      end

      arel = arel.having(
        *@having_values.uniq.reject{|h| h.blank?}
      ) unless @having_values.empty?

      arel = arel.take(@limit_value) if @limit_value
      arel = arel.skip(@offset_value) if @offset_value

      # continues on next slide
