class ComicsController < ApplicationController

  def index
    @comics = Comic.all
  end

  def show
    the_comic_id = params["comic_id"]
    @comic = Comic.find_by(:id => the_comic_id)
    if @comic == nil
      render "index"
    end
  end

  def destroy
    the_comic_id = params["comic_id"]
    c = Comic.find_by(:id => the_comic_id)
    if c == nil
      render "index"
    else
      c.destroy
      redirect_to "/comics"
    end
  end

  def new
    @comic = Comic.new
  end

  def create
    @err = ""
    @comic = Comic.new
    @comic.title = params["title"]
    @comic.description = params["description"]
    @comic.image = params["image"]
    if params["title"] != ""
      if @comic.save
        redirect_to "/comics"
      else
        render "new"
      end
    else
      @err = "Title field should not be empty"
      render "new"
    end
  end

end
