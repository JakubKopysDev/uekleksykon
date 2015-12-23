class TermsController < ApplicationController
autocomplete :term, :phrase

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

  def destroy
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
      @terms = Term.all.order("phrase ASC").page(params[:page])
    end
  end

  def show
    @term = Term.find(params[:id])
  end

  private

    def term_params
      params.require(:term).permit(:phrase, :explanation)
    end

end
