require 'test_helper'

class DinnerTest < ActiveSupport::TestCase
  test 'create dinner success' do
    # ASK Bryce why is not working
    # dinner = Dinner.new
    # assert dinner.invalid?

    dinner = dinners(:one)
    dinner.date = 10.days.from_now
    assert dinner.valid?
  end

  test 'dinner has to take place in the future' do
    dinner = dinners(:one)
    dinner.date = -1.days.from_now
    assert dinner.invalid?

    dinner.date = 10.days.from_now
    assert dinner.valid?
  end

end
