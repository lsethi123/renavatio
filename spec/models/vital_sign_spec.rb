require "spec_helper"

describe VitalSign do

# Ripping out duplicated specs into a shared example can
# help DRY up your specs. Rip out the following specs into
# the shared example group and update Zombie and Plant specs
# to use the shared example.

#   shared_examples_for 'the brainless' do
#     it { should be_dummy }
#     it { should_not be_genius }
#   end

#   describe Zombie do
#     let(:zombie) { Zombie.new }
#     subject { zombie }
#     it_behaves_like 'the brainless'
#   end

#   describe Plant do
#     let(:plant) { Plant.new }
#     subject { plant }
#     it_behaves_like 'the brainless'
#   end


# Add the focus tag to the 'with a smart zombie' context block.
# This way we can run $ rspec --tag focus and just run
# these examples.

#   describe Zombie do
#     let(:zombie) { Zombie.new }
#     subject { zombie }

#     context 'with a dummy zombie', :focus => true, do
#       before { zombie.iq = 0 }
#       it { should be_dummy }
#     end

#     context 'with a smart zombie', :focus => true, do
#       before { zombie.iq = 3 }
#       it { should_not be_dummy }
#     end
#   end

# Run the rspec command that will run only the specs tagged with dumb
# in the spec/models/zombie_spec.rb file.
#   rspec --tag dumb spec/models/zombie_spec.rb


# Run the rspec command that will run all specs except those tagged with
# dumb in the spec/models/zombie_spec.rb file.
#   zombie_tweets $ rspec --tag ~dumb spec/models/zombie_spec.rb

end