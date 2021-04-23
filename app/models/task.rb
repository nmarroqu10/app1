class Task < ApplicationRecord
  belongs_to :projects
  belongs_to :project
end
