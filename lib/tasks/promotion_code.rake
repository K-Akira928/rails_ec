# frozen_string_literal: true

namespace :promotion_code do
  desc 'プロモーションコードを生成する'
  task generate: :environment do
    (1..10).each do |number|
      PromotionCode.create!(code: "hapns#{format('%02d', number)}", discount: format('%d00', number).to_i)
      puts "プロモーションコードを生成しました: CODE=>hapns#{format('%02d', number)}, 値引=>#{format('%d00', number)}"
    end
  end
end
