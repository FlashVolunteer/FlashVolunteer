class UsersController < ApplicationController
  load_and_authorize_resource
    

  def index
    @user = current_user
    @events = Event.joins(:participants).where('users.id' => @user.id) if @user
    
    if current_user == nil
      redirect_to events_url
    else
      render :action => "upcoming"
    end
  end
  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def upcoming
    @user = User.find(params[:id])
    @events = Event.joins(:participants).where('users.id' => @user.id)
  end

  def recommended
    @user = User.find(params[:id])
  end

  def stats
    @user = User.find(params[:id])
  end

  def team
    @user = User.find(params[:id])
  end
end
