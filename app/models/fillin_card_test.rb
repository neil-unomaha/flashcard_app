class FillinCardTest < ApplicationRecord
  belongs_to :fillin_test
  has_many :fillin_card_test_user_answers, dependent: :destroy

  belongs_to :fillin_card
  has_many :fillin_card_answers, through: :fillin_card

  accepts_nested_attributes_for :fillin_card_test_user_answers

  scope :unanswered, -> {where(correct: nil)}
  scope :answered, -> {where("correct IS NOT NULL")}
  scope :answered_correct, -> {where(correct: true)}

  validate :at_least_one_hidden_portion

  def correct_to_s
    return "unanswered" if correct.nil?
    correct? ? "Yes" : "No"
  end

  def answered?
    !correct.nil?
  end

  def convert_to_question_display
    question_txt = fillin_card.question.to_s
    fillin_card_test_user_answers.each do |user_answer_card|
      if user_answer_card.hidden?
        question_txt = question_txt.gsub("[=#{user_answer_card.fillin_card_answer.answer}=]", "<i class='text-info'>Q#{user_answer_card.fillin_card_answer.position}?</i>")
      else
        question_txt = question_txt.gsub("[=#{user_answer_card.fillin_card_answer.answer}=]", "<strong class='text-success'>#{user_answer_card.fillin_card_answer.answer}</strong>")
      end
    end
    question_txt
  end

  def convert_to_question_display_completely_hidden
    question_txt = fillin_card.question.to_s
    fillin_card_test_user_answers.each do |user_answer_card|
      question_txt = question_txt.gsub("[=#{user_answer_card.fillin_card_answer.answer}=]", "<i class='text-info'>Q#{user_answer_card.fillin_card_answer.position}?</i>")
    end
    question_txt
  end

  def grade_answers
    quizzed_answers = fillin_card_test_user_answers.quizzed_answers
    if quizzed_answers.all?(&:correct?)
      self.correct = true
      self.save
    else
      self.correct = false
      self.save
    end
  end

  def at_least_one_hidden_portion
    return unless fillin_card_test_user_answers.any? &&
                  fillin_card_test_user_answers.none?{|a|a.hidden?}
    errors.add(:_, 'You need at least one "Hidden Answer" for Each card.')
  end

end
