//var db = connect("10.0.1.189:27017/wiperdog");
var cols = db.getCollection("policy_message");
// get one record corresponding to jobname
// var data = cols.findOne({jobName: 'MySQL.Database_Area.JobTest02'});
// get all record corresponding to jobname
var dataAll = cols.find({jobName: 'MySQL.Database_Area.JobTest02'});
var record = 0;
// check data exist or not

if(dataAll.size() == 0) {
	print('Policy_message does not contains evaluate of jobName:\'MySQL.Database_Area.JobTest02\'!!!')
}

// check number of record inserted to policy_message
if(dataAll.size() == 1) {
	print('Inserted only one record to policy_message corresponding to jobName:\'MySQL.Database_Area.JobTest02\' and instance:\'inst1-@MYSQL-information_schema\'!!!')
} else {
	print('Missing record when insert data to policy_message corresponding to jobName:\'MySQL.Database_Area.JobTest02\'!!!')
}

// for each record
while(dataAll.hasNext()) {
	// get record
	var jobObj = dataAll.next()
	record++
	print('==========Record number===========: ' + record)
	// check data of policy_message contains evaluate of job
	if(jobObj.jobName == 'MySQL.Database_Area.JobTest02' && jobObj.istIid == "") {
		print('=====Insert record general successfully!!!=====')
	} else {
		print('=====Insert record general failed!!!=====')
	}

	// check data of policy_message does not contains instance 1
	if(jobObj.jobName == 'MySQL.Database_Area.JobTest02' && jobObj.istIid == "inst1-@MYSQL-information_schema") {
		print('=====Insert record instance_1 successfully!!!=====')
	} else {
		print('=====Insert record instance_1 failed!!!=====')
	}

	// check data of policy_message does not contains instance 1
	if(jobObj.jobName == 'MySQL.Database_Area.JobTest02' && jobObj.istIid == "inst2-@MYSQL-information_schema") {
		print('=====Insert record instance_2 successfully!!!=====')
	} else {
		print('=====Insert record instance_2 failed!!!=====')
	}
	printjson(jobObj);
	print('\n')
}
