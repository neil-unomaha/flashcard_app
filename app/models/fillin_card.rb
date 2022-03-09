class FillinCard < ApplicationRecord
  belongs_to :fillin_domain
  belongs_to :fillin_category

  has_rich_text :question

  validate :proper_special_char_answers
  validate :at_least_one_answer

  def answers_ary
    question.to_s.scan(/\[\=\K[^\=\]]+/)
  end

  private

  def proper_special_char_answers
    if question.to_s.scan(/\[\=/).size != question.to_s.scan(/\=\]/).size
      errors.add(:question, 'Your "[=" does not equal your "=]"')
    end
  end

  def at_least_one_answer
    if question.to_s.scan(/\[\=\K[^\=\]]+/).size == 0
      errors.add(:question, 'You need at least one answer (a.k.a, one "[==]" )')
    end
  end


end
