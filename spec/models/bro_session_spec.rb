require 'rails_helper'

RSpec.describe BroSession, type: :model do
  context "Associations" do
    it { should belong_to(:question).class_name('PracticeArea::Question') }
    it { should belong_to(:participant) }
  end
end
