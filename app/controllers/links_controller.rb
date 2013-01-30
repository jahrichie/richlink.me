class LinksController < ApplicationController
 # require 'pismo'
 #  before_filter :pismo_grab_meta_data

 #  def pismo_grab_meta_data
 #    doc = Pismo::Document.new("http://www.rubyflow.com/items/4082")
 #    @link_title = doc.author
 #  end
  

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
    @links = Link.paginate(:page => params[:page], :per_page => 5)
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
  end

  # POST /links
  # POST /links.json
  def create

    @link = Link.new(params[:link])
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
