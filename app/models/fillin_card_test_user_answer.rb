class FillinCardTestUserAnswer < ApplicationRecord
  belongs_to :fillin_card_test
  belongs_to :fillin_card_answer

  scope :quizzed_answers, -> {where("hidden = 1")}

  def unanswered?
    user_answer.blank?
  end

  def correct?
    # default to true when question is not hidden. That means it isn't a question on this card
    return true if !hidden?
    return true if ActionController::Base.helpers.sanitize(user_answer) == fillin_card_answer.answer
    return false
  end
end
