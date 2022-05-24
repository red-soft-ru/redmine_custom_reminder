Redmine::Plugin.register :redmine_custom_reminder do
  name 'Redmine Custom Email Reminder'
  author 'Andrey Lobanov(RedSoft)'
  description 'Sends email notifications by custom conditions'
  version RedmineCustomReminder::PluginVersion

  requires_redmine version_or_higher: '5.0'

  permission :manage_project_custom_reminders, {}, require: :member

  menu :admin_menu,
       :custom_reminder,
       { controller: 'custom_reminders', action: :index },
       if: proc { User.current.admin? },
       caption: :label_custom_reminders_plural
end
