Playschool::App.controllers :groups do

  layout :application

  before :show, :edit, :update do
    @group = Group.includes(:kids).find(params[:id])
  end

  get :new, map: '/groups/new' do
    @group = Group.new
    @group.kids.new
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

end
