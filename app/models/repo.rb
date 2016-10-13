class Repo
  attr_reader :name, :url, :owner

  def initialize(repo)
    @name = repo[:name]
    @url = repo[:html_url]
    @owner = repo[:owner][:id].to_s
  end
end
