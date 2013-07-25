guard "bundler" do
  watch("Gemfile")
end

guard "rack" do
  watch("Gemfile.lock")
  watch(%r{^(config|app)/.*})
end

guard "rspec", :cli => "--color --format nested --fail-fast" do
  watch(%r{^app/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/fdoc/(.+)/.+\.fdoc}) { |m| "spec/services/#{m[1]}_spec.rb" }
  watch("spec/spec_helper.rb")  { "spec" }
end

guard "shell" do
  watch(%r{.*fdoc.*}) do |m|
    system("rake docs")
    n m[0], 'Updating API docs', ($?.exitstatus > 0 ? :failed : :success)
    nil
  end
end
