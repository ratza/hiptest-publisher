module Hiptest
  module CodeceptionAddon
    def replace_parameter_value_with_type(collection, parameters)
      super(
        collection.map do |obj|
          if obj[:is_parameter]
            obj[:value] = ":#{obj[:name]}"
          end

          obj
        end,
        parameters
      )
    end
  end
end
