require 'rails_helper'

RSpec.describe Relationship, type: :model do
  context "associations" do
    it{expect belong_to :followed}
    it{expect belong_to :follower}
  end

  context "validations" do
    it{expect validate_presence_of :followed}
    it{expect validate_presence_of :follower}
  end
end
