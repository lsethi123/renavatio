module ApplicationHelper

	def subnav_content_module(options = {}, &block)
		render :partial => "shared/subnav", :locals => {:options => options, :block => block}
	end

	def create_collections(collection, method, add_object = "")
		collection = collection || []
		new_collection = []
		collection.each do |item|
      unless add_object != ""
			  new_collection << self.send(method.to_sym, item)
		  else
        new_collection << self.send(method.to_sym, item, add_object)
      end
    end
		new_collection
	end

	def translate_table_data(column_name, data)
    val = data.to_s.downcase
    if ["IsActive", "IsPublic"].include?(column_name)
      state = case val
        when "0" then "FALSE"
        when "1" then "TRUE"
        when "false" then "FALSE"
        when "true" then "TRUE"
      end
      state = "TRUE" if state.blank?
      if state == "TRUE"
        "<span class='label label-info'>#{state}</span>".html_safe
      elsif state == "FALSE"
        "<span class='label label-important'>#{state}</span>".html_safe
      end
    elsif ["IsDeleted", "IsLocked"].include?(column_name)
      state = case val
        when "0" then "FALSE"
        when "1" then "TRUE"
        when "false" then "FALSE"
        when "true" then "TRUE"
      end
      state = "FALSE" if state.blank?
      if state == "TRUE"
        "<span class='label label-important'>#{state}</span>".html_safe
      else
        "<span class='label label-info'>#{state}</span>".html_safe
      end
    elsif ["IsSynced"].include?(column_name)
      state = case val
        when "0" then "FALSE"
        when "1" then "TRUE"
        when "false" then "FALSE"
        when "true" then "TRUE"
      end
      state = "TRUE" if state.blank?
      if state == "TRUE"
        "<span class='label label-info'>#{state}</span>".html_safe
      else
        "<span class='label label-warning'>#{state}</span>".html_safe
      end
    elsif ["CreatedAt", "UpdatedAt"].include?(column_name)
      display_time(data)
    else
      data
    end
  end

  def display_time(time)
    unless time.to_s.blank?
      t = Time.parse(time.to_s).asctime
    end
  end

  def filter_params(params)
    filtered_params = []
    params.each do |key,value|
      unless value.blank? or value === "25" or value === "1"
        filtered_params << [key, value, key]
      end
    end
    filtered_params
  end

end
