# frozen_string_literal: true

# Creates associations and class methods for Author.
class Book < ApplicationRecord
  belongs_to :author

  def citation
    author.middle_name.present? ? citation_with_middle : citation_without
  end

  private

  def citation_with_middle
     cit_beg_blurb + ' ' + author.middle_name + cit_mid_blurb + cit_end_blurb
  end

  def citation_without
    cit_beg_blurb + cit_mid_blurb + cit_end_blurb
  end

  def cit_beg_blurb
    author.last_name + ', ' + author.first_name
  end

  def cit_mid_blurb
    '. ' + title + '. ' + publisher_city + ': ' + publisher + ', '
  end

  def cit_end_blurb
    publish_year.to_s + '. Print.'
  end
end
