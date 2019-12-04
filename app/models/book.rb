class Book < ApplicationRecord

	# ここにもdeviseを書いてしまうとチェックが入ってしまいエラーになる
	validates :title, presence: true
	validates :body, {presence: true, length:{maximum:200}}

    belongs_to :user
end
