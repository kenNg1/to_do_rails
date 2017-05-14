class List < ActiveRecord::Base

  has_many :tasks
  validates :name, :presence => true

  scope :most_tasks, -> {(
    select("lists.name, count(tasks.id) as tasks_count")
    .joins(:tasks)
    .group("lists.id")
    .order("tasks_count DESC")
    .limit(10)
    )}

  scope :search, -> (name_parameter) { where("name like ?", "%#{name_parameter}%")}

end
