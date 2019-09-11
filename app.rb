require 'sinatra/base'
require './lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  post '/add' do
    Bookmarks.create(url: params[:url], title: params[:title])
    redirect '/bookmarks/new'
  end

  get '/bookmarks/new' do
    @bookmarks = Bookmarks.all
    erb(:show_bookmarks)
  end


  run! if app_file == $0
end
