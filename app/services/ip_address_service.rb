class IpAddressService
  def find_duplicated
    Post.find_by_sql(query)
  end

  private

  def query
    'SELECT distinct ip_address, user_id FROM posts a WHERE Exists ' \
    '(SELECT ip_address FROM posts c WHERE a.user_id != c.user_id ' \
    'AND a.ip_address = c.ip_address)'
  end
end
