module DocusignRest
  class TabContainer < Model
    hash_attr :signHereTabs, :textTabs

    private
    def initialize(hash)
      self.textTabs = hash['textTabs'].map { |tab| DocusignRest::TextTab.new tab } unless hash['textTabs'].nil?
      self.signHereTabs = hash['signHereTabs'].map { |tab| DocusignRest::SignHereTab.new tab } unless hash['signHereTabs'].nil?
    end
  end
end