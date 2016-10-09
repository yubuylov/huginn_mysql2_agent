require 'rails_helper'
require 'huginn_agent/spec_helper'

describe Agents::Mysql2Agent do
  before(:each) do
    @valid_options = Agents::Mysql2Agent.new.default_options
    @checker = Agents::Mysql2Agent.new(:name => "Mysql2Agent", :options => @valid_options)
    @checker.user = users(:bob)
    @checker.save!
  end

  describe '#working?' do
    it 'checks if events have error' do
      @checker.error "oh no!"
      expect(@checker.reload).not_to be_working # There is a recent error
    end
  end

end
