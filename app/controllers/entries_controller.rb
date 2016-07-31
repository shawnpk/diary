class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
    @entries = Entry.all.order('created_at DESC')
  end

  def show

  end

  def new
    @entry = Entry.new
  end

  def edit

  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to entries_path
    else
      render :new
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to @entry
    else
      render :edit
    end
  end

  def destroy
    @entry.delete
    redirect_to entries_path
  end

  private
    def entry_params
      params.require(:entry).permit(:title, :contents)
    end

    def set_entry
      @entry = Entry.find(params[:id])
    end
end
