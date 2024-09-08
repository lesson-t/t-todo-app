class BoardsController < ApplicationController

    def index
        # @boards = Boards.all
    end

    def show
    end

    def new
        @board = current_user.boards.build
    end

    def create
        @board = current_user.boards.build(board_params)
        if @board.save
            redirect_to board_path(@board), notice: '保存できました'
        else
            flash.now[:error] = '保存に失敗しました'
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
    def board_params
        params.require(:board).permit(:title, :content)
    end


end