class SearchMoviesService
  def self.do(name)
    movies = Movie.search_and_get(name)
 end
end
