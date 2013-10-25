class CollectionDisplay

	def initialize(attributes)
		@attributes = attributes
	end

	def get(name, value_type=nil)
		if value_type == :display
			@attributes.select{|i| i[:name] == name}.first[:display_value]
		else
			@attributes.select{|i| i[:name] == name}.first[:value]
		end
	end

	def key_list
		@list ||= @attributes.map{ |i| i[:name].to_s.camelcase }
	end

end