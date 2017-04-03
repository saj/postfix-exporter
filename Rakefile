exec(*(["bundle", "exec", $PROGRAM_NAME] + ARGV)) if ENV['BUNDLE_GEMFILE'].nil?

Bundler.setup(:default, :development)

task :default => :test

begin
	Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
	$stderr.puts e.message
	$stderr.puts "Run `bundle install` to install missing gems"
	exit e.status_code
end

Bundler::GemHelper.install_tasks

task :release do
	sh "git release"
end

desc "Build and push a new docker image"
task :docker do
	sh "docker build -t discourse/postfix-exporter --build-arg=http_proxy=#{ENV['http_proxy']} ."
	sh "docker push discourse/postfix-exporter"
end
