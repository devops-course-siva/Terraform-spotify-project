resource "spotify_playlist" "Pk_hits" {
  name = "Pspk Hits"
  tracks = [ "7vzsGnsgEAvpR7G0oYDPfV" , "2qFuMG7RbmnNG6cErUGxnK" ]
}


data "spotify_search_track" "ani_hits" {
  artist = "Anirudh Ravichander"
}

resource "spotify_playlist" "AnirudhPlaylist" {
  name        = "Ani_playlist"
  description = "This is the playlist with Anirudh songs"
    public = true


  tracks =  [data.spotify_search_track.ani_hits.tracks[0].id,
            data.spotify_search_track.ani_hits.tracks[1].id,
            data.spotify_search_track.ani_hits.tracks[2].id,
            data.spotify_search_track.ani_hits.tracks[3].id,
            data.spotify_search_track.ani_hits.tracks[5].id,
            data.spotify_search_track.ani_hits.tracks[6].id,
            data.spotify_search_track.ani_hits.tracks[7].id,
            data.spotify_search_track.ani_hits.tracks[8].id]
            
}

data "spotify_search_track" "AR" {
  artist = "AR Rehman"
  limit = 10
}

resource "spotify_playlist" "Ar_hits" {
  name = "AR_hits"
  tracks = flatten([ data.spotify_search_track.AR.tracks[*].id ])
}

