module ApplicationHelper

  def custom_trix_safe(text)
    sanitize(text, tags: ['div', 'b', 'br', 'strong', 'em', 'del', 'a', 'h1', 'h2', 'h3', 'p', 'blockquote', 'pre', 'ul', 'li', 'ol'], attributes: ['href'])
  end

  def test_progress_percentage(test)
    answered        = test.cards_tests.answered.size
    total_questions = test.cards_tests.size

    return "0%" if answered.zero? || total_questions.zero?
    return number_to_percentage((answered.to_f / total_questions.to_f) * 100, precision: 0)
  end

  def fillin_test_progress_percentage(fillin_test)
    answered        = fillin_test.fillin_card_tests.answered.size
    total_questions = fillin_test.fillin_card_tests.size

    return "0%" if answered.zero? || total_questions.zero?
    return number_to_percentage((answered.to_f / total_questions.to_f) * 100, precision: 0)
  end

  def card_answer_styling(card_test)
    return "" if card_test.correct.nil?
    return "text-success" if card_test.correct?
    return "text-danger"
  end

  def fillin_card_answer_styling(fillin_card_test)
    return "" if fillin_card_test.correct.nil?
    return "text-success" if fillin_card_test.correct?
    return "text-danger"
  end

  def hide_front_card(test)
    return "d-none" if !test.question_first?
  end

  def hide_back_card(test)
    return "d-none" if test.question_first?
  end

  def fillin_test_card_feedback(fillin_card_test)
    if fillin_card_test.correct?
      content_tag(:span, "Correct!", class: "text-success")
    else
      content_tag(:span, "Incorrect", class: "text-danger")
    end
  end
end
