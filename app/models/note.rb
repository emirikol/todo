class Note < ActiveRecord::Base
  attr_accessible :title, :description, :due, :done

  belongs_to :user

  def due
    self[:due].try(:strftime, '%d/%m/%y')
  end

end
