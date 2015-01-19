require 'rails_helper'
require 'find'
require File.join(BonusEngine::Engine.root, "lib", "generators", "install", "install_generator")
require 'rake'



describe BonusEngine::Generators::InstallGenerator do
  before do
    backup_files!
  end

  after do
    restore_files!
  end

  it 'copies over migrations' do
    cleanup!
    size = migrations.size

    capture(:stdout) do
      BonusEngine::Generators::InstallGenerator.start(
          ["--user-class=Developer", "--current-user-helper=current_user"],
          destination: Rails.root
      )
    end

    expect(migrations.size).to be > size
  end

  def migrations
    Dir["#{Rails.root}/db/migrate/*.rb"].sort
  end

  def files
    @files ||= [{
                    name: :routes,
                    path: "#{Rails.root}/config/routes.rb",
                    content: "Rails.application.routes.draw do\nend",
                }, {
                    name: :application_controller,
                    path: "#{Rails.root}/app/controllers/application_controller.rb",
                    content: "class ApplicationController < ActionController::Base\n  protect_from_forgery with: :exception\nend",
                }, {
                    name: :initializer,
                    path: "#{Rails.root}/config/initializers/bonus_engine.rb",
                    content: ""
                }]
  end

  def backup_files!
    files.each do |file|
      backup_file file[:path], file[:content]
    end
  end

  def backup_file(file_name, content)
    File.rename file_name, "#{file_name}.bak" if File.exist?(file_name)
    File.open(file_name, 'w') {|f| f.write content}
  end

  def restore_files!
    files.each do |file|
      restore_file file[:path]
    end
  end

  def restore_file(file_name)
    FileUtils.rm file_name if File.exist?(file_name)

    if File.exist?("#{file_name}.bak")
      File.rename "#{file_name}.bak", file_name
    end
  end

  def cleanup!
    engine_migrations = []

    Dir.chdir(Rails.root) do
      Find.find('db/migrate') do |path|

        engine_migrations << File.basename(path) if File.basename(path) =~ /bonus_engine/
      end
    end

    Dir.chdir(Rails.root) do
      engine_migrations.reverse.each do |file|
        Rake::Task['db:migrate:rollback'].invoke

        binding.pry
        FileUtils.rm("db/migrate/#{file}")
      end
    end
  end
end
