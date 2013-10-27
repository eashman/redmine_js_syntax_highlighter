module Redmine
  module SyntaxHighlighting
    module JSHighter
      
      DEFAULT_THEME = "Default"
      THEMES = %w[
          Default
          Django
          Eclipse
          Emacs
          FadeToGrey
          MDUltra
          Midnight
          RDark
      ]   
         
      class << self
        def highlight_by_filename(text, filename, encoding=true)
          require 'coderay/helpers/file_type'
          language = ::CodeRay::FileType[filename]
          text = ERB::Util.h(text) if encoding
          language = :plaintext if [:yaml, :scheme, :debug].include?(language) 
          #"<pre class=\"brush: #{language}\">#{text}</pre>"
          text
        end
        
        def highlight_by_language(text, language, encoding=true)
          language = :plaintext if [:yaml, :scheme, :debug].include?(language) 
          text = ERB::Util.h(text) if encoding
          "<pre class=\"brush: #{language}\">#{text}</pre>"
        end
        
        def theme
            ## User selection of highlighter Theme
            User.current.custom_value_for(CustomField.first(:conditions => {:name => 'JSHighter Theme'})) || JSHighter::DEFAULT_THEME
        end
      end
    end
  end
end
