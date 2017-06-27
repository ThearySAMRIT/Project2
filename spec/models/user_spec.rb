require 'rails_helper'

RSpec.describe User, type: :model do
  context "associations" do
    it{expect have_many :posts}
    it{expect have_many :comments}
    it{expect have_many :followers}
    it{expect have_many :following}
    it{expect have_many :active_relationships}
    it{expect have_many :passive_relationships}
  end

  context "validations" do
    it{expect validate_presence_of :full_name}
    it{expect validate_presence_of :email}
    it{expect validate_presence_of :password}
    end
end
