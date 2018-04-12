ActiveAdmin.register Exemplar do
  menu priority: 3, label: 'Экземпляры'

  form partial: '/exemplars/admin_new.html.slim'
end
