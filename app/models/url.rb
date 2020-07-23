class Url < ApplicationRecord
  after_create :generate_key
  validates_format_of :source,
                      with: %r{\A(http|https)://[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix

  def generate_key
    self.key = NumberToBase62.from(id)
    save
  end
end
