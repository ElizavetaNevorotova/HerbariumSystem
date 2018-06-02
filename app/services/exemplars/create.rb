module Exemplars
  # Create exemplar and associations
  class Create
    attr_accessor :exemplar

    def initialize(params = {})
      @params = params
      @success = true
    end

    def call
      ActiveRecord::Base.transaction do
        @exemplar = Exemplar.create!(params[:exemplar_params].except(:finder_ids))
        exemplar.update!(finder_ids: params[:exemplar_params][:finder_ids])
        kind = exemplar.taxons.create!(name: kind_params[:kind][:name],
                                parent_id: JSON.parse(kind_params[:kind][:clan_id]),
                                level: :kind,
                                latin_name: kind_params[:kind][:latin_name],
                                botanist_id: kind_params[:finder_ids].select { |value| value.present? }.first
                               )
        kind.update!(recognizer_ids: kind_params[:kind][:recognizer_ids])
        exemplar.exemplar_images.create!(params[:image_params]) if params[:image_params]
      end
    rescue
      fail!
    end

    def success?
      success
    end

    private

    attr_reader :success, :params

    def fail!
      @success = false
    end

    def kind_params
      @kind_params ||= params[:kind_params]
    end
  end
end