Test Case 4
---------------------------------------------
 - Check policy_message when run wiperdog with 1 job, 2 instances, 2 instance.policy and 1 job.policy  
 - 4 records writed into policy-message:  
	+ 1 record corresponding to jobName is "MySQL.Database_Area.JobTest04" and istIid is empty.  
	+ 1 record corresponding to jobName is "MySQL.Database_Area.JobTest04" and istIid is "inst1-@MYSQL-information_schema".  
	+ 2 records corresponding to jobName is "MySQL.Database_Area.JobTest04" and istIid is "inst2-@MYSQL-information_schema" (because 2 records of job have been evaluation policy).  
