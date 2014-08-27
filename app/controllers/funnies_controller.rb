class FunniesController < ApplicationController
	def index
		@funnieslist = FunnyThing.all
    @friendlist = Friend.all
    @button = "reverse"
	end

  def new
  end

  def create
    friend = Friend.find_by_name(params[:friend])
    friend ||= Friend.create({name: params[:friend]})

    link = FunnyThing.find_by_url(params[:url])

    FunnyThing.create({url: link, friend: friend}) unless link != nil
    redirect_to "/"
  end

  def reverse
    @funnieslist = FunnyThing.all.reverse
    @friendlist = Friend.all
    render "funnies/index"
    @button = ""

  end

  def remove
    @thing = FunnyThing.find(params[:id])
    @thing.destroy
    redirect_to "/"
  end

  def show
    @thing = FunnyThing.find(params[:id])
  end

  def friendpage
    friend = Friend.find_by_name(params[:name])
    @funnieslist = FunnyThing.where(friend: friend)
    @friendlist = Friend.all
    render "funnies/index"
  end



end
