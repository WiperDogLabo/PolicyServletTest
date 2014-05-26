// get collections
var cols = db.getCollection("policy_message");
// remove all record corresponding to jobname
cols.remove({jobName: 'MySQL.Database_Area.JobTest01'})
cols.remove({jobName: 'MySQL.Database_Area.JobTest02'})
cols.remove({jobName: 'MySQL.Database_Area.JobTest03'})
cols.remove({jobName: 'MySQL.Database_Area.JobTest04'})
// check remove success
var dataCase1 = cols.find({jobName: 'MySQL.Database_Area.JobTest01'});
var dataCase2 = cols.find({jobName: 'MySQL.Database_Area.JobTest02'});
var dataCase3 = cols.find({jobName: 'MySQL.Database_Area.JobTest03'});
var dataCase4 = cols.find({jobName: 'MySQL.Database_Area.JobTest04'});
if(dataCase1.size() > 0 || dataCase2.size() > 0 || dataCase3.size() > 0 || dataCase4.size() > 0) {
	print("====Remove record failed!!!====")
} else {
	print("====Remove record successfully!!!====")
}
