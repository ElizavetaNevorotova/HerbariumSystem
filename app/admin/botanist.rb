ActiveAdmin.register Botanist, as: 'Botanist' do
  menu priority: 4, label: 'Ботаник'

  controller do
    def create
      Botanist.create(update_params)
      redirect_to admin_botanists_path
    end

    def update
      Botanist.find(params[:id]).update(update_params)
      redirect_to admin_botanists_path
    end

    private

    def update_params
      params.require(:botanist).permit(:first_name, :last_name, :patronymic, :position)
    end
  end

  index do
    id_column
    column :first_name
    column :last_name
    column :patronymic
    column :position
    actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :patronymic
      row :position
    end
  end
end
