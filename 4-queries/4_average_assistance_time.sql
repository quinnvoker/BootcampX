SELECT 
  AVG(reqs.completed_at - reqs.started_at) as average_assistance_request_duration
  FROM  
    assistance_requests AS reqs;