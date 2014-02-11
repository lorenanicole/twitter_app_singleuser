# require 'pry'

get '/' do
 erb :index
end

post '/tweet' do
  puts params
  success = $client.update(params[:tweeting])
  # binding.pry
  if success.class == Twitter::Tweet
    string = "<h2>Success</h2>"
  else
    string = "<h2>Houston we have a problem!</h2>"
  end
end

post '/temp' do
  puts params
  @user = TwitterUser.find_by_username(params[:username])
  if @user == nil
    @user = TwitterUser.create(username: params[:username])
    @user.fetch_tweets!
  else
    @user.tweets_stale?
  end
  @tweets = @user.tweets.all
  string = "<ul>"
  @tweets.each do |tweet|
    string += "<li>#{tweet.body}</li>"
  end
  string += "</ul>"
  string
end
