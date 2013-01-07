class RepositoryWithCommitsPresenter < Hash 
  def initialize(repository)
    super()
    
    merge!(
      :name => repository.name,
      :description => repository.description,
      :summary => repository.summary,
      :committed_changes => repository.committed_changes,
      :source => repository.source,
      :owner => repository.owner,
      :author => repository.author,
      :commits => repository.commits.by_id.map(&:attributes)
    )
  end
end
