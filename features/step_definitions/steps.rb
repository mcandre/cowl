Given(/^the program has finished$/) do
  # Test files are generated using iconv.
  @cucumber = `cowl examples/`
  @cucumber_stdin = `cat examples/hello.bf | cowl`
  @cucumber_ignore_bf = `cowl -i '*.bf' examples/`
  @cucumber_wider = `cowl -w 160 examples/hello.bf`
  @cucumber_unwrapped = `cowl -w unlimited examples/`
end

Then(/^the output is correct for each test$/) do
  cucumber_lines = @cucumber.split("\n")
  expect(cucumber_lines.length).to eq(1)
  expect(cucumber_lines[0]).to match(%r(^examples/hello.bf\:[0-9]+\:.+$))

  cucumber_stdin_lines = @cucumber_stdin.split("\n")
  expect(cucumber_stdin_lines.length).to eq(1)
  expect(cucumber_stdin_lines[0]).to match(%r(^stdin:[0-9]+\:.+$))

  cucumber_ignore_bf_lines = @cucumber_ignore_bf.split("\n")
  expect(cucumber_ignore_bf_lines.length).to eq(0)

  cucumber_wider_lines = @cucumber_wider.split("\n")
  expect(cucumber_wider_lines.length).to eq(0)

  cucumber_unwrapped_lines = @cucumber_unwrapped.split("\n")
  expect(cucumber_unwrapped_lines.length).to eq(0)
end
