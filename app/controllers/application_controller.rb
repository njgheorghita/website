class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def dashboard 
    if params[:code]
      @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
      random_number = (1..@spotify_user.top_tracks.size).to_a.sample
      @random_suggestion = @spotify_user.top_tracks[random_number]
      if @random_suggestion 
        @random_suggestion_uri = "https://embed.spotify.com/?uri=" + @random_suggestion.uri
      end
    end
  end

  def generate_commit_count(user, repo)
    github = Github.new
    collaborators = github.repos.stats.commit_activity user, repo
    commit_count = 0 
    collaborators.each do |collaborator|
      if collaborator.class == Fixnum
        commit_count += collaborator
      end
    end
    commit_count
    # @bike_share_commits     = bike_share.repos.commits.list( 'cews7','bike-share').count
    # mixmaster = Github.new
    # @mixmaster_commits      = mixmaster.repos.commits.list('njgheorghita','mix_master').count
    # black_thursday = Github.new
    # @black_thursday_commits = black_thursday.repos.commits.list('wlffann', 'black_thursday').count
    # job_tracker = Github.new
    # @job_tracker_commits    = job_tracker.repos.commits.list('njgheorghita', 'job-tracker').count
    # lobbify = Github.new
    # @lobbify_commits        = lobbify.repos.commits.list('drod1000', 'lobbify').count
  end

  def projects
    @bike_share_commits = generate_commit_count('cews7','bike-share')
  end

  def spotify
    byebug
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # Now you can access user's private data, create playlists and much more
    # Access private data
    # @spotify_user.country #=> "US"
    # @spotify_user.email   #=> "example@email.com"

    # Create playlist in user's Spotify account
    # playlist = @spotify_user.create_playlist!('my-awesome-playlist')

    # Add tracks to a playlist in user's Spotify account
    tracks = RSpotify::Track.search('Know')
    # playlist.add_tracks!(tracks)
    # playlist.tracks.first.name #=> "Somebody That I Used To Know"

    # Access and modify user's music library
    # @spotify_user.save_tracks!(tracks)
    # @spotify_user.saved_tracks.size #=> 20
    # @spotify_user.remove_tracks!(tracks)

    # albums = RSpotify::Album.search('launeddas')
    # @spotify_user.save_albums!(albums)
    # @spotify_user.saved_albums.size #=> 10
    # @spotify_user.remove_albums!(albums)

    # # Use Spotify Follow features
    # @spotify_user.follow(playlist)
    # @spotify_user.follows?(artists)
    # @spotify_user.unfollow(users)

    # # Get user's top played artists and tracks
    # @spotify_user.top_artists #=> (Artist array)
    # @spotify_user.top_tracks(time_range: 'short_term') #=> (Track array)

    # Check doc for more

    redirect_to root_path

  end
end
