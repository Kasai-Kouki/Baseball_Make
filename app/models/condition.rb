class Condition < ApplicationRecord
enum progress: {
    waiting: 0, #募集中
    start: 1, #申し込み済み
    processing: 2, #承諾
    done: 3 #拒否
  }
  belongs_to :recruitment
end
