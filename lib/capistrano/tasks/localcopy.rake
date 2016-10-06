namespace :localcopy do
  def archive_name
    fetch(:archive_name, "archive.tar.gz")
  end

  def include_dir
    fetch(:include_dir, "*")
  end

  def exclude_dir
    Array(fetch(:exclude_dir, []))
  end

  def exclude_args
    exclude_dir.map { |dir| [ "--exclude", dir] }.flatten
  end

  def tar_roles
    fetch(:tar_roles, :all)
  end

  def tar_verbose
    fetch(:tar_verbose, true)
  end

  desc "Archive files to #{archive_name}"
  file archive_name => FileList[include_dir].exclude(archive_name) do |t|
    sh "tar", "-c#{tar_verbose ? "v" : ""}zf", t.name, *exclude_args, *t.prerequisites
  end

  desc "Deploy #{archive_name} to release_path"
  task :deploy => archive_name do |t|
    tarball = t.prerequisites.first

    on roles(tar_roles) do
      # Make sure the release directory exists
      puts "==> release_path: #{release_path} is created on #{tar_roles} roles <=="
      execute :mkdir, "-p", release_path

      # Create a temporary file on the server
      tmp_file = capture("mktemp")

      # Upload the archive, extract it and finally remove the tmp_file
      upload!(tarball, tmp_file)
      execute :tar, "-xzf", tmp_file, "-C", release_path
      execute :rm, tmp_file
    end
  end

  task :clean do |t|
    # Delete the local archive
    File.delete archive_name if File.exists? archive_name
  end

  after 'deploy:finished', 'localcopy:clean'

  task :create_release => :deploy
  task :check
  task :set_current_revision
end