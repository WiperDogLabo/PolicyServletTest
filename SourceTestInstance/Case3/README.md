Test Case 3
---------------------------------------------
 - Check policy_message when run wiperdog with 1 job, 2 instances, 1 instance.policy and 1 job.policy  
 - 3 records writed into policy-message:  
	+ 2 records corresponding to jobName is "MySQL.Database_Area.JobTest03" and istIid is empty.  
	+ 1 record corresponding to jobName is "MySQL.Database_Area.JobTest03" and istIid is "inst1-@MYSQL-information_schema".  
