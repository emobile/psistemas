class Status < ActiveRecord::Base
  class << self
    def models()
      models = {
        "order" => I18n.t("activerecord.models.orders"),
        "route" => I18n.t("activerecord.models.routes")
      }
    end
  end
end
