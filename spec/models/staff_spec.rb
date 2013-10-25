require "spec_helper"

describe Staff do
  let!(:staff) { Staff.create(administrator: true) }
  let!(:visit) { Visit.create(chief_complaint: "cancer") }

  # it "responds to name" do
  #   # staff = Staff.new()
  #   # staff.should respond_to(:name)
  #   # subject.should respond_to(:name)
  #   should respond_to(:name)
  # end

  # it "responds to name" { should respond_to(:name) }

  it { should respond_to(:name) }

  # it { subject.name.should == "Vincent" }

  # its(:name, "Vincent") { should == "Vincent" }

  context "with an administrator flag" do
    # subject { Staff.new(administrator: true) }
    it "should have an administrator flag" do
      staff.administrator?.should == true
    end

    it "should include visit" do
      staff.visits.new(chief_complaint: "cancer")
      staff.visits == [visit]
    end

    it "should have 1 visit" do
      staff.visits.new(chief_complaint: "cancer")
      staff.should have(1).visits
    end
  end

end