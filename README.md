This test for policyServlet on wiperdog (issue #380).  
----------------------------------------------------  
Using Curl command to test servlet's functions.  
 1. Insert data to mongodb for test  
  - Start mongodb.  
  - Run /PutDataDummy/Run_Put_Data_Dummy.sh to insert data to mongodb.  

 2. Start test  
  - Run startWiperdog.sh  
  - And then Run_Script_Test.sh for test  
  - Check the result into folder /log/ and file will be created to /var/job/policy.  
  - Policy and params will be load to page processPolicy on Xwiki successfully.  
