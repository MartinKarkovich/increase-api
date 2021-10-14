class Discount < ApplicationRecord
  self.primary_key = :discount_id

  belongs_to :payment, primary_key: :payment_id

  enum discount_type: {
    iva: 0,
    retenciones: 1,
    comisiones: 2,
    costos_extra: 3,
    ingresos_brutos: 4
  }, _prefix: true

end