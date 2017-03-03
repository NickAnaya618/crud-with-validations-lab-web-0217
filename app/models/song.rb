class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: [true, false]}
  validates :artist_name, presence: true
  validate :release_year_method

  def release_year_method
    if released
      #check if less than greater statement
      if !(release_year != nil && release_year <= Time.current.year)
        errors.add(:release_year, "Error!")
        return false
      end
    elsif release_year
      if !(release_year <= Time.current.year)
        errors.add(:release_year, "Error!")
        return false
      end
    end
  end
end
