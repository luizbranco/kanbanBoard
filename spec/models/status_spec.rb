require 'spec_helper'

describe Status do

  context 'availability' do

    before(:each) do
      @status = FactoryGirl.create(:status)
      user_story = FactoryGirl.create(:user_story, :status => @status)
    end

    it 'is positive' do
      @status.wip = 2
      @status.availability.should == 1
    end

    it 'is negative' do
      @status.wip = 0
      @status.availability.should == -1
    end

    it 'is zero' do
      @status.wip = 1
      @status.availability.should == 0
    end

    it 'is unlimited' do
      @status.wip = nil
      @status.availability.should == '-'
    end

  end
end

