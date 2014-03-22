get '/' do
  # session.clear
  @surveys = Survey.all
  erb :index
end

# not_found do
#   erb:
# end


