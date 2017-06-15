Playschool::App.controllers :kids do

  layout :application

  before :show, :edit, :update, :destroy do
    @kid = Kid.find(params[:id])
  end

  get :index do
    @kids = Kid.includes(:group).all
    render 'index'
  end

  get :new, map: '/kids/new' do
    @kid = Kid.new
    render 'new'
  end

  post :create do
    @kid = Kid.new(params[:kid])
    if @kid.save
      redirect url_for(:kids, :show, id: @kid.id)
    else
      redirect url_for(:kids, :new)
    end
  end

  get :show, map: '/kids/:id' do
    render 'show'
  end

  get :edit, map: '/kids/:id/edit' do
    render 'edit'
  end

  put :update, map: '/kids/:id' do
    if @kid.update(params[:kid])
      redirect url_for(:kids, :show, id: @kid.id)
    else
      redirect url_for(:kids, :edit, id: @kid.id)
    end
  end

  delete :destroy, map: '/kids/:id' do
    if @kid.delete
      redirect url_for(:kids, :index)
    else
      redirect url_for(:kids, :show, id: @kid.id)
    end
  end

end
