Given /^test input$/ do |table|
  scene_rows = table.raw
  @input_string = scene_rows.reduce("") do |memo, object|
    memo = "#{memo}\n" if memo.length >= 1
    "#{memo}#{object[0]}"
  end
end

Then /^output should be$/ do |table|
  output_string = MarsRover::Simulator.new(:input_string => @input_string).run
  output_table = output_string.split(/\n/).map{|i| [i]}
  table_result = Cucumber::Ast::Table.new(output_table)
  table.diff! table_result
end

Then /^it should raise error with message "(.*?)"$/ do |message|
  begin
    MarsRover::Simulator.new(:input_string => @input_string).run
  rescue Exception => ex
    ex.message.should include message
  end
end