class Task < ActiveRecord::Base

  # def self.not_done
  #   where(done: false)
  # end
  #
  # def self.done
  #   where(done: true)
  # end

  scope :not_done, -> {where("done = false")}

  scope :done, -> {where("done = true")}

  scope :today, -> { where("created_at >=?", Time.now.beginning_of_day)} #need to seperate ? if there is another function

  scope :ten_most_recent, -> { order(created_at: :desc).limit(10)}

  belongs_to :list

  validates :description, :presence => true
end
