echo ">>>>>Create Policy and Params file<<<<<"
contentPost=$(curl -X POST -H "Accept: application/json" -H "Content-type: application/json" -d '{"action":"WRITE2FILE",
	"jobName":"MySQL.Database_Area.JobTest01","instanceName":"",
	"params" : {"MaxTime":"50"},
	"policyStr":"POLICY = {
		resultData->\n 
		def listMess = []\n 
		def ret = [\"jobName\" : \"MySQL.Database_Area.JobTest01\", \"istIid\" : \"\"]\n 
		resultData.each{data->\n 
			if((data.AverageIOTimeCumDbl < MaxTime)){\n 
				listMess.add([level: 1, message: \"\"\"Message test for job!!!\"\"\"])\n }\n }\n 
				ret[\"message\"] = listMess\n return ret\n}"}' 'http://localhost:13111/policyServlet' -v)
echo "Result response data after POST request:"
echo "--------------------------------------------"
echo $contentPost
echo "--------------------------------------------"
echo "Check OK if content contains [status] string"
if [[ $contentPost =~ .*'status'.* ]]; then
	echo "[MESSAGE TEST] POST IS OK"
	echo "CHECK IN FOLDER VAR/JOB/POLICY: MySQL.Database_Area.JobTest01.policy and MySQL.Database_Area.JobTest01.params WAS CREATED !!!"
else
	echo "[MESSAGE TEST] GET IS FAILURE, SO CANNOT TEST POST METHOD"
fi
