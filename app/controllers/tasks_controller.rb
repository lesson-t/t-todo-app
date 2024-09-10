class TasksController < ApplicationController
    before_action :set_board, only: [:show]
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

    def set_task
        @task = Task.find(params[:id])
    end
end