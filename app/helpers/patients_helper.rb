module PatientsHelper

	def display_specific(specific = {})
		if specific
			"Passed in #{specific.firstname}"
		end
	end

	def create_patient_options(patient)
		patient ||= []
		output = ""
		unless patient.blank?
			output += link_to("Edit", edit_patient_path(patient), :class => 'btn btn-mini').html_safe
			output += link_to("Delete", patient_path(patient), :method => :delete, :confirm => true, :class => 'btn btn-mini').html_safe
			output += link_to("View Profile", patient_path(patient.id), :class => 'btn btn-mini').html_safe
			output += link_to("New Visit", new_patient_visit_path(patient.id), :class => 'btn btn-mini').html_safe
		end
		output.html_safe
	end

end
