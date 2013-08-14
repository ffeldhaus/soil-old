class UserMailer < ActionMailer::Base
  default :from => 'florian.feldhaus@gmail.com'

  def new_game_confirmation(supervisor, game)
    @supervisor = supervisor
    @game = game
    mail(:to => supervisor.email, :subject => I18n.t('email_new_game_subject') + ' ' + game.name)
  end
end
