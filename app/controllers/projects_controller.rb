class ProjectsController < ApplicationController
  before_action :set_project_secret
  def show

  end

  private
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
end