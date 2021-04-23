json.extract! projects_task, :id, :name, :description, :status, :project_id, :created_at, :updated_at
json.url projects_task_url(projects_task, format: :json)
