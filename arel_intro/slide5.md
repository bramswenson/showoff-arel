!SLIDE bullets incremental transition=toss

# ARel Source #

!SLIDE smbullets incremental transition=toss

# Arel::Table #
* Representation of a single SQL Table
* Provides methods where, joins, group, and having to name a few

!SLIDE transition=toss
# ARel in Action #

!SLIDE small incremental transition=toss

    @@@ruby
    # Create an instance of Arel::Table for :users table
    users = Arel::Table.new(:users)

    # Get an Array of column names
    users.columns.map { |c| c.name }
    => [:id, :email, :encrypted_password, :password_salt,
        :reset_password_token, :remember_token, 
        :remember_created_at, :sign_in_count, 
        :current_sign_in_at, :last_sign_in_at, 
        :current_sign_in_ip, :last_sign_in_ip, 
        :failed_attempts, :unlock_token, 
        :locked_at, :created_at, :updated_at] 
     

