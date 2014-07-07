# show

get '/survey/:survey_id/responses' do
  @survey = Survey.find(params[:survey_id])
  if @survey == nil
    @error = true
  end
  erb :"survey_views/results"
end