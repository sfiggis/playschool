Playschool::App.controllers :groups do

  layout :application

  get :index do
    render 'index'
  end

  get :new, map: '/groups/new' do
    render 'new'
  end

  post :create do
    redirect url_for(:groups, :show, id: @group.id)
  end

  get :show, map: '/groups/:id' do
    render 'show'
  end

  get :edit, map: '/groups/:id/edit' do
    render 'edit'
  end

  put :update, map: '/groups/:id' do
    redirect url_for(:groups, :show, id: @group.id)
  end

  delete :destroy, map: '/groups/:id' do
    redirect url_for(:groups, :index)
  end

end
