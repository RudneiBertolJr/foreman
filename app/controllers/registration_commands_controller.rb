class RegistrationCommandsController < ApplicationController
  include Foreman::Controller::RegistrationCommands

  before_action :find_smart_proxy, if: -> { registration_params['smart_proxy_id'] }, only: [:create]

  def form_data
    render json: {
      organizations: User.current.my_organizations.select(:id, :name),
      locations: User.current.my_locations.select(:id, :name),
      hostGroups: host_groups_json,
      operatingSystems: Operatingsystem.authorized(:view_operatingsystems),
      smartProxies: smart_proxies,
      configParams: host_config_params,
      pluginData: plugin_data,
    }
  end

  def operatingsystem_template
    os = Operatingsystem.authorized(:view_operatingsystems).find(params[:id])
    template = os.has_default_template?(TemplateKind.find_by(name: 'host_init_config'))

    unless template
      render json: { template: { name: nil, os_path: edit_operatingsystem_path(os)} }
      return
    end

    render json: { template: { name: template.name, path: edit_provisioning_template_path(template) } }
  end

  def create
    render json: { command: command }
  end

  private

  def ignored_query_args
    ['utf8', 'authenticity_token', 'commit', 'action', 'locale', 'controller', 'jwt_expiration', 'smart_proxy_id', 'insecure']
  end

  def registration_params
    if params['registration_command']
      params['registration_command'].transform_keys(&:underscore)
    else
      params
    end
  end

  def host_groups_json
    Hostgroup.authorized(:view_hostgroups)
             .map { |hg| hg.as_json(methods: :inherited_operatingsystem_id) }
  end

  def smart_proxies
    SmartProxy.with_features('Templates') & SmartProxy.with_features('Registration')
  end

  # Extension point for plugins
  def plugin_data
    {}
  end
end
