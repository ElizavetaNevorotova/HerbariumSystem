ActiveAdmin.register Taxon, as: 'ExemplarTaxon' do
  menu priority: 2, label: 'Таксоны'

  config.clear_action_items!

  controller do
    def new
      @taxon = Taxon.new(level: params[:level])
      @parent_collection = if params[:level] == 'clan'
                             Taxon.family.pluck(:name, :id)
                           elsif params[:level] == 'kind'
                             Taxon.clan.pluck(:name, :id)
                           end
      super
    end

    def create
      taxon = Taxon.new(create_params)
      taxon.save!
      redirect_to admin_exemplar_taxons_path
    end

    private

    def create_params
      params.require(:taxon).permit(:name, :latin_name, :parent_id, :level)
    end
  end

  action_item only: :index do
    link_to 'Создать семейство', new_admin_exemplar_taxon_path(level: :family)
  end

  action_item only: :index do
    link_to 'Создать род', new_admin_exemplar_taxon_path(level: :clan)
  end

  index do
    id_column
    column 'Название', :name
    column 'Тип' do |taxon|
      I18n.t("taxon.levels.#{taxon.level}")
    end
    column 'Родительский таксон' do |taxon|
      parent = taxon.parent
      parent.present? ? "#{parent.name} / #{I18n.t("taxon.levels.#{parent.level}")}" : '-'
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row 'Тип' do |taxon|
        I18n.t("taxon.levels.#{taxon.level}")
      end
      row 'Родительский таксон' do |taxon|
        parent = taxon.parent
        parent.present? ? "#{parent.name} / #{I18n.t("taxon.levels.#{parent.level}")}" : '-'
      end
    end
  end

  form partial: '/taxons/admin_new.html.slim'
end