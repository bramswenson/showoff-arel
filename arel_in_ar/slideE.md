!SLIDE smaller transition=toss

    @@@ruby
    # activerecord/lib/active_record/relation/query_methods.rb 
    # continued

      arel = arel.group(
        *@group_values.uniq.reject{|g| g.blank?}
      ) unless @group_values.empty?
    
      arel = arel.order(
        *@order_values.uniq.reject{|o| o.blank?}
      ) unless @order_values.empty?

      arel = build_select(arel, @select_values.uniq)

      arel = arel.from(@from_value) if @from_value
      arel = arel.lock(@lock_value) if @lock_value

      arel
    end 
