# coding: utf-8
ActiveAdmin.register Exemplar do
  menu priority: 3, label: 'Экземпляры'

  permit_params images: []

  controller do
    def create
      result = Exemplars::Create.new(exemplar_params: exemplar_params,
                                     image_params: image_params,
                                     kind_params: kind_params)
      result.call
      if result.success?
        redirect_to admin_exemplar_path(result.exemplar.id)
      else
        redirect_to admin_exemplars_path
      end
    end

    private

    def create_params
      params.require(:exemplar).permit(:inventory_id, :box_id, :cupboard_id, :location, :habitat,
                                       :finded_at, :fund, finder_ids: [], kind: [:family_id, :clan_id, :name, :latin_name, recognizer_ids: []], images: [])
    end

    def exemplar_params
      create_params.except(:kind)
    end

    def kind_params
      create_params.slice(:kind, :finder_ids)
    end

    def image_params
      params.require(:exemplar).permit(:image)
    end
  end

  index do
    column :inventory_id
    column :box_id
    column :cupboard_id
    column 'Семейство' do |exemplar|
      exemplar.taxons.last.parent.parent.name
    end
    column 'Род' do |exemplar|
      exemplar.taxons.last.parent.name
    end
    column 'Название вида' do |exemplar|
      exemplar.taxons.last.name
    end
    column 'Латинское название вида' do |exemplar|
      exemplar.taxons.last.latin_name
    end
    actions
  end

  show do
    attributes_table do
      row :inventory_id
      row :box_id
      row :cupboard_id
      row 'Название семейства' do |exemplar|
        exemplar.taxons.last.parent.parent.name
      end
      row 'Латинсоке название семейства' do |exemplar|
        exemplar.taxons.last.parent.parent.latin_name
      end
      row 'Название рода' do |exemplar|
        exemplar.taxons.last.parent.name
      end
      row 'Латинское название рода' do |exemplar|
        exemplar.taxons.last.parent.latin_name
      end
      row 'Название вида' do |exemplar|
        exemplar.taxons.last.name
      end
      row 'Латинское название вида' do |exemplar|
        exemplar.taxons.last.latin_name
      end
      row :location
      row :habitat
      row 'Фонд' do |exemplar|
        I18n.t("exemplar.fund.#{exemplar.fund}")
      end
      row 'Коллекторы' do |exemplar|
        exemplar.finders.map { |finder| full_name_with_initials(finder) }.join(', ')
      end
      row 'Определители' do |exemplar|
        exemplar.taxons.last.recognizers.map { |recognizer| full_name_with_initials(recognizer) }.join(', ')
      end
      row 'Дата нахождения' do |exemplar|
        exemplar.finded_at.strftime('%d/%m/%Y')
      end
      row '_' do |exemplar|
        image_tag rails_blob_url(exemplar.images.first)
      end
    end
  end

  form partial: '/exemplars/admin_new.html.slim'
end
