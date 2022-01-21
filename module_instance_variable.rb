module CurrentUserByToken
  def current_user_by_token
    'curernt_user'
  end
end

module CurrentUserByTokenOverride
  include CurrentUserByToken

  def current_user
    @current_user ||= begin
      p('current_user first')
      current_user_by_token
    end
  end
end

module AppBeforeAction
  include CurrentUserByTokenOverride

  def login_required
    !!current_user
  end
end

class App
  include CurrentUserByTokenOverride
  include AppBeforeAction

  def run
    p('login_required')
    return unless login_required

    p('user1')
    user1 = current_user
    p('user2')
    user2 = current_user
  end
end

a = App.new
a.run
