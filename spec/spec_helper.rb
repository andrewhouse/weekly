RSpec.configure do |config|
  config.filter_run :focus
  config.filter_run_excluding :skip
  config.run_all_when_everything_filtered = true
end
