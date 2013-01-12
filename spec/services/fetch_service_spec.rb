require 'spec_helper'

describe "Fetch service" do

  subject { Fetchers::FetchService }

  before do
    create_list(:published_repository, 3, :source => :github)

    @previous_commit = Repository.first.commits.first

    Fetchers::GithubCommits.any_instance.stub(:api_get_commits).and_return(
      [
        [
          {
            'sha' => '1'
          },
          {
            'sha' => '2'
          }
        ]
      ]
    )

    Fetchers::GithubCommits.any_instance.stub(:api_get_commit).with("1").and_return(
      {
        'stats' => {
          'additions' => '1',
          'deletions' => '1'
        },
        'commit' => {
          'message' => '1-m',
          'committer' => {
            'date' => Time.now
          }
        }
      }
    )

    Fetchers::GithubCommits.any_instance.stub(:api_get_commit).with("2").and_return(
      {
        'stats' => {
          'additions' => '3',
          'deletions' => '1'
        },
        'commit' => {
          'message' => '2-m',
          'committer' => {
            'date' => Time.now
          }
        }
      }
    )
  end

  describe "fetch repositories" do
    before do
      subject.fetch_all!
    end

    let(:some_repository) { Repository.first }

    it "should update commits" do
      some_repository.commits.size.should be 2
      some_repository.commits.map(&:message).should == ["1-m", "2-m"]

      previous_commit = Commit.where(:id => @previous_commit.id).first
      previous_commit.should_not be
    end

    it "should update repository committed_changes counter" do
      some_repository.committed_changes.should be 6
    end
  end
end
