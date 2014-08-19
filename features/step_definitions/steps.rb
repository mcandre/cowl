Given(/^the program has finished$/) do
  # Test files are generated using iconv.
  @cucumber = `cowl examples/`
  @cucumber_wider = `cowl -w 106 examples/`
  @cucumber_unwrapped = `cowl -w unlimited examples/`
end

Then(/^the output is correct for each test$/) do
  lines = @cucumber.split("\n")

  expect(lines.length).to eq(1)

  expect(lines[0]).to match(%r(^examples/hello.bf\:[0-9]+\:.+$))

  lines2 = @cucumber_wider.split("\n")
  expect(lines2.length).to eq(17)
  lines2.each { |line| expect(line).to match(%r(^examples/books/romeo-and-juliet-unwrapped.txt\:[0-9]+\:.+$)) }

  lines3 = @cucumber_unwrapped.split("\n")
  expect(lines3.length).to eq(0)
end
