class ProjectsController < ApplicationController
  before_action :set_project_secret
  caches_action :index, cache_path: :path_for_index_cache
  caches_action :show, cache_path: :path_for_show_cache

  def show

  end

  def set_project_secret
    @secret_key = params[:id]
    @script_path = if params[:env] == 'production'
                     "https://widget.getgist.com"
                   else
                     "https://widget-testing.getgist.com"
                   end
    # <script>
    #   (function(d,h,w){var gist=w.gist=w.gist||[];gist.methods=['trackPageView','identify','track','setAppId'];gist.factory=function(t){return function(){var e=Array.prototype.slice.call(arguments);e.unshift(t);gist.push(e);return gist;}};for(var i=0;i<gist.methods.length;i++){var c=gist.methods[i];gist[c]=gist.factory(c)}s=d.createElement('script'),s.src="<%= ENV['SCRIPT_PATH'] %>",s.async=!0,e=d.getElementsByTagName(h)[0],e.appendChild(s),s.addEventListener('load',function(e){},!1),gist.setAppId("<%= @project.secret_key unless @project.nil? %>"),gist.trackPageView()})(document,'head',window);
    #   </script>
  end

  def path_for_show_cache
    "cache_project_#{@secret_key}"
  end

  def path_for_index_cache
    "cache_project_index"
  end
end