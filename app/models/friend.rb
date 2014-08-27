class Friend < ActiveRecord::Base
  has_many :funny_things

  def reverse_name
    name.downcase.reverse.capitalize
  end
end
