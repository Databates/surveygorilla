helpers do
  include Rack::Utils
  alias_method :h, :escape_html

  def top_creators
    Survey.order("count_all desc").limit(10).group(:creator).count
  end
end