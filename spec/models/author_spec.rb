require 'rails_helper'

RSpec.describe Author, type: :model do
  it { is_expected.to respond_to(
    :email,
    :password,
    :first_name,
    :middle_name,
    :last_name,
    :home_town,
    :home_state,
    :dob)
  }
  it { is_expected.to respond_to(
    :reset_password_token,
    :reset_password_sent_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :books)
  }
end
