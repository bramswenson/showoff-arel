!SLIDE small transition=toss

    @@@ruby
    # create a new Arel::Table instance for the users table
    users = Arel::Table.new(:users)

    # create an sql literal string
    # this is shorthand for Arel::Nodes::SqlLiteral.new('*')
    asterisk = Arel.sql('*')
    
    # create a projection (SELECT clause) on the table
    all_users = users.project(asterisk)
    
    # transform the built up AST to sql
    all_users.to_sql
      => "SELECT * FROM 'users'"

    # all in one line
    Arel::Table.new(:users).project(Arel.sql('*')).to_sql 
      => "SELECT * FROM 'users'"
