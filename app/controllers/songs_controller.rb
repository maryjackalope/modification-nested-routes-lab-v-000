if params[:artist_id] && !Artist.exists?(params[:artist_id])
        redirect_to artists_path, alert: "Artist not found"
    else
      @song = Song.new(artist_id: params[:artist_id])
    end
  end
   def create
@@ -39,7 +43,17 @@ def create
  end
   def edit
    @song = Song.find(params[:id])
    if params[:artist_id]
      artist = Artist.find_by_id(params[:artist_id])
      if artist.nil?
        redirect_to artists_path, alert: "Artist not found"
      else
        @song = artist.songs.find_by_id(params[:id])
        redirect_to artist_songs_path(artist), alert: "Song not found" if @song.nil?
      end
    else
      @song = Song.find(params[:id])
    end
  end
  
   def update
@@ -64,7 +78,6 @@ 

def destroy
  private
  
   def song_params
    params.require(:song).permit(:title, :artist_name)
    params.require(:song).permit(:title, :artist_name, :artist_id)
  end
end