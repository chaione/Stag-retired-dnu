class Environment < Sequel::Model
  many_to_one :project

  def url
    "some/url/to/post/to"
  end
end