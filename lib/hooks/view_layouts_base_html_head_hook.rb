module Redmine
  module SyntaxHighlighting
    module JSHighter
	
      class ViewLayoutsBaseHtmlHeadHook < Redmine::Hook::ViewListener
        def view_layouts_base_html_head(context)
          if context[:controller]
            #js_path  = ActionView::Helpers::AssetTagHelper.plugin_asset_path('redmine_js_syntax_highlighter', 'javascripts', '')
            js_path =  "#{Redmine::Utils.relative_url_root}/plugin_assets/redmine_js_syntax_highlighter/javascripts/"
            js_theme = Redmine::SyntaxHighlighting::JSHighter.theme != '' ?  "Default" :  Redmine::SyntaxHighlighting::JSHighter.theme
            stylesheet_link_tag('shCore.css', :plugin => 'redmine_js_syntax_highlighter') +
            stylesheet_link_tag("shTheme#{js_theme}.css", :plugin => "redmine_js_syntax_highlighter") +
            javascript_include_tag('shCore.js', :plugin => 'redmine_js_syntax_highlighter') +
            javascript_include_tag('shAutoloader.js', :plugin => 'redmine_js_syntax_highlighter') +
            javascript_include_tag('shAutoLoadAll.js', :plugin => 'redmine_js_syntax_highlighter') +
            javascript_tag("$(document).ready(function () {$('pre code.syntaxhl').removeClass().unwrap();$('pre[class*=brush]').wrap('<pre></pre>'); shLoadAllSyntaxHighlighters(\"#{js_path}\");});")
          end
        end
      end

	end
  end
end
