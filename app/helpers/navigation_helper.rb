module NavigationHelper
  def navigation_nodes
    [
      {:title => Client.model_name.human.pluralize, :path => clients_path},
      {:title => Project.model_name.human.pluralize, :path => projects_path},
      {:title => Tool.model_name.human.pluralize, :path => tools_path}
    ]
  end
end
