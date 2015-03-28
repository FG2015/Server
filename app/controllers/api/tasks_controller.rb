module Api

  class TasksController < ApiController
  
    def index
      @tasks = current_user.tasks
    end

    def show
      @task = Task.find_by(id: params[:id])
      if !@task
        render :json => { :status => :not_found, :message => "Not existing task" }, :status => :not_found
      end
    end

  end

end