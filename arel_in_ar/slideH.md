!SLIDE transition=toss
## Comparing Conditions Hashes ##

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
    
    # the resulting sql is only slightly different
    User.from_domain_sql('craniumisajar').to_sql
     => "SELECT "users".* FROM "users" 
         WHERE (users.email ILIKE '%craniumisajar%')"
    User.from_domain_arel('craniumisajar').to_sql
     => "SELECT "users".* FROM "users" 
         WHERE ("users"."email" ILIKE '%craniumisajar%')"

