module VisitsHelper

	def create_visit_options(visit, patient_id)
		visit ||= []
		output = ""
		id = visit.get(:id)
		unless visit.blank?
      param_hash = {:patient_id => patient_id, :id => id}
			output += link_to("Edit", edit_patient_visit_path(param_hash), :class => 'btn btn-mini').html_safe
			output += link_to("Delete", patient_visit_path(param_hash), :method => :delete, :confirm => true, :class => 'btn btn-mini').html_safe
		end
		output.html_safe
	end

	def generate_new_visit(visit, patient_id)
    visit_id = link_to visit.id, edit_patient_visit_path(:patient_id => patient_id, :id => visit.id)
		CollectionDisplay.new([
      {:name => :id, :value => visit.id, :display_value => visit_id},
      {:name => :type_of, :value => visit.type_of, :display_value => visit.type_of},
      {:name => :chief_complaint, :value => visit.chief_complaint, :display_value => visit.chief_complaint},
      {:name => :updated_at, :value => visit.updated_at, :display_value  => visit.updated_at},
      {:name => :created_at, :value => visit.created_at, :display_value => visit.created_at},
    ])
	end

end