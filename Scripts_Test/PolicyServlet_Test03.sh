echo ">>>>> TEST GET METHOD OF POLICY SERVLET (with job is Store)<<<<<"
content=$(curl -i -H "Accept: application/json" -H "Content-Type: application/json" 'http://localhost:13111/policyServlet?job_name=MySQL.Database_Area.InnoDBTablespace_Free&type=Store')
echo "Result response data after GET request:"
echo "--------------------------------------------"
echo $content
echo "--------------------------------------------"
echo "Check OK if content contains [POLICY] string"
if [[ $content =~ .*'"POLICY":'.* ]]
then
echo "[MESSAGE TEST] GET IS OK"
echo ">>>>> TEST POST METHOD OF POLICY SERVLET (params is not empty)<<<<<"
contentPost=$(curl -X POST -H "Accept: application/json" -H "Content-type: application/json" -d '{"action":"WRITE2FILE",
	"jobName":"MySQL.Database_Area.InnoDBTablespace_Free","instanceName":"master",
	"params" : {"name":"thanhmx_test","number":"12345"},
	"policyStr":"POLICY = {
		resultData->\n 
		def listMess = []\n 
		def ret = ['jobName' : 'MySQL.Database_Area.InnoDBTablespace_Free', 'istIid' : 'master']\n 
		resultData.each{data->\n 
			if((data.UsedPct < 1)){\n 
				listMess.add([level: 3, message: \"\"\"Message test for policyServlet03!!!\"\"\"])\n }\n }\n 
				ret['message'] = listMess\n return ret\n}"}' 'http://localhost:13111/policyServlet' -v)
echo "Result response data after POST request:"
echo "--------------------------------------------"
echo $contentPost
echo "--------------------------------------------"
echo "Check OK if content contains [status] string"
if [[ $contentPost =~ .*'status'.* ]]
then
echo "[MESSAGE TEST] POST IS OK"
echo "*NOTE: CHECK IN FOLDER VAR/JOB/POLICY: MySQL.Database_Area.InnoDBTablespace_Free.master.policy WAS CREATED !!!"
fi
else
echo "[MESSAGE TEST] GET IS FAILURE, SO CANNOT TEST POST METHOD"
fi
