module RehearsalsHelper

  def remote_ip
    # 개발환경에서만 적용
    if request.remote_ip == '::1'
      # Hard coded remote address
      '123.45.67.89'
    else
      request.remote_ip
    end
  end
end
