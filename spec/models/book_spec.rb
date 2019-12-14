require 'rails_helper'

RSpec.describe Book, type: :model do
  it { is_expected.to respond_to(
    :title,
    :publish_year,
    :publisher,
    :publisher_city,
    :author
  )}
end
