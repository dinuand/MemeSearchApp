 class MemesController < ActionController::Base
  before_action :set_meme, only: [:show, :edit, :update, :destroy]
    
  def search
    #DO NOTHING
    @color = ["blue", "red", "orange","green", "red" ,"gray", "blue"]
  end

  def performsearch
    #DO NOTHING
    session[:itemtosearch] = params[:itemtosearch]
    redirect_to '/searchresults'
  end

  def searchresults

    @raw_input = session[:itemtosearch].downcase

    @sanitized_input = @raw_input.gsub(/[^a-zA-Z0-9 ]/, "")
    @result = @sanitized_input.split(" ")
    @VObj = []
    @result.each do |item|
      @tmp = Keyword.where(:key => item).map(&:memes).flat_map {|i| i }
      @tmp.each do |el|
        @VObj << el.id
      end
    end
    h = Hash.new
    @VObj.each do |entry|
      h[entry] = h[entry].to_i + 1;
    end  

    @vector_to_sort = h.to_a
    @vector_to_sort.sort! { |a, b|  b[1] <=> a[1] }

    
    @results = Meme.find(@vector_to_sort.map { |innervector| innervector[0]}).reverse
    render 'searchresults'
  end
 
  # GET /memes
  # GET /memes.json
  def index
    @memes = Meme.all
  end

  # GET /memes/1
  # GET /memes/1.json
  def show
  end

  # GET /memes/new
  def new
    @meme = Meme.new

  end

  # GET /memes/1/edit
  def edit
  end

  # POST /memes
  # POST /memes.json
  def create
    @meme = Meme.new(meme_params)
    respond_to do |format|
      if @meme.save
        items = @meme.keywords_string.split(" ")
        items.each do |item| 
          attrs = { :key => item }
          @keyword = Keyword.new(attrs)
          if @keyword.save
            Mapping.create(:meme_id => @meme.id, :keyword_id => @keyword.id)
          end
        end
        format.html { redirect_to @meme, notice: 'Meme was successfully created. Keywords were successfully added' }
        format.json { render :show, status: :created, location: @meme }
      else
        format.html { render :new }
        format.json { render json: @meme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memes/1
  # PATCH/PUT /memes/1.json
  def update
    respond_to do |format|
      if @meme.update(meme_params)
        items = @meme.keywords_string.split(" ")
        items.each do |item| 
          attrs = { :key => item}
          @keyword = Keyword.new(attrs)
          if @keyword.save
            Mapping.create(:meme_id => @meme.id, :keyword_id => @keyword.id)
          end
        end
        format.html { redirect_to @meme, notice: 'Meme was successfully updated.' }
        format.json { render :show, status: :ok, location: @meme }
      else
        format.html { render :edit }
        format.json { render json: @meme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memes/1
  # DELETE /memes/1.json
  def destroy
    @meme.destroy
    respond_to do |format|
      format.html { redirect_to memes_url, notice: 'Meme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meme
      @meme = Meme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meme_params
      params.require(:meme).permit(:title, :keywords_string, :url, :rating)
    end

end

# Meme.last.keywords.map(&:key).join(' ')
