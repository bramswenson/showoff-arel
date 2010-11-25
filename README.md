# Showoff ARel #

This presentation is to be presented at the Rubyham Meetup in Birmingham, AL on December 1st 2010. The primary goals of this presentation are as follows:

* Introduce ARel
* Detail the inner workings of ARel as it relates to use with ActiveRecord
* Introduce MetaWhere
* Detail the inner workings of MetaWhere and how it improves "where" (a.k.a. conditions) hashes in ActiveRecord
* Introduce MetaSearch
* Touch on the use of MetaSearch in a Rails Project

# Table of Contents #

1. Introduction
  a. Contents
2. Intro to ARel
  a. ARel History
  b. ARel 2.x / Rails 3.0.3
  c. Produces SQL
  d. AST Based
  e. ARel Source
  f. ARel Basic Code Examples
3. ARel in ActiveRecord
  a. Scopes and Conditions Hashes
  b. ActiveRecord Comparisons
  c. Direct ARel Access in ActiveRecord
  d. ARel in ActiveRecord Advanced Code Examples
4. MetaWhere
  a. What it does?
  b. Scopes and Conditions with MetaWhere
  c. ActiveRecord Comparisons Redux
5. MetaSearch
  a. What it does?
  b. Using it for search
  c. Form Helpers
6. Closing and Questions

# Bibliography #

* [ARel](https://github.com/rails/arel)
* [MetaWhere](http://metautonomo.us/projects/metawhere/)
* [MetaSearch](http://metautonomo.us/projects/metasearch/)
* [MetaWhere Code](https://github.com/ernie/meta_where)
* [MetaSearch Code](https://github.com/ernie/meta_search)
* [Why ARel?](http://magicscalingsprinkles.wordpress.com/2010/01/28/why-i-wrote-arel/)
* [ActiveRecord Query Interface 3.0](http://m.onkey.org/active-record-query-interface)
* [Railscast #202 - ActiveRecord Queries in Rails 3](http://railscasts.com/episodes/202-active-record-queries-in-rails-3)
* [Railscast #212 - Refactoring & Dynamic Delegator](http://railscasts.com/episodes/212-refactoring-dynamic-delegator)
* [Railscast #215 - Advanced Queries in Rails 3](http://railscasts.com/episodes/215-advanced-queries-in-rails-3)
* [Railscast #239 - ActiveRecord::Relation Walkthrough](http://railscasts.com/episodes/239-activerecord-relation-walkthrough)
* [RailsGuides - ActiveRecord Query Interface](http://edgeguides.rubyonrails.org/active_record_querying.html)
* [RubyOnRails Screencast - ActiveRelation & ActiveModel](http://rubyonrails.org/screencasts/rails3/active-relation-active-model)
* [InfoQ - Carl Lerche on Rails 3 and ARel](http://www.infoq.com/interviews/lerche-rails-arel)
* [AT&T Interactive - ARel Two Point Ohhhhh Yaaaaaa](http://engineering.attinteractive.com/2010/10/arel-two-point-ohhhhh-yaaaaaa/)
* [ActiveRecord::Relation vs ARel](http://metautonomo.us/2010/05/11/activerecord-relation-vs-arel/)
* [Ruby AST for fun and profit](http://www.igvita.com/2008/12/11/ruby-ast-for-fun-and-profit/)
* [Ruby ASTs](http://www.rubyinside.com/fun-with-rubys-abstract-syntax-trees-1401.html)
* [Abstract Syntax Tree](http://en.wikipedia.org/wiki/Abstract_syntax_tree)
* [Relational Algebra](http://en.wikipedia.org/wiki/Relational_algebra)


