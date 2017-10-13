class Project < ApplicationRecord
  has_and_belongs_to_many :collaborators, class_name: 'User'
  has_one :board
  has_one :repo

  validates :due_by, presence: true

  def new_project_steps user, project_params
    create_project_repo user, project_params
    create_project_board
  end

  private

  def create_project_repo user, project_params
    self.name = project_params[:name]
    self.due_by = project_params[:due_by]
    self.user_id = user.id
    if (project_params[:repo_id] == '1')
      repo = Repo.new(name: name, project: self)
      repo.fetch_existing_repo_github_id(user)
    else
      repo = Repo.new(name: name, project: self)
      repo.create_new_repo(user)
    end
  end

  def create_project_board
    if self.save! && self.board.nil?
      Board.new.add_to_trello User.find(self.user_id), self
    else
      Board.find(self.board.id)
    end
  end
end
