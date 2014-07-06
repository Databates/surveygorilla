helpers do
    include Rack::Utils
    alias_method :h, :escape_html

    def top_creators
      creator_counts = Survey.order("count_all desc").limit(10).group(:creator).count
      # creator_counts.sort_by { |user, count| count }
    end
end