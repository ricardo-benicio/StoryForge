# frozen_string_literal: true

module ApiSpecHelper
  def json_response
    JSON.parse(response.body)
  end
end
