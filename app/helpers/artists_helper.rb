module ArtistsHelper
	def get_data(keyword)
	require 'movie.rb'#modelで準備したファイルを呼ぶ
	opts = Trollop::options do
    opt :q, 'Search term', :type => String, :default => keyword #defaoultの内容を検索したいワードにする
    opt :max_results, 'Max results', :type => :int, :default => 4 #検索結果数を決める（最大50まで）
    opt :order, 'order', :type => String, :default => 'viewCount' #視聴回数の多い順にデータを取得する
    opt :regionCode, 'region', :type => String, :default => 'JP' #指定された国で使用できるガイド カテゴリのリストを返すように API に指示
  end

  client, youtube = get_service

  begin
    # Call the search.list method to retrieve results matching the specified
    # query term.
    search_response = client.execute!(
      :api_method => youtube.search.list,
      :parameters => {
        :part => 'snippet',
        :q => opts[:q],
        :maxResults => opts[:max_results]
      }
    )

    videos = []
    channels = []
    playlists = []

    # Add each result to the appropriate list, and then display the lists of
    # matching videos, channels, and playlists.
    search_response.data.items.each do |search_result|
      case search_result.id.kind
        when 'youtube#video'
          videos << "#{search_result.snippet.title} (#{search_result.id.videoId})"
        when 'youtube#channel'
          channels << "#{search_result.snippet.title} (#{search_result.id.channelId})"
        when 'youtube#playlist'
          playlists << "#{search_result.snippet.title} (#{search_result.id.playlistId})"
      end
    end

    puts "Videos:\n", videos, "\n"
    puts "Channels:\n", channels, "\n"
    puts "Playlists:\n", playlists, "\n"
  rescue Google::APIClient::TransmissionError => e
    puts e.result.body
  end
end


end
