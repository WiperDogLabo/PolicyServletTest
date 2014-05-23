// get collections
var cols = db.getCollection("policy_message");
// remove all record corresponding to jobname
cols.remove({jobName: 'MySQL.Database_Area.JobTest01'})
// check remove success
var data = cols.find({jobName: 'MySQL.Database_Area.JobTest01'});
if(data.size() > 0) {
	print("====Remove record failed!!!====")
} else {
	print("====Remove record successfully!!!====")
}
