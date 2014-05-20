require 'helper'

describe DocusignRest::TabContainer do
  describe '#initialize' do
    it 'set signHereTabs' do
      tabName = 'Sign Here'
      tabId = '22f7b1d9-1a78-4f33-80d7-a0a271272d51'
      scaleValue = 1.0

      container = DocusignRest::TabContainer.new({ 'signHereTabs' => [{ 'name' => tabName, 'tabLabel' => 'Signature 1', 'scaleValue' => scaleValue, 'optional' => 'false', 'documentId' => '1', 'recipientId' => '1', 'pageNumber' => '1', 'xPosition' => '265', 'yPosition' => '223', 'tabId' => tabId }] })

      container.signHereTabs.wont_be_empty
      container.signHereTabs[0].name.must_be_same_as tabName
      container.signHereTabs[0].tabId.must_be_same_as tabId
      container.signHereTabs[0].scaleValue.must_be_same_as scaleValue
    end
  end
end