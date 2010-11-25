!SLIDE bullets incremental transition=toss

# ARel Source #

!SLIDE smbullets incremental transition=toss

# Arel::Table #
* Representation of a single SQL Table
* Provides methods where, joins, group, and having to name a few

!SLIDE transition=toss
# ARel in Action #

!SLIDE transition=toss
# Get an Array of columns #

    @@@ruby
    users = Arel::Table.new(:users)
    users.columns
    => [  ]

