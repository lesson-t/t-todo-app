class TasksController < ApplicationController
    before_action :authenticate_user!

    def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build
    end

    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params)
        @task.user = current_user
        if @task.save
            redirect_to boards_path(board), notice: 'add Task'
        else
            flash.now[:error] = '更新できませんでした'
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
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
end