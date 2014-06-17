module Mongoid
  module Orderable
    module Generator
      module Helpers

        def generate_orderable_helpers
          self_class = klass

          generate_method(:orderable_base) do |column = nil|
            column ||= default_orderable_column
            self_class.orderable_configurations[column][:base]
          end

          generate_method(:orderable_inherited_class) do
            self_class.orderable_configurations.any?{ |col, conf| conf[:inherited] } ? self_class : self.class
          end
        end

      end
    end
  end
end