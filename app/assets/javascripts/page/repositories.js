jQuery(document).ready(function($) {
  $('.repositories .repository .inner').hide()
  $('.repositories .repository a.name').click(function(e) {
    var parent = $(this).parents(".repository")

    var commits_loading_status = parent.attr('data-commits-loaded')
    if(commits_loading_status == null) {
      parent.attr('data-commits-loaded', 'loading')
      var repository_id = parseInt(parent.attr('data-repo-id'))
      
      var repositories = parent.parents(".repositories")
      var repository_api_path = repositories.attr('data-repo-api')
      var repository_path = repository_api_path.replace(/:repo_id/, repository_id)

      $.get(repository_path, function(data) {
        var commits_place = parent.find('.commits')
        var commits_str = ""
        for(var i in data.commits) {
          var commit = data.commits[i]
          commits_str += JST['page/commit']({repository: data, commit: commit})
        }
        commits_place.append(commits_str)
        parent.attr('data-commits-loaded', 'loading completed')
      })
    }

    parent.toggleClass("opened")
    parent.find('.inner').toggle()

    e.preventDefault()
  })
})
