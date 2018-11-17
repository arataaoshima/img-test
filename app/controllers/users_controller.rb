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
  
  def avatar
    @user = User.find(params[:id])
    send_data(@user.avatar, type: @user.avatar_content_type, disposition: :inline)
  end
  
  def update
     @user = User.find_by(id: params[:id])
     @user.name = params[:name]
     @user.user_image = :"#{@user.id}.jpg"
     
     @user.avatar = params[:user_image].read # <= バイナリをセット
     @user.avatar_content_type = params[:user_image].content_type # <= ファイルのタイプを保存(拡張子タイプ)
    
     if @user.save
       
       #これでセット
       #image = params[:user_image]
       #File.binwrite("app/assets/images/#{@user.id}.jpg", image.read)
       # <%= image_tag(user.user_image, :size => "40x40") %>
       
      
       #File.binwrite("public/images/#{@user.id}.jpg", image.read)
       #<img src="<%= "/images/#{user.user_image}" %>" class="user_images">
       
       redirect_to("/users")
     else
       redirect_to("/users")
     end
  end
  
end
