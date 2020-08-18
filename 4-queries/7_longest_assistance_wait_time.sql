SELECT 
  AVG(reqs.started_at - reqs.created_at) as average_assistance_wait_time
  FROM  
    assistance_requests AS reqs;