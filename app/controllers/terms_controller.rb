class TermsController < ApplicationController
autocomplete :term, :phrase
before_action :find_term, only: [:show, :edit, :destroy, :update]
before_filter :authenticate_admin, only: [:edit, :destroy, :update, :new]

  def new
    @term = Term.new
  end

  def create
    @term = Term.new term_params
    if @term.save
      redirect_to terms_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @term.update term_params
      redirect_to terms_path
      flash[:success] = "Term updated!"
    else
      redner 'edit'
    end
  end

  def destroy
    @term.delete
    redirect_to terms_path
    flash[:notice] = "Term successfuly deleted."
  end

  def index
    if params[:search]
      unless /^ +/.match(params[:search]) || /%+/.match(params[:search])
        @terms = Term.where(['phrase LIKE :search OR explanation LIKE :search', search: "%#{params[:search]}%"]).order("phrase ASC").page(params[:page])
        if params[:search].length == 1 # Check if searched by clicking on Alphabet letter on index page.
          #@terms = Term.where(['phrase LIKE :search', search: "%#{params[:search]}%"]).order("phrase ASC")
          @terms = Term.where(['substr(phrase, 1, 1) LIKE :search', search: "%#{params[:search]}%"]).order("phrase ASC").page(params[:page])
        end
        if @terms.count == 0
          flash[:notice] = "No terms found."
          redirect_to :back
        end
      else
        flash[:notice] = "Błędny format."
        redirect_to :back
      end
    else
      #@terms = Term.all.order("phrase ASC").page(params[:page])
      @terms = Term.all.order("created_at DESC").page(params[:page])
    end
  end

  def show
  end

  private

    def term_params
      params.require(:term).permit(:phrase, :explanation)
    end

    def find_term
      @term = Term.find(params[:id])
    end

    def authenticate_admin
      unless admin_signed_in?
        redirect_to root_path
        flash[:danger] = "Tylko administrator ma tu dostęp."
      end
    end
end
