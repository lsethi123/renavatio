module StaffsHelper
	def create_staff_options(staff)
		staff ||= []
		output = ""
		id = staff.get(:id)
		unless staff.blank?
			output += link_to("Edit", edit_staff_path(id), :class => 'btn btn-mini').html_safe
			output += link_to("Delete", staff_path(id), :method => :delete, :confirm => true, :class => 'btn btn-mini').html_safe
			output += link_to("View Profile", staff_path(id), :class => 'btn btn-mini').html_safe
		end
		output.html_safe
	end

	def generate_new_staff(staff)
		staff_id = link_to staff.id, patient_path(staff.id)
		staff_name = link_to "#{staff.name}", edit_staff_path(staff.id), :remote => true
		CollectionDisplay.new([
      {:name => :id, :value => staff.id, :display_value => staff_id},
      {:name => :name, :value => "#{staff.firstname} #{staff.lastname}", :display_value => staff_name},
      {:name => :email, :value => staff.email, :display_value => staff.email},
      {:name => :title, :value => staff.title, :display_value => staff.title},
      {:name => :administrator, :value => staff.administrator, :display_value => staff.administrator},
      {:name => :updated_at, :value => staff.updated_at, :display_value => staff.updated_at},
      {:name => :created_at, :value => staff.created_at, :display_value => staff.created_at},
    ])
	end
end
