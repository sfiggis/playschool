class Kid < ActiveRecord::Base
  belongs_to :group
  validates :name, :age, :notes, presence: true
end
