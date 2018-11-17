class UsersController < ApplicationController
    
  def index
      @users = User.all
  end
  
  def new
  end
  
  def create
      @user = User.new
      @user.name = params[:name]
      @user.user_image = "original.jpg"
      @user.save
          redirect_to("/users")
  end
  
  def  edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
     @user = User.find_by(id: params[:id])
     @user.name = params[:name]
     @user.user_image = :"#{@user.id}.jpg"
     if @user.save
       image = params[:user_image]
       
       #これでセット
       #File.binwrite("app/assets/images/#{@user.id}.jpg", image.read)
       # <%= image_tag(user.user_image, :size => "40x40") %>
      
       File.binwrite("public/images/#{@user.id}.jpg", image.read)
       redirect_to("/users")
     else
       redirect_to("/users")
     end
  end
  
end
