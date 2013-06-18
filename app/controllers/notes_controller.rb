class NotesController < ApplicationController

  before_filter :authenticate_user

  def create
    @note = params[:id] ? Note.find(params[:id]) : Note.new
    @note.attributes = params[:note]
    @note.user = current_user
    valid = @note.save
    render json: @note, status: (valid ? 200 : 422)
  end
  alias update create

  def index
     respond_to do |format|
       format.html
       format.json {
         render json: current_user.notes.all
       }
     end
  end

end
