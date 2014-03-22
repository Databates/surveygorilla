get '/' do
  # session.clear
  erb :index
end

not_found do
  erb
end


