class ArtistsController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @artist_pages, @artists = paginate :artists, :per_page => 10
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(params[:artist])
    if @artist.save
      flash[:notice] = 'Artist was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      flash[:notice] = 'Artist was successfully updated.'
      redirect_to :action => 'show', :id => @artist
    else
      render :action => 'edit'
    end
  end

  def destroy
    Artist.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
