require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  describe '#intersperse' do
    it 'correctly intersperses the separator in the array' do
      expect(helper.intersperse(%w[a a a], '.')).to eq(['a', '.', 'a', '.', 'a'])
      expect(helper.intersperse(%w[z z z], 5)).to eq(['z', 5, 'z', 5, 'z'])
    end
  end
end
