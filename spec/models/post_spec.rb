require "rails_helper"

RSpec.describe Post, type: :model do
  context "associations" do
    it{expect have_many :tags}
    it{expect have_many :post_tag}
    it{expect belong_to :user}
  end

  context "validations" do
    it{expect validate_presence_of :title}
    it{expect validate_presence_of :content}
  end
end
