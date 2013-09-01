module PatientsHelper

	def display_specific(specific = {})
		if specific
			"Passed in #{specific.firstname}"
		end
	end

end
