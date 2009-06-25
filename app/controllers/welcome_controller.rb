class WelcomeController < ApplicationController
  
  def index
    # TODO: maybe it would be better to sort them by activity, showing first the ones with recent posts
    @users = User.find(:all, :order => 'name', :include => [:projects])
    @entries = Entry.find(:all, :limit => 25, :order => 'published desc', :include => [:feed => :user])
    @projects = Project.find(:all, :order => 'name', :include => :users)
  end

end