class NewsReleaseBrowserPortlet < Portlet
  
  def renderer(portlet)
    lambda do
      locals = {}
      if portlet.category_id
        locals[:category] = Category.find(portlet.category_id)
        locals[:releases] = NewsRelease.all(:conditions => ["category_id = ?", locals[:category]], :order => "release_date desc")
      else
        locals[:releases] = NewsRelease.all(:order => "release_date desc")
      end
      render :partial => portlet.partial, :locals => locals
    end
  end
    
end