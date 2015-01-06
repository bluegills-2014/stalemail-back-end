

get '/users/:email_address/emails' do
  our_token = "06ac86a96e3d4cbb9eb74343f03fdc67"
  route_snippet = "http://dbc-mail.herokuapp.com/api/"
  route = route_snippet + "#{params[:email_address]}/messages?api_token=#{our_token}"
  @result = Net::HTTP.get_response(URI(route))
  case @result.code
  when '200'
    @user_email_json = parse_XML_to_JSON(@result.body)
    erb :"/emails/index"
  when '404'
    "these are not the pages you are looking for"
  when '429'
    "chill out"
  when '502'
    "it's not you it's me"
  else
    @result.code
  end
end

