class Account
  def deposit(amount)
  	@balance = amount
  end
  def balance
    @balance
  end
end

CAPTURE_CASH_AMOUNT = Transform /^(£|\$|€)(\d+)$/ do | currency_symbol, digits |
  Currency::Money.new(digits, currency_symbol)
end

Given(/^I have deposited (#{CAPTURE_CASH_AMOUNT}) in my account$/) do |amount|
  my_account = Account.new
  my_account.deposit(amount)
  my_account.balance.should eq(amount), "Expected the balance to be #{amount} but it was #{my_account.balance}"
end

When(/^I request \$(\d+)$/) do |amount|
  pending("How do we simulate cash being requested?")
end

Then(/^\$(\d+) should be dispensed$/) do |amount|
  pending("How do we validate that cash was dispensed?")
end
