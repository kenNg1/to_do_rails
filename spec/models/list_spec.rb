require 'rails_helper'

  describe List do
    it { should validate_presence_of :name }
    it { should have_many :tasks }
  end

  describe List do
    it 'is private by default' do
      list = FactoryGirl.create(:list)
      list.public?.should eq false
    end
  end
