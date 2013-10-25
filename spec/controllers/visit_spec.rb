require "spec_helper"

describe VisitsController do

# Refactor the zombie spec to use a before hook.
# For bonus points refactor the examples to one line.
# describe Zombie do
#   let(:zombie) { Zombie.new }
#   subject { zombie }
#   before { zombie.eat_brains }

#   it 'is not a dummy zombie' do
#     zombie.should_not be_dummy
#   end

#   it 'is a genius zombie' do
#     zombie.should be_genius
#   end
# end

# We've decided to refactor out the smart zombie into its own context.
# Add a before filter specific to this context that will make our
# smart zombie spec pass.

# Add a before block to the smart zombie context

# describe Zombie do
#   let(:zombie) { Zombie.new }
#   before { zombie.iq = 0 }
#   subject { zombie }

#   it { should be_dummy }

#   context 'with a smart zombie' do
#     before { zombie.iq = 3 }
#     it { should_not be_dummy }
#   end
# end


# Refactor our last example so that there is another context called
# 'with a dummy zombie'. Move the zombie.iq before filter inside
# this context.

# Add a `with a dummy zombie` context

# describe Zombie do
#   let(:zombie) { Zombie.new }
#   subject { zombie }

#   context 'with a dummy zombie' do
#     before { zombie.iq = 0 }
#     it { should be_dummy }
#   end

#   context 'with a smart zombie' do
#     before { zombie.iq = 3 }
#     it { should_not be_dummy }
#   end
# end

  let(:visit) { Visit.create }

  context "#attestation" do
    @controller = VisitsController.new

    it "sets the attestation date" do
      @controller.send(:set_visit_attestation, visit, "10/06/2013")
      # visit.stub(:attestation_date).and_return("10/06/2013")
    end

    it "sets the attestation date without private method" do
      visit.stub(:attestation_date).with("10/06/2013")
      visit.stub(:update_attributes).and_return(true)
      visit.stub(:attestation_date).and_return("10/06/2013")
    end

  end

end