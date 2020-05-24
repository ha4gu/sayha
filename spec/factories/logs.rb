# == Schema Information
#
# Table name: logs
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  spot_id    :bigint           not null
#
# Indexes
#
#  index_logs_on_spot_id  (spot_id)
#
# Foreign Keys
#
#  fk_rails_...  (spot_id => spots.id)
#
FactoryBot.define do
  factory :log do
    spot
    title { Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 3) }
    body do
      array = [Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 6),
               Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 6),
               Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 6),
               Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 6)]
      array[0, rand(1..4)].join("\n")
    end
  end
end
