class Deployment < Sequel::Model
  many_to_one :project


  private

  def build_url
    self.postback_url = "foo"
  end
end