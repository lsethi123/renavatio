require "spec_helper"

describe Patient do

  it "is named Ash" do
    patient = Patient.create(:firstname => "Ash")
    patient.firstname.should == "Ash"
  end

  # it "has no visits" do
  #   patient = Patient.new
  #   patient.visits.should < 1
  # end

  it "is invalid without a name" do
    patient = Patient.new
    patient.should_not be_valid
  end

  # regular expression
  it "has a name that matches 'Vincent'" do
    patient = Patient.new(firstname: "Vincent 1")
    patient.firstname.should match(/Vincent \d/)
  end

  it "include visits" do
    visit = Visit.new(chief_complaint: "cancer")
    patient = Patient.new(firstname: "Vincent")
    patient.visits.new(chief_complaint: "cancer")
    patient.visits == [visit]
  end

  it "changes the number of Patients" do
    patient = Patient.new(firstname:  "Vincent", lastname: "Du")
    expect {patient.save}.to change {Patient.count}.by(1)
  end

  it "raises an error if saved without a name" do
    patient = Patient.new
    expect {patient.save!}.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end

  it "should have 2 visits" do
    patient = Patient.new(firstname: "Vincent", lastname: "Du")
    patient.visits.new(chief_complaint: "cancer")
    patient.visits.new(chief_complaint: "TB")
    patient.should have(2).visits
  end

end