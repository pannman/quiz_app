guard :rspec, cmd: "bundle exec rspec" do
  require "guard/rspec/dsl"
  dsl = Guard::RSpec::Dsl.new(self)

  # Feel free to open issues for suggestions and improvements

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)

  # Rails files
  rails = dsl.rails(view_extensions: %w(erb haml slim))
  dsl.watch_spec_files_for(rails.app_files)
  dsl.watch_spec_files_for(rails.views)

  watch(rails.controllers) do |m|
    [
      rspec.spec.call("routing/#{m[1]}_routing"),
      rspec.spec.call("controllers/#{m[1]}_controller"),
      rspec.spec.call("acceptance/#{m[1]}")
    ]
  end

  # Rails config changes
  watch(rails.spec_helper)     { rspec.spec_dir }
  watch(rails.routes)          { "#{rspec.spec_dir}/routing" }
  watch(rails.app_controller)  { "#{rspec.spec_dir}/controllers" }

  # Capybara features specs
  watch(rails.view_dirs)     { |m| rspec.spec.call("features/#{m[1]}") }
  watch(rails.layouts)       { |m| rspec.spec.call("features/#{m[1]}") }

  # Turnip features and steps
  watch(%r{^spec/acceptance/(.+)\.feature$})
  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
    Dir[File.join("**/#{m[1]}.feature")][0] || "spec/acceptance"
  end

  watch(%r{^app/controllers/(.*?)_controller\.rb$}) do |matches|
    resource_tests(matches[1])
  end
  watch(%r{^app/views/([^/]*?)/.*\.html\.erb$}) do |matches|
    ["test/controllers/#{matches[1]}_controller_test.rb"] +
    features(matches[1])
  end
  watch(%r{^app/helpers/(.*?)_helper\.rb$}) do |matches|
    features(matches[1])
  end




#   watch('app/views/layouts/application.html.erb') do
#     'test/integration/site_layout_test.rb'
#   end
#   watch('app/helpers/sessions_helper.rb') do
#     integration_tests << 'test/helpers/sessions_helper_test.rb'
#   end
#   watch('app/controllers/sessions_controller.rb') do
#     ['test/controllers/sessions_controller_test.rb',
#      'test/integration/users_login_test.rb']
#   end
#   watch('app/controllers/account_activations_controller.rb') do
#     'test/integration/users_signup_test.rb'
#   end
#   watch(%r{app/views/users/*}) do
#     resource_tests('users') +
#     ['test/integration/microposts_interface_test.rb']
#   end

end

# 与えられたリソースに対応する統合テストを返す
def features(resource = :all)
  if resource == :all
    Dir["spec/features/*"]  else
    Dir["spec/features/#{resource}_*.rb"]
  end
end

# 与えられたリソースに対応するコントローラのテストを返す
def controller_test(resource)
  "spec/controllers/#{resource}_controller_test.rb"
end

# 与えられたリソースに対応するすべてのテストを返す
def resource_tests(resource)
  features(resource) << controller_test(resource)
end
