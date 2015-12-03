class NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.noteable = Account.first    # placeholder until record linking added
    @note.user_id = 1    # placeholder until authentication added

    if @note.save
      flash[:notice] = "Note successfully created!"
      redirect_to note_path(@note)
    else
      render :new
    end
  end

  def show
    @note = Note.find(params[:id])
    @tab = params[:tab]
    @record_type = "note"
    @accounts = @note.accounts
    @contacts = @note.contacts
    @opportunities = @note.opportunities
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

  private

  def note_params
    params.require(:note).permit!
  end
end
