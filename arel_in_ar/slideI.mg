!SLIDE smaller transition=toss

    @@@ruby
    class User < ActiveRecord::Base
      scope :from_domain_sql, lambda { |domain|
        where("users.email ILIKE ?", "%#{domain}%")
      }
      scope :from_domain_arel, lambda { |domain|
        where(arel_table[:email].matches("%#{domain}%"))
      }
    end
    

