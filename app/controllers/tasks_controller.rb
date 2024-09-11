class TasksController < ApplicationController
    before_action :set_task, only: [:show]
    before_action :authenticate_user!

    def show
    end

    def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build
    end

    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params)
        @task.user = current_user
        if @task.save
            redirect_to board_path(board), notice: 'add Task'
        else
            flash.now[:error] = '更新できませんでした'
            render :new
        end
    end

    def edit
        @task = current_user.tasks.find(params[:id])
    end

    def update
        @task = current_user.tasks.find(params[:id])
        if @task.update(task_params)
            redirect_to board_path(@task.board), notice: 'Update Successful'
        else
            flash.now[:error] = 'Update Failed'
            render :edit
        end
    end

    def destroy
        task = current_user.tasks.find(params[:id])
        task.destroy!
        redirect_to board_path(task.board), notice: 'Destroy Successful'
    end

    private
    def task_params
        params.require(:task).permit(
            :title,
            :content,
            :deadline,
            :eyecatch
        )
    end

    def set_task
        @task = Task.find(params[:id])
    end
end