class ChirpsController < ApplicationController
  def index
    @chirps = Chirp.all
  end

  def new
    @chirp = Chirp.new
  end

  def destroy
    Chirp.find(params[:id]).destroy
    redirect_to chirps_path
  end
  
  def create
    @chirp = Chirp.new(params[:chirp].permit(:author, :body))
    if @chirp.save
      redirect_to chirp_path(@chirp)
    else
      render 'new'
    end
  end

  def edit
    @chirp = Chirp.find(params[:id])
  end

  def update
    @chirp = Chirp.find(params[:id])

    if @chirp.update(params[:chirp].permit(:author, :body))
      redirect_to chirp_path(@chirp)
    else
      render 'edit'
    end
  end

  def show
    @chirp = Chirp.find(params[:id])
  end
end
