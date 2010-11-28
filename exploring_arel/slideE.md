!SLIDE small transition=toss

    @@@ruby
    # create a new Arel::Table instance for users table
    users_table = Arel::Table.new(:users)

    # create an sql literal string
    # this is shorthand for Arel::Nodes::SqlLiteral.new('*')
    sql_asterisk = Arel.sql('*')
    
    # create a projection (SELECT clause) on the table
    all_users = users_table.project(sql_asterisk)
    
    # transform the built up AST to sql
    all_users.to_sql
      => "SELECT * FROM 'users'"
    # transform the built up AST to dot
    all_users.to_dot
     => "digraph "ARel" {\nnode [width...
 
    # all in one line
    Arel::Table.new(:users).project(Arel.sql('*')).to_sql 
      => "SELECT * FROM 'users'"
