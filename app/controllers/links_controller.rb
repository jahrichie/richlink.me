class LinksController < ApplicationController


  # NOT NEEDED USING THIS IN NEW
  # GET /links
  # GET /links.json
  # def index
  #   @links = Link.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @links }
  #   end
  # end


  def paginate_all_links
    @links = Link.search(params[:search], params[:page])
  end
  

  def index
    # pismo_grab_meta_data
    paginate_all_links
    @link = Link.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link }
    end
  end
  
  # GET /links/1
  # GET /links/1.json
  def show
    @link = Link.find(params[:id])
    paginate_all_links
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/new
  # GET /links/new.json

  def new
    # pismo_grab_meta_data
    paginate_all_links
    @link = Link.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/1/edit
  def edit

    @link = Link.find(params[:id])
    paginate_all_links
    render :layout => false
  end

  # POST /links
  # POST /links.json
  def create

    @link = Link.new(params[:link])
    doc = Pismo::Document.new(@link.url) 
    #grab metadata from url
    if !doc.title.nil?
      @link.name = doc.description
    else
      @link.name = doc.title
    end
    @link.favicon = doc.favicon

    paginate_all_links
    respond_to do |format|
      if @link.save
        format.html { redirect_to root_url+"#show-links", notice: 'Link was successfully created.' }
        format.json { render json: @link, status: :created, location: @link }
      else
        format.html { render action: "new" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /links/1
  # PUT /links/1.json
  def update
    @link = Link.find(params[:id])
    paginate_all_links
    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to root_url+"#show-links", notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to root_url+"#show-links", notice: 'Link was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
