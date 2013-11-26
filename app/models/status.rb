class Status < ActiveRecord::Base
  class << self
    def models()
      models = {
        "order" => I18n.t("activerecord.models.orders"),
        "route" => I18n.t("activerecord.models.routes")
      }
    end
  end
  self.per_page = 15
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |model|
        csv << model.attributes.values_at(*column_names)
      end
    end
  end
end
