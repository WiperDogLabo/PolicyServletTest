Source test for insert data with instance job.
---------------------------------------------
How to test?  
- Step1: Copy default.params to var/conf and update dest to mongodb corresponding.  
- Step2: Start wiperdog.sh  
- Step3: run ./run_test.sh with format  
	./run_test.sh -p /home/mrtit/Wiperdog/1205Wiperdog/ -s 10.0.1.189:27017/wiperdog -c Case1  
- Step4: Check result  
