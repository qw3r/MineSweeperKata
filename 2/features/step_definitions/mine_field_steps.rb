Given /^the following minefield:$/ do |input|
  @mine_field = MineField.new input
end


When /^I reveal the hint field/ do
  @output = @mine_field.hint_field
end


Then /^the output should be:$/ do |output|
  expect(@output).to eq output
end
