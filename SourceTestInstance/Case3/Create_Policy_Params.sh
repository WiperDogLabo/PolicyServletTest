echo ">>>>>Create Policy and Params file<<<<<"
contentPost=$(curl -X POST -H "Accept: application/json" -H "Content-type: application/json" -d '{"action":"WRITE2FILE",
	"jobName":"MySQL.Database_Area.JobTest03","instanceName":"",
	"params" : {"MaxTime":"50"},
	"policyStr":"POLICY = {
		resultData->\n 
		def listMess = []\n 
		def ret = [\"jobName\" : \"MySQL.Database_Area.JobTest03\", \"istIid\" : \"\"]\n 
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
	echo "CHECK IN FOLDER VAR/JOB/POLICY: MySQL.Database_Area.JobTest03.policy and MySQL.Database_Area.JobTest03.params WAS CREATED !!!"
else
	echo "[MESSAGE TEST] GET IS FAILURE, SO CANNOT TEST POST METHOD"
fi

echo ">>>>>Create Policy and Params instance_1 file<<<<<"
contentPost=$(curl -X POST -H "Accept: application/json" -H "Content-type: application/json" -d '{"action":"WRITE2FILE",
	"jobName":"MySQL.Database_Area.JobTest03","instanceName":"inst1-@MYSQL-information_schema",
	"params" : {"MaxRead":"20"},
	"policyStr":"POLICY = {
		resultData->\n 
		def listMess = []\n 
		def ret = [\"jobName\" : \"MySQL.Database_Area.JobTest03\", \"istIid\" : \"inst1-@MYSQL-information_schema\"]\n 
		resultData.each{data->\n 
			if((data.ReadsCumCnt > MaxRead)){\n 
				listMess.add([level: 1, message: \"\"\"Message test for instance 1!!!\"\"\"])\n }\n }\n 
				ret[\"message\"] = listMess\n return ret\n}"}' 'http://localhost:13111/policyServlet' -v)
echo "Result response data after POST request:"
echo "--------------------------------------------"
echo $contentPost
echo "--------------------------------------------"
echo "Check OK if content contains [status] string"
if [[ $contentPost =~ .*'status'.* ]]; then
	echo "[MESSAGE TEST] POST IS OK"
	echo "CHECK IN FOLDER VAR/JOB/POLICY: MySQL.Database_Area.JobTest03.inst1-@MYSQL-information_schema.policy and MySQL.Database_Area.JobTest03.inst1-@MYSQL-information_schema.params WAS CREATED !!!"
else
	echo "[MESSAGE TEST] GET IS FAILURE, SO CANNOT TEST POST METHOD"
fi
