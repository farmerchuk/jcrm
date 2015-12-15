class NotesController < ApplicationController
  before_action :require_user
  before_action :require_admin, only: [:unlink]

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = session[:user_id]

    if @note.save
      flash[:notice] = "Note successfully created!"
      redirect_to note_path(@note)
    else
      render :new
    end
  end

  def show
    @record_type = Note
    @record_id = params[:id]
    @note = Note.find(params[:id])
    @tab = params[:tab]
    @accounts = @note.accounts
    @contacts = @note.contacts
    @opportunities = @note.opportunities
    @user = current_user
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      flash[:notice] = "Note successfully updated!"
      redirect_to note_path(@note)
    else
      render :new
    end
  end

  def link
    @note = Note.find(params[:id])
    @current_record = params[:record_type].constantize.find(params[:record_id])

    if @current_record.notes.include?(@note)
      flash[:danger] = "'#{@current_record.search_display_name}' is already linked to '#{@note.search_display_name}'"
      redirect_to @current_record
    else
      @current_record.notes << @note
      flash[:notice] = "'#{@current_record.search_display_name}' successfully linked to '#{@note.search_display_name}'"
      redirect_to @current_record
    end
  end

  def unlink
    @note = Note.find(params[:id])
    @current_record = params[:record_type].constantize.find(params[:record_id])
    @current_record.notes.delete(@note)
    flash[:notice] = "'#{@note.search_display_name}' successfully unlinked from '#{@current_record.search_display_name}'"
    redirect_to @current_record
  end

  private

  def note_params
    params.require(:note).permit!
  end

end
