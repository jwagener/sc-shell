{
  :oauth => {
    :access_token_key     => nil,
    :access_token_secret  => nil,
  },
  
  :audiofinder_db => 'path/to/audiofinder/db',
  
  :defaults => {
    :set => {
      :public => true,
      :description => '',
      
    },
    
    :tracks => {
      :public => true,
      :streamable => true,
      :downloadable => true,
      :tags => [],
      :description => "Part of sample collection",
      :type => 'sample',
    }
  },
}
