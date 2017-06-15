Playschool::App.controllers :groups do

  layout :application

  before :show, :edit, :update, :destroy do
    @group = Group.find(params[:id])
  end

  get :index do
    @groups = Group.includes(:kids).all
    render 'index'
  end

  get :new, map: '/groups/new' do
    @group = Group.new
    render 'new'
  end

  post :create do
    @group = Group.new(params[:group])
    if @group.save
      redirect url_for(:groups, :show, id: @group.id)
    else
      redirect url_for(:groups, :new)
    end
  end

  get :show, map: '/groups/:id' do
    render 'show'
  end

  get :edit, map: '/groups/:id/edit' do
    render 'edit'
  end

  put :update, map: '/groups/:id' do
    if @group.update(params[:group])
      redirect url_for(:groups, :show, id: @group.id)
    else
      redirect url_for(:groups, :edit, id: @group.id)
    end
  end

  delete :destroy, map: '/groups/:id' do
    if @group.delete
      redirect url_for(:groups, :index)
    else
      redirect url_for(:groups, :show, id: @group.id)
    end
  end

end
