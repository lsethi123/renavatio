class VitalSign < ActiveRecord::Base
  attr_accessible :bp1, :bp2, :height, :pulse, :respiratory_rate, :temperature, :weight, :visit_id

  belongs_to :visit
end
