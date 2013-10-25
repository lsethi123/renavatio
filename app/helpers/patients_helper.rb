module PatientsHelper

	def display_specific(specific = {})
		if specific
			"Passed in #{specific.firstname}"
		end
	end

	def create_patient_options(patient)
		patient ||= []
		output = ""
		id = patient.get(:id)
		unless patient.blank?
			output += link_to("Edit", edit_patient_path(id), :class => 'btn btn-mini').html_safe
			output += link_to("Delete", patient_path(id), :method => :delete, :confirm => true, :class => 'btn btn-mini').html_safe
			output += link_to("View Profile", patient_path(id), :class => 'btn btn-mini').html_safe
			output += link_to("New Visit", new_patient_visit_path(id), :class => 'btn btn-mini').html_safe
		end
		output.html_safe
	end

	def generate_new_patient(patient)
		patient_id = link_to patient.id, patient_path(patient.id)
		patient_name = link_to "#{patient.firstname} #{patient.lastname}", edit_patient_path(patient.id), :remote => true
		CollectionDisplay.new([
      {:name => :id, :value => patient.id, :display_value => patient_id},
      {:name => :name, :value => "#{patient.firstname} #{patient.lastname}", :display_value => patient_name},
      {:name => :birthday, :value => patient.birthday, :display_value => patient.birthday},
      {:name => :updated_at, :value => patient.updated_at, :display_value => patient.updated_at},
      {:name => :created_at, :value => patient.created_at, :display_value => patient.created_at},
    ])
	end

end
