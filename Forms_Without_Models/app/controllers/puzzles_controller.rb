class PuzzlesController < ApplicationController
  before_action :set_puzzle, only: [:show, :edit, :update, :destroy]

  # GET /puzzles
  # GET /puzzles.json
  def index
    @puzzles = Puzzle.all
  end

  # GET /puzzles/1
  # GET /puzzles/1.json
  def show
  end

  # GET /puzzles/new
  def new

  end

  # GET /puzzles/1/edit
  def edit
  end

  # POST /puzzles
  # POST /puzzles.json
  def create
   # @puzzle = Puzzle.new(puzzle_params)
    @puzzle_name = params[:puzzle_name]
    @word_list = params[:word_list]

    pdf = Puzzle.new(@puzzle_name, @word_list)
    send_data pdf.render, filename: "#{@puzzle_name}.pdf", type: 'application/pdf'


   # respond_to do |format|
   #   format.html #{ render :inline => "Got Here" }
   #   format.pdf do

   #   end
    #end
    #  if @puzzle.save
    #    format.html { redirect_to @puzzle, notice: 'Puzzle was successfully created.' }
    #    format.json { render :show, status: :created, location: @puzzle }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @puzzle.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /puzzles/1
  # PATCH/PUT /puzzles/1.json
  def update

   respond_to do |format|
     if @puzzle.update(puzzle_params)
       format.html { redirect_to @puzzle, notice: 'Puzzle was successfully updated.' }
       format.json { render :show, status: :ok, location: @puzzle }
     else
       format.html { render :edit }
       format.json { render json: @puzzle.errors, status: :unprocessable_entity }
     end
   end
  end

  # DELETE /puzzles/1
  # DELETE /puzzles/1.json
  def destroy
    @puzzle.destroy
    respond_to do |format|
      format.html { redirect_to puzzles_url, notice: 'Puzzle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_puzzle
      @puzzle = Puzzle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def puzzle_params
      params.require(:puzzle).permit(:new, :show)
    end
end
