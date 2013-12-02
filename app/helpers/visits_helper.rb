module VisitsHelper

	def create_visit_options(visit, patient_id)
		visit ||= []
		output = ""
		id = visit.get(:id)
		unless visit.blank?
      param_hash = {:patient_id => patient_id, :id => id}
			output += link_to("Edit", edit_patient_visit_path(param_hash), :class => 'btn btn-default').html_safe
			output += link_to("Delete", patient_visit_path(param_hash), :method => :delete, :confirm => true, :class => 'btn btn-default').html_safe
		end
		output.html_safe
	end

	def generate_new_visit(visit, patient_id)
    visit_id = link_to visit.id, edit_patient_visit_path(:patient_id => patient_id, :id => visit.id)
		CollectionDisplay.new([
      {:name => :id, :value => visit.id, :display_value => visit_id},
      {:name => :type_of, :value => visit.type_of, :display_value => determine_visit_type(visit.type_of)},
      {:name => :chief_complaint, :value => visit.chief_complaint, :display_value => visit.chief_complaint},
      {:name => :updated_at, :value => visit.updated_at, :display_value  => visit.updated_at},
      {:name => :created_at, :value => visit.created_at, :display_value => visit.created_at},
    ])
	end

  def determine_visit_type(type)
    types = ["None", "Consultation", "Progress Note", "Injection Session"]
    types[type]
  end

  def visit_form_output(visit, patient, staff)
    unless visit.blank? || patient.blank? || staff.blank?
      CollectionDisplay.new([
        {:name => :visit_type, :value => visit.type_of, :display_value => visit_type_select(visit.type_of)},
        {:name => :staff, :value => visit.staff_id, :display_value => staff_select(@staffs, visit.staff_id)}
      ])
    end
  end

  def visit_type_select(selected = "")
    select_tag(
      "typelist",
      options_for_select(
        [["Consultation", 1],
        ["Progress Note", 2],
        ["Injection Session", 3]],
        :selected => selected
      ), :class => "form-control",
      :place_holder => "Please select an option",
      :name => "visit[type_of]"
    ).html_safe
  end

  def staff_select(staffs, selected = "")
    select_tag("staffs",
      options_for_select(staffs, :selected => selected),
      :class => "form-control",
      :name => "visit[staff_id]"
    )
  end

end