module VisitsHelper

	def create_visit_options(visit)
		visit ||= []
		output = ""
		id = visit.get(:id)
		unless visit.blank?
			output += link_to("Edit", edit_visit_path(id), :class => 'btn btn-mini').html_safe
			output += link_to("Delete", visit_path(id), :method => :delete, :confirm => true, :class => 'btn btn-mini').html_safe
		end
		output.html_safe
	end

	def generate_new_visit(visit)
		CollectionDisplay.new([
      {:name => :id, :value => visit.id, :display_value => visit_id},
      {:name => :type_of, :value => visit.type_of, :display_value => visit.type_of},
      {:name => :chief_complaint, :value => visit.chief_complaint, :display_value => visit.chief_complaint},
      {:name => :updated_at, :value => visit.updated_at, :display_value => visit.updated_at},
      {:name => :created_at, :value => visit.created_at, :display_value => visit.created_at},
    ])
	end

end