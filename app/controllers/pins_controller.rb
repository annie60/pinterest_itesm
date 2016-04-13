class PinsController < ApplicationController
  before_action :authenticate_user!

  def new
    @board = current_user.boards.find(params[:board_id])
    @pin = @board.pins.build
  end

  def create
    @board = current_user.boards.find(params[:board_id])
    @pin = @board.pins.build(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @board, notice: "Tu pin se ha creado" }
        format.js
      else
        format.html { redirect_to @board, notice: "Ocurrio un error" }
        format.js
      end
    end
  end

  private

    def pin_params
      params.require(:pin).permit(:image)
    end
end
