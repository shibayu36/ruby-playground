class Log
  def initialize(host:, user:, epoch:, req:, status:, size:, referer:)
    @host = host
    @user = user
    @epoch = epoch
    @req = req
    @status = status
    @size = size
    @referer = referer
  end

  def method
    @req.split(' ')[0]
  end
end
