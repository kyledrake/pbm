require 'timecop'

Given /^today is "(.*)"$/ do |date|
  Timecop.travel(Time.parse(date))
end

When /^I wait for (\d+) seconds?$/ do |secs|
  sleep secs.to_i
end

After do
  Timecop.return
end
