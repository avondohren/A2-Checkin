require 'test_helper'

class SiteMailerTest < ActionMailer::TestCase
  test "recap" do
    mail = SiteMailer.recap
    assert_equal "Recap", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
