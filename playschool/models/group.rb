class Group < ActiveRecord::Base
  has_many :kids
  validates :name, :notes, presence: true
  accepts_nested_attributes_for :kids
end
