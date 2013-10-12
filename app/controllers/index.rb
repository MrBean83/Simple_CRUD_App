get '/' do
  @posts = Post.all
  erb :index
end

get '/new_post' do
  erb :new_post
end

post '/create_post' do
  @post = Post.create(title: params[:post][:title], description: params[:post][:description])
  redirect '/'
end

get '/show_post/:id' do
  @post = Post.find(params[:id])
  erb :show_post
end

get '/edit_post/:id' do
  @post = Post.find(params[:id])
  erb :edit_post
end

post '/update_post/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])
  redirect '/'
end

get '/delete_post/:id' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/'
end
