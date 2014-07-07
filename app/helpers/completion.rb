helpers do
  def top_surveys
    Completion.order("count_all desc").limit(10).group(:survey).count
  end
end