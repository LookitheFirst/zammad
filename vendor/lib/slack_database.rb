require "omniauth/strategies/slack"

class SlackDatabase < OmniAuth::Strategies::Slack
  option :name, 'slack'

  def initialize(app, *args, &block)

    # database lookup
    config  = Setting.get('auth_slack_credentials') || {}
    args[0] = config['api_key']
    args[1] = config['api_secret']
    args[2] = config['scope']
    super
  end

end
