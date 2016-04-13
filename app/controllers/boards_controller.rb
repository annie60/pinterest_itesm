class BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = current_user.boards
  end

  def new
    @board = current_user.boards.build
  end

  def show
    @board = current_user.boards.find(params[:id])
    @pin = @board.pins.build
  end

  def create
    @board = current_user.boards.build(board_params)

    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy
    redirect_to boards_path
  end

  private

    def board_params
      params.require(:board).permit(:name, :tags_list)
    end
end
