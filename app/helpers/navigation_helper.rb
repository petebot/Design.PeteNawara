module NavigationHelper
  def navigation_nodes
    [
      {:title => Admin::Client.model_name.human.pluralize, :path => admin_clients_path},
      {:title => Admin::Tool.model_name.human.pluralize, :path => admin_tools_path}
    ]
  end
end
