require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @projects = projects(:one)
    @task = tasks(:one)
  end

  test "should get index" do
    get :index, params: { projects_id: @projects }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { projects_id: @projects }
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, params: { projects_id: @projects, task: @task.attributes }
    end

    assert_redirected_to projects_task_path(@projects, Task.last)
  end

  test "should show task" do
    get :show, params: { projects_id: @projects, id: @task }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { projects_id: @projects, id: @task }
    assert_response :success
  end

  test "should update task" do
    put :update, params: { projects_id: @projects, id: @task, task: @task.attributes }
    assert_redirected_to projects_task_path(@projects, Task.last)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, params: { projects_id: @projects, id: @task }
    end

    assert_redirected_to projects_tasks_path(@projects)
  end
end
