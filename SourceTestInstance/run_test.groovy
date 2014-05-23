public class TestPolicy{
	public static void main(String [] args){
		String dirFolderTest = System.getProperty("user.dir");
		File dir = new File(dirFolderTest);
		List<String> listCmd = new LinkedList<String>();
		def output = ""
		try {
			def pathToWiperdog = ""
			def caseTest = ""
			def strConnectMongo = ""
			args.eachWithIndex {item, index ->
				// get path to wiperdog
				if ((index < (args.size() - 1)) && (item == "-p") && (args[index+1] != null)) {
					pathToWiperdog = args[index+1].replaceAll("\"", "").replaceAll("\'", "").trim()
				}
				// get case want to test
				if ((index < (args.size() - 1)) && (item == "-c") && (args[index+1] != null)) {
					caseTest = args[index+1].replaceAll("\"", "").replaceAll("\'", "").trim()
				}
				// get string connection to mongodb
				if ((index < (args.size() - 1)) && (item == "-s") && (args[index+1] != null)) {
					strConnectMongo = args[index+1].replaceAll("\"", "").replaceAll("\'", "").trim()
				}
			}
			
			// remove record corresponding to job test about evaluate policy
			def removeRecord = dirFolderTest + "/RemoveRecordPolicy.js"
			listCmd.add("/usr/bin/mongo")
			listCmd.add(strConnectMongo)
			listCmd.add(removeRecord)
			// run command
			output = runProcClosure(listCmd, dir, true)
			println output

			// create policy and params file
			def createPolicyParams = dirFolderTest + "/$caseTest/Create_Policy_Params.sh"
			listCmd = new LinkedList<String>();
			listCmd.add("/bin/bash")
			listCmd.add(createPolicyParams)
			// get output when run command
			output = runProcClosure(listCmd, dir, true)
			if(output.contains("\"status\":\"OK\"")) {
				println "Create policy and params file successfully!!!"			
			} else {
				println "Create policy and params file failed!!!"
			}

			// copy job, trg, instances file to var/job
			def toFolder = pathToWiperdog + "var/job/"
			def fromFolder
			(new File(dirFolderTest + "/job/")).listFiles().each{
				fromFolder = it.toString()
				listCmd = new LinkedList<String>();
				listCmd.add("/bin/cp")
				listCmd.add(fromFolder)
				listCmd.add(toFolder)
				// get output when run command
				runProcClosure(listCmd, dir, true)
			}
			println "waiting for wiperdog processing..."
			sleep(60000)
			// run testcase
			def pathToTestcase = dirFolderTest + "/$caseTest/TestCase.js"
			listCmd = new LinkedList<String>();
			listCmd.add("/usr/bin/mongo")
			listCmd.add(strConnectMongo)
			listCmd.add(pathToTestcase)
			// get output when run command
			output = runProcClosure(listCmd, dir, true)
			if(caseTest == "Case1") {
				if(output.contains("Insert record general failed") || output.contains("Missing record")){
					println "====Test failed!!!===="
				} else {
					println "====Test successfully!!!===="
				}
			} else if(caseTest == "Case2") {
				if(output.contains("Inserted only one record") && output.contains("Insert record instance_1 successfully") && output.contains("Insert record instance_2 failed") && output.contains("Insert record general failed")){
					println "====Test successfully!!!===="
				} else {
					println "====Test failed!!!===="
				}
			} else if(caseTest == "Case3") {
				if(output.contains("Insert record general successfully") && output.contains("Insert record instance_1 successfully") && output.contains("Insert record instance_2 failed")){
					println "====Test successfully!!!===="
				} else {
					println "====Test failed!!!===="
				}
			} else {
				if(output.contains("Insert record general successfully") && output.contains("Insert record instance_1 successfully") && output.contains("Insert record instance_2 successfully")){
					println "====Test successfully!!!===="
				} else {
					println "====Test failed!!!===="
				}
			} 
		}catch(Exception ex){
			ex.printStackTrace()
		}
	}

	/**
	 * run command with ProcessBuider
	 * @param listCmd list command
	 * @param dir directory of project
	 * @param waitFor 
	 * @return
	 */
	public static String runProcClosure(listCmd,dir,waitFor){
		def output = [:]
		ProcessBuilder builder = new ProcessBuilder(listCmd);
		builder.redirectErrorStream(true);
		builder.directory(dir);
		Process p = builder.start();
		if(waitFor){
			output['exitVal'] = p.waitFor()
		}
		InputStream procOut  = p.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(procOut))
		def line = null
		StringBuffer stdin = new StringBuffer()
		while((line = br.readLine()) != null){
			stdin.append(line + "\n")
		}
		output["message"] = stdin.toString()
		return output["message"]
	}
}
