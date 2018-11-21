class ArtistsController < ApplicationController

  # ========================YOUTUBE api===========================

  #require 'rubygems'
  #require 'google/api_client'
  #require 'trollop'

  # Set DEVELOPER_KEY to the API key value from the APIs & auth > Credentials
  # tab of
  # Google Developers Console <https://console.developers.google.com/>
  # Please ensure that you have enabled the YouTube Data API for your project.

  # YOUTUBE_SCOPE = 'https://www.googleapis.com/auth/youtube'
  # DEVELOPER_KEY = 'AIzaSyDLIMw5XgtQhXJ6dDFdOPuMq_U7s73a22U'
  # YOUTUBE_API_SERVICE_NAME = 'youtube'
  # YOUTUBE_API_VERSION = 'v3'

  # ======================== end ===========================

  def index
    @artists = Artist.all.order(artist_kana: "ASC")
  end


  def new
    @artist = Artist.new
    @artist.thumbnails.build
  end

  def create
    artist = Artist.new(artist_params)
    artist.save
    redirect_to artists_path
  end




  def show
    @artist = Artist.find_by(id: params[:id])

    # ========================YOUTUBE api===========================
    # com_line_oath_helper = CommandLineOAuthHelper.new(YOUTUBE_SCOPE)
    # get_data(@artist.artist_name)
    # ======================== end ===========================
  end

  def edit
    @artist = Artist.find_by(id: params[:id])
  end

  def update
    artist = Artist.find_by(id: params[:id])
    artist.update(artist_params)
    redirect_to artist_path(artist)
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to artists_path
  end

  private

    def artist_params
        params.require(:artist).permit(:artist_name, :artist_details, :artist_kana, thumbnails_images: [])
    end


# ========================YOUTUBE api===========================



  # def get_service
  #   client = Google::APIClient.new(
  #     :key => DEVELOPER_KEY,
  #     :authorization => nil,
  #     :application_name => $PROGRAM_NAME,
  #     :application_version => '1.0.0'
  #   )
  #   # binding.pry
  #   youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

  #   return client, youtube
  # end


  # def get_data(keyword)
  #   require 'movie.rb'#modelで準備したファイルを呼ぶ
  #   opts = Trollop::options do
  #     opt :q, 'Search term', :type => String, :default => keyword #defaultの内容を検索したいワードにする
  #     opt :max_results, 'Max results', :type => :int, :default => 4 #検索結果数を決める（最大50まで）
  #     opt :order, 'order', :type => String, :default => 'viewCount' #視聴回数の多い順にデータを取得する
  #     opt :regionCode, 'region', :type => String, :default => 'JP' #指定された国で使用できるガイド カテゴリのリストを返すように API に指示
  #   end

  #   client, youtube = get_service  # movie.rbモデル内部のメソッド。

  #   begin
  #     # Call the search.list method to retrieve results matching the specified
  #     # query term.
  #     search_response = client.execute!(
  #       :api_method => youtube.search.list,
  #       :parameters => {
  #         :part => 'snippet',
  #         :q => opts[:q],
  #         :maxResults => opts[:max_results]
  #       }
  #     )

  #     videos = []
  #     channels = []
  #     playlists = []

  #     # Add each result to the appropriate list, and then display the lists of
  #     # matching videos, channels, and playlists.
  #     search_response.data.items.each do |search_result|
  #       case search_result.id.kind
  #         when 'youtube#video'
  #           videos << "#{search_result.snippet.title} (#{search_result.id.videoId})"
  #         when 'youtube#channel'
  #           channels << "#{search_result.snippet.title} (#{search_result.id.channelId})"
  #         when 'youtube#playlist'
  #           playlists << "#{search_result.snippet.title} (#{search_result.id.playlistId})"
  #       end
  #     end

  #     puts "Videos:\n", videos, "\n"
  #     puts "Channels:\n", channels, "\n"
  #     puts "Playlists:\n", playlists, "\n"
  #   rescue Google::APIClient::TransmissionError => e
  #     puts e.result.body
  #   end
  # end

  # ======================== end ===========================
end
