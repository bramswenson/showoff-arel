!SLIDE smaller transition=toss

    @@@ruby
    # columns/attributes are avaialble as 
    # Arel::Attribute subclasses via []
    users = Arel::Table.new(:users)
    users[:email]
      => Arel::Attributes::String

    # Arel::Attributes::Attribute instances are simply 
    # Structs with functionallity included via modules
    module Arel
      module Attributes
        class Attribute < Struct.new :relation, :name, :column
          include Arel::Expressions
          include Arel::Predications
        end

        class String    < Attribute; end
        class Time      < Attribute; end
        class Boolean   < Attribute; end
        class Decimal   < Attribute; end
        class Float     < Attribute; end
        class Integer   < Attribute; end
        class Undefined < Attribute; end
      end
      Attribute = Attributes::Attribute
    end

