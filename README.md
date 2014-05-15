This test for policyServlet on wiperdog (issue #380).  
----------------------------------------------------  
Using Curl command to test servlet's functions.    
 1. Test write policy and params file on xwiki  
 Insert data to mongodb for test  
  - Start mongodb.  
  - Run /PutDataDummy/Run_Put_Data_Dummy.sh to insert data to mongodb.  
  - Check on xwiki, create policy and params file success  
  
 2. Test get data from servlet and process create policy, params file success  
  - Run startWiperdog.sh  
  - And then Run_Script_Test.sh for test  
  - Check the result into folder /log/ and file will be created to /var/job/policy.  
  - Policy and params will be load to page processPolicy on Xwiki successfully.  
  
 3. Test policy evaluate
  - Run startWiperdog.sh  
  - Need to create policy and params file by Run_Script_Test.sh  
  - Push job, trigger attachments to var/job  
  - Wait and check result in mongodb  
