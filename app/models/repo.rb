class Repo < ApplicationRecord
  belongs_to :project

  def create_new_repo user
    @client = Octokit::Client.new(access_token: user.github_oauth)
    @client.fork('eddroid/git2-c18')
    fetch_existing_repo_github_id user
  end

  def fetch_existing_repo_github_id user
    @client ||= Octokit::Client.new(access_token: user.github_oauth)
    @client.repos.each do |repo|
      if repo.name == self.name
        self.github_id = repo[:id]
      end
    end
    save! unless self.github_id.nil?
  end

end
