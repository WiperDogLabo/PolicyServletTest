// get collections
var cols = db.getCollection("policy_message");
// get all record corresponding to jobname
var dataAll = cols.find({jobName: 'MySQL.Database_Area.JobTest01'});
var record = 0;
// check data exist or not

if(dataAll.size() == 0) {
	print('Policy_message does not contains evaluate of jobName:\'MySQL.Database_Area.JobTest01\'!!!')
}

// check number of record inserted to policy_message
if(dataAll.size() == 3) {
	print('Inserted 3 record to policy_message corresponding to jobName:\'MySQL.Database_Area.JobTest01\'!!!')
} else {
	print('Missing record when insert data to policy_message corresponding to jobName:\'MySQL.Database_Area.JobTest01\'!!!')
}

// for each record
while(dataAll.hasNext()) {
	// get record
	var jobObj = dataAll.next()
	record++
	print('==========Record number===========: ' + record)
	// check data of policy_message contains evaluate of job
	if(jobObj.jobName == 'MySQL.Database_Area.JobTest01' && jobObj.istIid == "") {
		print('=====Insert record general successfully!!!=====')
	} else {
		print('=====Insert record general failed!!!=====')
	}

	// check data of policy_message does not contains instance 1
	if(jobObj.jobName == 'MySQL.Database_Area.JobTest01' && jobObj.istIid == "inst1-@MYSQL-information_schema") {
		print('=====Insert record instance_1 successfully!!!=====')
	} else {
		print('=====Insert record instance_1 failed!!!=====')
	}

	// check data of policy_message does not contains instance 1
	if(jobObj.jobName == 'MySQL.Database_Area.JobTest01' && jobObj.istIid == "inst2-@MYSQL-information_schema") {
		print('=====Insert record instance_2 successfully!!!=====')
	} else {
		print('=====Insert record instance_2 failed!!!=====')
	}
	printjson(jobObj);
	print('\n')
}
