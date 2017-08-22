module FastlyRails
  module SurrogateKeyHeaders

    # Sets Surrogate-Key HTTP header with one or more keys
    # strips session data from the request
    def set_surrogate_key_header(*surrogate_keys)
      request.session_options[:skip] = true if flash.empty?  # No Set-Cookie unless there is a flash message
      response.headers['Surrogate-Key'] = surrogate_keys.join(' ')
    end
  end
end
