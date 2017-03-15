class Dog < ActiveRecord::Base
  include USGeography

  # name, license, y owner_id son obligatorios
  validates :name, :license, :owner_id, { :presence => true }

  # la licencia debe ser única para cada perro
  validates :license, { :uniqueness => true }

  # la licencia, debe empezar con dos letras en mayusculas luego un guión luego cualquier carácter.
  validates :license, format: { with: /\A[A-Z]{2}\-/ }

  # la edad no es obligatoria, pero si esta no puede ser menor de 0
  validates :age, { :numericality => { greater_than_or_equal_to: 0 },

                    :allow_blank  => true }
  # validación personalizada
  validate :license_from_us_state

  def license_from_us_state
    unless self.license.instance_of? String
      errors.add :license, "must be a string"
      return
    end

    abbreviation = self.license[0..1]
    unless valid_state_abbreviation? abbreviation
      errors.add :license, "must be from a valid US state"
    end
  end
end
