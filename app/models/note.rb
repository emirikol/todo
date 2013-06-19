class Note < ActiveRecord::Base
  attr_accessible :title, :description, :due, :done, :public

  belongs_to :user

  scope :public, ->() {  where(public: true)  }

  def self.by_filter(filter, user = nil)
    case filter
      when nil, 'user'
        user.notes
      when 'all'
        Note.public.all
    end

  end

  def due
    self[:due].try(:strftime, '%d/%m/%y')
  end



end
