module ApplicationHelper

  def test_progress_percentage(test)
    answered        = test.cards_tests.answered.size
    total_questions = test.cards_tests.size

    return "0%" if answered.zero? || total_questions.zero?
    return number_to_percentage((answered.to_f / total_questions.to_f) * 100, precision: 0)
  end

  def card_answer_styling(card_test)
    return "" if card_test.correct.nil?
    return "text-success" if card_test.correct?
    return "text-danger"
  end

  def hide_front_card(test)
    return "d-none" if !test.question_first?
  end

  def hide_back_card(test)
    return "d-none" if test.question_first?
  end
end
