Playschool::App.controllers :kids do

  layout :application

  get :index do
    render 'index'
  end

  get :new, map: '/kids/new' do
    render 'new'
  end

  post :create do
    redirect url_for(:kids, :show, id: @kid.id)
  end

  get :show, map: '/kids/:id' do
    render 'show'
  end

  get :edit, map: '/kids/:id/edit' do
    render 'edit'
  end

  put :update, map: '/kids/:id' do
    redirect url_for(:kids, :show, id: @kid.id)
  end

  delete :destroy, map: '/kids/:id' do
    redirect url_for(:kids, :index)
  end

end
