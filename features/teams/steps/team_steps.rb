Given %r{зарегистрирована команда "(.*)" под руководством (.*)}i do |team_name, nickname|
  Допустим %{я залогинен как #{nickname}}
  Если %{я пытаюсь создать команду "#{team_name}"}
  То %{должен быть перенаправлен в личный кабинет}
  То %{там должен увидеть "Вы - капитан команды #{team_name}"}
end

When %r{пытаюсь создать команду "(.*)"}i do |team_name|
  Если %{захожу в личный кабинет}
  Если %{я иду по ссылке "Создать команду"}
  Если %{ввожу "#{team_name}" в поле "Название"}
  Если %{нажимаю "Создать команду"}
end

Given %r{пользователь (.*) состоит в команде (.*)}i do |nickname, team_name|
  captain_nickname = Team.find_by_name(team_name).captain.nickname

  Допустим %{зарегистрирован пользователь #{nickname}}
  Допустим %{я логинюсь как #{captain_nickname}}
  Допустим %{высылаю пользователю #{nickname} приглашение вступить в команду}
  Если %{я логинюсь как #{nickname}}
  Если %{я иду по ссылке "Принять"}
  То %{должен быть перенаправлен в личный кабинет}
  То %{должен увидеть "Вы состоите в команде #{team_name}"}
end