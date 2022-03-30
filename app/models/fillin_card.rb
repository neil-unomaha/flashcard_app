class FillinCard < ApplicationRecord
  belongs_to :fillin_domain
  belongs_to :fillin_category
  has_many :fillin_card_answers, dependent: :destroy
  has_many :fillin_card_tests, dependent: :destroy

  has_rich_text :question
  has_rich_text :additional_info

  validate :proper_special_char_answers
  validate :at_least_one_answer

  # grabs all answer text in between "[= =]"
  def answers_ary
    question.to_s.scan(/\[\=\K[^\=\]]+/)
  end

  def callback_after_create_and_update
    fillin_card_answers.destroy_all
    fillin_card_tests.destroy_all
    answers_ary.each_with_index do |answer, i|
      FillinCardAnswer.create(fillin_card: self, position: i + 1, answer: answer)
    end
  end

  private

  def proper_special_char_answers
    if question.to_s.scan(/\[\=/).size != question.to_s.scan(/\=\]/).size
      errors.add(:_, 'Your "[=" does not equal your "=]"')
    end
  end

  def at_least_one_answer
    if question.to_s.scan(/\[\=\K[^\=\]]+/).size == 0
      errors.add(:_, 'You need at least one fillable answer (a.k.a, one "[==]" )')
    end
  end


end
