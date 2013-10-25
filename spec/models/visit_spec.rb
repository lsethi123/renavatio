require "spec_helper"

describe Visit do

  it "validates presence of chief complaint" do
    visit = Visit.new(chief_complaint: nil)
    visit.should validate_presence_of(:chief_complaint).with_message("Deceased")
  end

end