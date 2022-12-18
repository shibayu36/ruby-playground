class Log
  def initialize(host:, user:, epoch:, req:, status:, size:, referer:)
    @host = host
    @user = user
    @epoch = epoch.to_i
    @req = req
    @status = status.to_i
    @size = size.to_i
    @referer = referer
  end

  def method
    @req.split(' ')[0]
  end
end
