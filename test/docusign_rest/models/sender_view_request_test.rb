require 'helper'

module DocusignRest
  describe SenderViewRequest do
    let(:request) { build :sender_view_request }

    it { request.must_be :valid? }
  end
end
