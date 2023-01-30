@echo off
title KeyAuth Seller API Bat Edition
:sellerpage
cls
echo Please enter SellerKey
set /p sellerkey=< sellerkey.txt
if %sellerkey% == enter goto :options
echo %sellerkey% > sellerkey.txt

:options
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                      What would you like to access? 
echo ------------------------------------------------------------------------
echo.
echo [1]  Licenses                             [7]  Files        
echo [2]  Users                                [8]  Variables    
echo [3]  Subscriptions                        [9]  Blacklists   
echo [4]  Chats                                [10] Settings     
echo [5]  Sessions                             [11] Accounts     
echo [6]  Webhooks                             [12] Web Loader   
echo.
echo [13] KeyAuth Docs 
echo.
set /p options=
if %options% == 1 goto :Licenses
if %options% == 2 goto :Users
if %options% == 3 goto :Subscriptions
if %options% == 4 goto :Chats
if %options% == 5 goto :Sessions
if %options% == 6 goto :Webhooks
if %options% == 7 goto :Files
if %options% == 8 goto :Variables
if %options% == 9 goto :Blacklists
if %options% == 10 goto :Settings
if %options% == 11 goto :Accounts
if %options% == 12 goto :WebLoader
if %options% == r goto :sellerpage
if %options% == 13 start https://docs.keyauth.cc 
pause
goto :options

:Licenses
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------#
echo                       Licenses  
echo ------------------------------------------------------------------------#
echo.
echo [Main]                                   [Ban]                                      [Delete]          
echo [1] Create License(s)                    [7]  Ban License                          [10] Delete License              
echo [2] Verify License Exists                [8]  Unban License                        [11] Delete Unused Licenses      
echo [3] Use License To Create User           [9]  Add Time To Unused Licenses          [12] Delete Used Licenses        
echo [4] Set Note                                                                        [13] Delete All Licenses        
echo [5] Fetch All License                 
echo [6] Retrieve License From User       
echo.                                 
set /p Licenses=
if %Licenses% == 1 goto :License_CreateLicense
if %Licenses% == 2 goto :License_VerifyLicenseExists
if %Licenses% == 3 goto :License_UserLicenseToCreateUser
if %Licenses% == 4 goto :License_SetNote
if %Licenses% == 5 goto :License_FetchAllLicenses
if %Licenses% == 6 goto :License_RetrieveLicenseFromUser
if %Licenses% == 7 goto :License_BanLicense
if %Licenses% == 8 goto :License_UnbanLicense
if %Licenses% == 9 goto :License_AddTimeToUnusedLicenses
if %Licenses% == 10 goto :License_DeleteLicense
if %Licenses% == 11 goto :License_DeleteUnusedLicenses
if %Licenses% == 12 goto :License_DeleteUsedLicenses
if %Licenses% == 13 goto :License_DeleteAllLicenses
if %licenses% == r goto :sellerpage
if %licenses% == m goto :options
pause

:License_CreateLicense
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------#
echo                       Create License(s)  
echo ------------------------------------------------------------------------#
echo.
echo How many licenses would you like to create?
set /p LicenseAmount=
if %LicenseAmount% == r goto :sellerpage
if %LicenseAmount% == m goto :options
echo When would you like the license(s) to expire?
set /p LicenseExpire=
if %LicenseExpire% == r goto :sellerpage
if %LicenseExpire% == m goto :options
echo What would you like the format of the license(s) to be?
set /p LicenseMask=
if %LicenseMask% == r goto :sellerpage
if %LicenseMask% == m goto :options
echo What level would you like the license(s) to be?
set /p LicenseLevel=
if %LicenseLevel% == r goto :sellerpage
if %LicenseLevel% == m goto :options
echo.
echo Response:
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=add&expiry=%LicenseExpire%&mask=%LicenseMask%&level=%LicenseLevel%&amount=%LicenseAmount%&format=json')"
echo Please wait, creating new license(s)...
pause
goto :options

:License_VerifyLicenseExists
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Verify License Exists  
echo ------------------------------------------------------------------------
echo.
echo What is the license you'd like to check?
set /p VerifyLicense=
if %VerifyLicense% == r goto :sellerpage
if %VerifyLicense% == m goto :options
echo.
echo Response:
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=verify&key=%VerifyLicense%')"
echo Please wait, verifying license exist...
pause
goto :options

:License_UserLicenseToCreateUser
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Create User Using License  
echo ------------------------------------------------------------------------
echo.
echo What would you like the username to be?
set /p CreateUserUsingLicenseUsername=
if %CreateUserUsingLicenseUsername% == r goto :sellerpage
if %CreateUserUsingLicenseUsername% == m goto :options
echo What would you like the password to be?
set /p CreateUserUsingLicensePassword=
if %CreateUserUsingLicensePassword% == r goto :sellerpage
if %CreateUserUsingLicensePassword% == m goto :options
echo What is the key?
set /p CreateUserUsingLicenseKey=
if %CreateUserUsingLicenseKey% == r goto :sellerpage
if %CreateUserUsingLicenseKey% == m goto :options
echo.
echo Response:
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=activate&user=%CreateUserUsingLicenseUsername%&key=%CreateUserUsingLicenseKey%&pass=%CreateUserUsingLicensePassword%')"
echo Please wait, creating user using license...
pause
goto :options

:License_DeleteLicense
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete License  
echo ------------------------------------------------------------------------
echo.
echo What's the license you would like to delete?
set /p LicenseToDelete=
if %LicenseToDelete% == r goto :sellerpage
if %LicenseToDelete% == m goto :options
echo.
echo Response:
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=del&key=%LicenseToDelete%&userToo=0')"
echo Please wait, deleting license...
pause
goto :options

:License_DeleteUnusedLicenses
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete Unused Licenses  
echo ------------------------------------------------------------------------
echo.
echo Are you sure you want to delete unused licenses?
echo [1] Yes [2] No
set /p deleteUnusedLicenses=
if %deleteUnusedLicenses% == 1 PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=delunused')" 
echo Please wait, deleting unused licenses...
if %deleteUnusedLicenses% == 2 goto :options
if %deleteUnusedLicenses% == r goto :sellerpage
if %deleteUnusedLicenses% == m goto :options
pause
goto :options

:License_DeleteUsedLicenses
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete Used Licenses  
echo ------------------------------------------------------------------------
echo.
echo Are you sure you want to delete used licenses?
echo [1] Yes [2] No
set /p deleteUsedLicenses=
if %deleteUsedLicenses% == 1 PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=delused')"  
echo Please wait, deleting used licenses...
if %deleteUsedLicenses% == 2 goto :options
if %deleteUsedLicenses% == r goto :sellerpage
if %deleteUsedLicenses% == m goto :options
goto :options

:License_FetchAllLicenses
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Fetch All Licenses  
echo ------------------------------------------------------------------------
echo.
echo Please wait, gathering licenses...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=fetchallkeys')" 
echo.
pause
goto :options

:License_AddTimeToUnusedLicenses
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Add Time To Unused Licenses  
echo ------------------------------------------------------------------------
echo.
echo How much time would you like to add?
set /p AddTimeToUnusedLicenses=
if %AddTimeToUnusedLicenses% == r goto :sellerpage
if %AddTimeToUnusedLicenses% == m goto :options
echo Please wait, adding time to unused licenses...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=addtime&time=%AddTimeToUnusedLicenses%')" 
pause
goto :options

:License_BanLicense
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Ban License  
echo ------------------------------------------------------------------------
echo.
echo What license would you like to ban?
set /p LicenseToBan=
if %LicenseToBan% == r goto :sellerpage
if %LicenseToBan% == m goto :options
echo What's the reason for banning the license?
set /p LicenseBanReason=
if %LicenseBanReason% == r goto :sellerpage
if %LicenseBanReason% == m goto :options
echo Please wait, banning license...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=ban&key=%LicenseToBan%&reason=%LicenseBanReason%&userToo=0')" 
pause
goto :options

:License_UnbanLicense
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Unban License  
echo ------------------------------------------------------------------------
echo.
echo What license would you like to unban?
set /p LicenseToUnban=
if %LicenseToUnban% == r goto :sellerpage
if %LicenseToUnban% == m goto :options
echo Please wait, unbanning license...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=unban&key=%LicenseToUnban%')" 
pause
goto :options

:License_RetrieveLicenseFromUser
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Retrieve License From User  
echo ------------------------------------------------------------------------
echo.
echo What's the username that license is associated with?
set /p RetrieveLicenseFromUser=
if %RetrieveLicenseFromUser% == r goto :sellerpage
if %RetrieveLicenseFromUser% == m goto :options
echo Please wait, retrieving license from user...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=getkey&user=%RetrieveLicenseFromUser%')" 
pause
goto :options

:License_SetNote
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Set Note  
echo ------------------------------------------------------------------------
echo.
echo What license would you like to add a note to?
set /p AddNoteToLicense=
if %AddNoteToLicense% == r goto :sellerpage
if %AddNoteToLicense% == m goto :options
echo What's the note you'd like to add?
set /p NoteToAddToLicense=
if %NoteToAddToLicense% == r goto :sellerpage
if %NoteToAddToLicense% == m goto :options
echo Please wait, setting note...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=setnote&key=%AddNoteToLicense%&note=%NoteToAddToLicense%')" 
pause
goto :options

:Users
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------#
echo                       Users  
echo ------------------------------------------------------------------------#
echo.
echo [Main]                     [Ban]               [Delete] 
echo [1] Create User            [17] Ban User       [19] Delete User
echo [2] Reset Users HWID       [18] Unban User     [20] Delete Expired Users
echo [3] Set Users Variable                         [21] Delete All User Variables With Name
echo [4] Get User Variable Data                     [22] Delete User Variable
echo [5] Extend User(s)                             [23] Delete Users Subscriptions
echo [6] Reset All Users HWIDs                      [24] Delete All Users
echo [7] Verify User Exists
echo [8] Add HWID To User
echo [9] Fetch All Users
echo [10] Change Password
echo [11] Fetch All User Variables
echo [12] Retrieve User Data
echo [13] Fetch All Usernames
echo [14] Count Subscriptions
echo [15] Set Users Cooldown
echo [16] Subtract Time From Subscription
echo.    
set /p UsersInput=
if %UsersInput% == m goto :options
if %UsersInput% == r goto :sellerpage
if %UsersInput% == 1 goto :Users_CreateUser
if %UsersInput% == 2 goto :Users_ResetUsersHWID
if %UsersInput% == 3 goto :Users_SetUsersVariable
if %UsersInput% == 4 goto :Users_GetUserVariableData
if %UsersInput% == 5 goto :Users_ExtendUsers
if %UsersInput% == 6 goto :Users_ResetAllUsersHWIDs
if %UsersInput% == 7 goto :Users_VerifyUserExists
if %UsersInput% == 8 goto :Users_AddHWIDToUser
if %UsersInput% == 9 goto :Users_FetchAllUsers
if %UsersInput% == 10 goto :Users_ChangePassword
if %UsersInput% == 11 goto :Users_FetchAllUserVariables
if %UsersInput% == 12 goto :Users_RetrieveUserData
if %UsersInput% == 13 goto :Users_FetchAllUsernames
if %UsersInput% == 14 goto :Users_CountSubscriptions
if %UsersInput% == 15 goto :Users_SetUsersCooldown
if %UsersInput% == 16 goto :Users_SubtractFromUserSubscription
if %UsersInput% == 17 goto :Users_BanUser
if %UsersInput% == 18 goto :Users_UnbanUser
if %UsersInput% == 19 goto :Users_DeleteUser
if %UsersInput% == 20 goto :Users_DeleteExpiredUsers
if %UsersInput% == 21 goto :Users_DeleteAllUserVariablesWithName
if %UsersInput% == 22 goto :Users_DeleteUserVariable
if %UsersInput% == 23 goto :Users_DeleteUsersSubscriptions
if %UsersInput% == 24 goto :Users_DeleteAllUsers
pause 

:Users_CreateUser
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Create User
echo ------------------------------------------------------------------------
echo.
echo What's the username?
set /p CreateUserUsernameInput=
if %CreateUserUsernameInput% == r goto :sellerpage
if %CreateUserUsernameInput% == m goto :options
echo What's the subscription?
set /p CreateUserSubscriptionInput=
if %CreateUserSubscriptionInput% == r goto :sellerpage
if %CreateUserSubscriptionInput% == m goto :options
echo What's the expiration? (in days)
set /p CreateUserExpirationInput=
if %CreateUserExpirationInput% == r goto :sellerpage
if %CreateUserExpirationInput% == m goto :options
echo What's the password?
set /p CreateUserPasswordInput=
if %CreateUserPasswordInput% == r goto :sellerpage
if %CreateUserPasswordInput% == m goto :options
echo Please wait, creating new user...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=adduser&user=%CreateUserUsernameInput%&sub=%CreateUserSubscriptionInput%&expiry=%CreateUserExpirationInput%&pass=%CreateUserPasswordInput%')" 
pause
goto :options

:Users_ResetUsersHWID
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Reset User HWID
echo ------------------------------------------------------------------------
echo.
echo What's the username?
set /p ResetUserHWIDInput=
if %ResetUserHWIDInput% == r goto :sellerpage
if %ResetUserHWIDInput% == m goto :options
echo Please wait, resetting user HWID...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=resetuser&user=ResetUserHWIDInput')" 
pause
goto :options

:Users_SetUsersVariable
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Set User Variable
echo ------------------------------------------------------------------------
echo.
echo What's the username?
set /p SetUserVarInput=
if %SetUserVarInput% == r goto :sellerpage
if %SetUserVarInput% == m goto :options
echo What's the variable name?
set /p SetUserVarNameInput=
if %SetUserVarNameInput% == r goto :sellerpage
if %SetUserVarNameInput% == m goto :options
echo What's the data of the variable you'd like to set?
set /p SetUserVarDataInput=
if %SetUserVarDataInput% == r goto :sellerpage
if %SetUserVarDataInput% == m goto :options
echo Please wait, setting user variable...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=setvar&user=%SetUserVarInput%&var=%SetUserVarNameInput%&data=%SetUserVarDataInput%')" 
pause
goto :options

:Users_GetUserVariableData
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Get User Variables
echo ------------------------------------------------------------------------
echo.
echo What's the username?
set /p GetUserVarDataInput=
if %GetUserVarDataInput% == r goto :sellerpage
if %GetUserVarDataInput% == m goto :options
echo What's the variable name?
set /p GetUserVarDataIDInput=
if %GetUserVarDataIDInput% == r goto :sellerpage
if %GetUserVarDataIDInput% == m goto :options
echo Please wait, gathering user variable data...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=getvar&user=%GetUserVarDataInput%&var=%GetUserVarDataIDInput%')" 
pause
goto :options

:Users_ExtendUsers
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Extend Users
echo ------------------------------------------------------------------------
echo.
echo What's the username you'd like to extend?
set /p ExtendUserInput=
if %ExtendUserInput% == r goto :sellerpage
if %ExtendUserInput% == m goto :options
echo What's the subscription?
set /p ExtendUserSubInput=
if %ExtendUserSubInput% == r goto :sellerpage
if %ExtendUserSubInput% == m goto :options
echo How much time would you like to add on?
set /p ExtendUserTimeInput=
if %ExtendUserTimeInput% == r goto :sellerpage
if %ExtendUserTimeInput% == m goto :options
echo Please wait, extending user...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=extend&user=%ExtendUserInput%&sub=%ExtendUserSubInput%&expiry=%ExtendUserTimeInput%')" 
pause
goto :options

:Users_ResetAllUsersHWIDs
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Reset All Users HWIDs
echo ------------------------------------------------------------------------
echo.
echo Are you sure you want to reset all users HWIDs? Y/N
set /p ResetAllUsersHWIDInput=
if %ResetAllUsersHWIDInput% == r goto :sellerpage
if %ResetAllUsersHWIDInput% == m goto :options
if %ResetAllUsersHWIDInput% == Y PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=resetalluser')" 
echo Please wait, resetting all users HWIDs...
if %ResetAllUsersHWIDInput% == N goto :options
pause
goto :options

:Users_VerifyUserExists
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Verify User Exists
echo ------------------------------------------------------------------------
echo.
echo What's the username you'd like to verify?
set /p VerifyUserExistsInput=
if %VerifyUserExistsInput% == r goto :sellerpage
if %VerifyUserExistsInput% == m goto :options
echo Please wait, verifying user...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=verifyuser&user=%VerifyUserExistsInput%')" 
pause
goto :options

:Users_AddHWIDToUser
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Add HWID To User
echo ------------------------------------------------------------------------
echo.
echo What's the username you'd like to add a HWID to?
set /p AddHWIDToUserInput=
if %AddHWIDToUserInput% == r goto :sellerpage
if %AddHWIDToUserInput% == m goto :options
echo What's the HWID you'd like to add?
set /p AddHWIDToUserIDInput=
if %AddHWIDToUserIDInput% == r goto :sellerpage
if %AddHWIDToUserIDInput% == m goto :options
echo Please wait, adding new HWID to user...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=addhwiduser&user=%AddHWIDToUserInput%&hwid=%AddHWIDToUserIDInput%')" 
pause
goto :options

:Users_FetchAllUsers
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Fetch All Users
echo ------------------------------------------------------------------------
echo.
echo Please wait, fetching all users...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=fetchallusers')" 
pause
goto :options

:Users_ChangePassword
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Change Password
echo ------------------------------------------------------------------------
echo.
echo What's the username you'd like to change the password of?
set /p ChangePasswordUsernameInput=
if %ChangePasswordUsernameInput% == r goto :sellerpage
if %ChangePasswordUsernameInput% == m goto :options
echo What's the new password you'd like to set?
set /p ChangePasswordInput=
if %ChangePasswordInput% == r goto :sellerpage
if %ChangePasswordInput% == m goto :options
echo Please wait, changing password...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=resetpw&user=%ChangePasswordUsernameInput%&passwd=%ChangePasswordInput%')" 
pause
goto :options

:Users_FetchAllUserVariables
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Fetch All User Variables
echo ------------------------------------------------------------------------
echo.
echo Please wait, fetching all user variables...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=fetchalluservars')" 
pause
goto :options

:Users_RetrieveUserData
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Retrieve User Data
echo ------------------------------------------------------------------------
echo.
echo What's the username you'd like to retrieve data from?
set /p RetrieveUserDataInput=
if %RetrieveUserDataInput% == r goto :sellerpage
if %RetrieveUserDataInput% == m goto :options
echo Please wait, retrieving user data...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=userdata&user=%RetrieveUserDataInput%')" 
pause
goto :options

:Users_FetchAllUsernames
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Fetch All Usernames
echo ------------------------------------------------------------------------
echo.
echo Please wait, fetching all usernames...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=fetchallusernames')" 
pause
goto :options

:Users_SubtractFromUserSubscription
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Subsctract From User Subscription
echo ------------------------------------------------------------------------
echo.
echo What's the username name?
set /p SubtractFromSubUsernameInput=
if %SubtractFromSubUsernameInput% == r goto :sellerpage
if %SubtractFromSubUsernameInput% == m goto :options
echo What's the subscription name?
set /p SubtractFromSubSubnameInput=
if %SubtractFromSubSubnameInput% == r goto :sellerpage
if %SubtractFromSubSubnameInput% == m goto :options
echo What's the duration you'd like to subtract? (seconds)
set /p SubtractFromSubDurationInput=
if %SubtractFromSubDurationInput% == r goto :sellerpage
if %SubtractFromSubDurationInput% == m goto :options
echo Please wait, subtracting from subscription...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=subtract&user=%SubtractFromSubUsernameInput%&sub=%SubtractFromSubSubnameInput%&seconds=%SubtractFromSubDurationInput%')" 
pause
goto :options

:Users_CountSubscriptions
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Count Subscriptions
echo ------------------------------------------------------------------------
echo.
echo What's the subscription name?
set /p CountSubscriptionInput=
if %CountSubscriptionInput% == r goto :sellerpage
if %CountSubscriptionInput% == m goto :options
echo Please wait, counting subscriptions...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=countsubs&name=%CountSubscriptionInput%')" 
pause
goto :options

:Users_SetUsersCooldown
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Set Users Cooldown
echo ------------------------------------------------------------------------
echo.
echo What's the username you'd like to set a cooldown for?
set /p SetUserCooldownInput=
if %SetUserCooldownInput% == r goto :sellerpage
if %SetUserCooldownInput% == m goto :options
echo How long would you like the cooldown to last for? (seconds)
set /p SetUserCooldownDurationInput=
if %SetUserCooldownDurationInput% == r goto :sellerpage
if %SetUserCooldownDurationInput% == m goto :options
echo Please wait, setting user cooldown...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=setcooldown&user=%SetUserCooldownInput%&cooldown=%SetUserCooldownDurationInput%')" 
pause
goto :options

:Users_BanUser
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Ban User
echo ------------------------------------------------------------------------
echo.
echo What's the username you'd like to ban?
set /p BanUserInput=
if %BanUserInput% == r goto :sellerpage
if %BanUserInput% == m goto :options
echo Why are you banning the user?
set /p BanUserReasonInput=
if %BanUserReasonInput% == r goto :sellerpage
if %BanUserReasonInput% == m goto :options
echo Please wait, banning user...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=banuser&user=%BanUserInput%&reason=%BanUserReasonInput%')" 
pause
goto :options

:Users_UnbanUser
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Unban User
echo ------------------------------------------------------------------------
echo.
echo What's the username you'd like to unban?
set /p UnbanUserInput=
if %UnbanUserInput% == r goto :sellerpage
if %UnbanUserInput% == m goto :options
echo Please wait, unbanning user...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=unbanuser&user=%UnbanUserInput%')" 
pause
goto :options

:Users_DeleteUser
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete User
echo ------------------------------------------------------------------------
echo.
echo What's the username you'd like to delete?
set /p DeleteUserInput=
if %DeleteUserInput% == r goto :sellerpage
if %DeleteUserInput% == m goto :options
echo Please wait, deleting user...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=deluser&user=%DeleteUserInput%')" 
pause
goto :options

:Users_DeleteExpiredUsers
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete Expired Users
echo ------------------------------------------------------------------------
echo.
echo Are you sure you want to delete all expired users? Y/N
set /p DeleteExpiredUsersInput=
if %DeleteExpiredUsersInput% == r goto :sellerpage
if %DeleteExpiredUsersInput% == m goto :options
if %DeleteExpiredUsersInput% == Y PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=delexpusers')" 
echo Please wait, deleting all expired users...
if %DeleteExpiredUsersInput% == N goto :options
pause
goto :options

:Users_DeleteAllUserVariablesWithName
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete All User Variables
echo ------------------------------------------------------------------------
echo.
echo What is the name?
set /p DeleteAllUserVarInput=
if %DeleteAllUserVarInput% == r goto :sellerpage
if %DeleteAllUserVarInput% == m goto :options
echo Please wait, deleting all user variables...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=massUserVarDelete&name=%DeleteAllUserVarInput%')" 
pause
goto :options

:Users_DeleteUserVariable
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete User Variable
echo ------------------------------------------------------------------------
echo.
echo What is the username?
set /p DeleteUserVarInput=
if %DeleteUserVarInput% == r goto :sellerpage
if %DeleteUserVarInput% == m goto :options
echo What is the variable name?
set /p DeleteUserVarIDInput=
if %DeleteUserVarIDInput% == r goto :sellerpage
if %DeleteUserVarIDInput% == m goto :options
echo Please wait, deleting user variable...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=deluservar&user=%DeleteUserVarInput%&var=%DeleteUserVarIDInput%')" 
pause
goto :options

:Users_DeleteUsersSubscriptions
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete User Subscription
echo ------------------------------------------------------------------------
echo.
echo What is the username?
set /p DeleteUserSubInput=
if %DeleteUserSubInput% == r goto :sellerpage
if %DeleteUserSubInput% == m goto :options
echo What is the subscription name?
set /p DeleteUserSubIDInput=
if %DeleteUserSubIDInput% == r goto :sellerpage
if %DeleteUserSubIDInput% == m goto :options
echo Please wait, deleting user subscription...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=delsub&user=%DeleteUserSubInput%&sub=%DeleteUserSubIDInput%')" 
pause
goto :options

:Users_DeleteAllUsers
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete All Users
echo ------------------------------------------------------------------------
echo.
echo Are you sure you want to delete all users? Y/N
set /p DeleteAllUsersInput=
if %DeleteAllUsersInput% == r goto :sellerpage
if %DeleteAllUsersInput% == m goto :options
if %DeleteAllUsersInput% == Y PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=delallusers')" 
echo Please wait, deleting all users...
if %DeleteAllUsersInput% == N goto :options
pause
goto :options

:Subscriptions
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------#
echo                       Subscriptions  
echo ------------------------------------------------------------------------#
echo.
echo [Main]                        [Delete]
echo [1] Create Subscription       [4] Delete Subscription
echo [2] Fetch All Subscriptions
echo [3] Edit Subscriptions
echo.    
set /p SubscriptionsInput=
if %SubscriptionsInput% == r goto :sellerpage
if %SubscriptionsInput% == m goto :options
if %SubscriptionsInput% == 1 goto :Subscriptions_CreateSubscription
if %SubscriptionsInput% == 2 goto :Subscriptions_FetchAllSubscriptions
if %SubscriptionsInput% == 3 goto :Subscriptions_EditSubscriptions
if %SubscriptionsInput% == 4 goto :Subscriptions_DeleteSubscriptions
pause 

:Subscriptions_CreateSubscription
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Create Subscriptions
echo ------------------------------------------------------------------------
echo.
echo What's the subscription name you'd like to create?
set /p CreateSubscriptionInput=
if %CreateSubscriptionInput% == r goto :sellerpage
if %CreateSubscriptionInput% == m goto :options
echo What's the level you'd like to assign to the subscription?
set /p CreateSubscriptionLevelInput=
if %CreateSubscriptionLevelInput% == r goto :sellerpage
if %CreateSubscriptionLevelInput% == m goto :options
echo Please wait, creating new subscription...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=addsub&name=%CreateSubscriptionInput%&level=%CreateSubscriptionLevelInput%')" 
pause
goto :options

:Subscriptions_FetchAllSubscriptions
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Fetch All Subscriptions
echo ------------------------------------------------------------------------
echo.
echo Please wait, fetching all subscriptions...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=fetchallsubs')" 
pause
goto :options

:Subscriptions_EditSubscriptions
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Edit Subscriptions
echo ------------------------------------------------------------------------
echo.
echo What's the subscription name you'd like to edit?
set /p EditSubscriptionInput=
if %EditSubscriptionInput% == r goto :sellerpage
if %EditSubscriptionInput% == m goto :options
echo What's the new level you'd like to assign to the subscription?
set /p EditSubscriptionLevelInput=
if %EditSubscriptionLevelInput% == r goto :sellerpage
if %EditSubscriptionLevelInput% == m goto :options
echo Please wait, editing subscription...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=editsub&sub=%EditSubscriptionInput%&level=%EditSubscriptionLevelInput%')" 
pause
goto :options

:Subscriptions_DeleteSubscriptions
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete Subscription
echo ------------------------------------------------------------------------
echo.
echo What's the subscription name you'd like to delete?
set /p DeleteSubscriptionInput=
if %DeleteSubscriptionInput% == r goto :sellerpage
if %DeleteSubscriptionInput% == m goto :options
echo Please wait, deleting subscription...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=delappsub&name=%DeleteSubscriptionInput%')" 
pause
goto :options

:Chats
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------#
echo                       Chats  
echo ------------------------------------------------------------------------#
echo.
echo [Main]                       [Mutes]               [Delete]
echo [1] Create Channel           [5] Mute User         [8] Delete Channel
echo [2] Edit Channel             [6] Unmute User
echo [3] Clear Channel messages   [7] Fetch All Mutes
echo [4] Fetch All Channels
echo.    
set /p ChatsInput=
if %ChatsInput% == r goto :sellerpage
if %ChatsInput% == m goto :options
if %ChatsInput% == 1 goto :Chats_CreateChannel
if %ChatsInput% == 2 goto :Chats_EditChannel
if %ChatsInput% == 3 goto :Chats_ClearChannelMessages
if %ChatsInput% == 4 goto :Chats_FetchAllChannels
if %ChatsInput% == 5 goto :Chats_MuteUser
if %ChatsInput% == 6 goto :Chats_UnmuteUser
if %ChatsInput% == 7 goto :Chats_FetchAllMutes
if %ChatsInput% == 8 goto :Chats_DeleteChannel
pause 

:Chats_CreateChannel
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Create Channel
echo ------------------------------------------------------------------------
echo.
echo What's the channel name you'd like to create?
set /p CreateChannelNameInput=
if %CreateChannelNameInput% == r goto :sellerpage
if %CreateChannelNameInput% == m goto :options
echo What's the message delay for this channel? (seconds)
set /p CreateChannelDelay=
if %CreateChannelDelay% == r goto :sellerpage
if %CreateChannelDelay% == m goto :options
echo Please wait, creating new channel...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=addchannel&name=%CreateChannelNameInput%&delay=%CreateChannelDelay%')" 
pause
goto :options

:Chats_EditChannel
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Edit Channel
echo ------------------------------------------------------------------------
echo.
echo What's the channel name you'd like to edit?
set /p EditChannelNameInput=
if %EditChannelNameInput% == r goto :sellerpage
if %EditChannelNameInput% == m goto :options
echo What's the message delay for this channel? (seconds)
set /p EditChannelDelay=
if %EditChannelDelay% == r goto :sellerpage
if %EditChannelDelay% == m goto :options
echo Please wait, clearing channel messages...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=editchan&name=%EditChannelNameInput%&delay=%EditChannelDelay%')" 
pause
goto :options

:Chats_ClearChannelMessages
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Clear Channel Messages
echo ------------------------------------------------------------------------
echo.
echo What's the channel name you'd like to clear messages from?
set /p ClearChannelMessagesInput=
if %ClearChannelMessagesInput% == r goto :sellerpage
if %ClearChannelMessagesInput% == m goto :options
echo Please wait, clearing channel messages...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=clearchannel&name=%ClearChannelMessagesInput%')" 
pause
goto :options

:Chats_FetchAllChannels
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Fetch All Channels
echo ------------------------------------------------------------------------
echo.
echo Please wait, fetching all channels...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=fetchallchats')" 
pause
goto :options

:Chats_MuteUser
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Mute User
echo ------------------------------------------------------------------------
echo.
echo What's the username of the user you'd like to mute?
set /p MuteUserInput=
if %MuteUserInput% == r goto :sellerpage
if %MuteUserInput% == m goto :options
echo How long would you like to mute them? (seconds)
set /p MuteUserTimeInput=
if %MuteUserTimeInput% == r goto :sellerpage
if %MuteUserTimeInput% == m goto :options
echo Please wait, muting user...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=muteuser&user=%MuteUserInput%&time=%MuteUserTimeInput%')" 
pause
goto :options

:Chats_UnmuteUser
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Unmute User
echo ------------------------------------------------------------------------
echo.
echo What's the username of the user you'd like to unmute?
set /p UnmuteUserInput=
if %UnmuteUserInput% == r goto :sellerpage
if %UnmuteUserInput% == m goto :options
echo Please wait, unmuting user...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=unmuteuser&user=%UnmuteUserInput%')" 
pause
goto :options

:Chats_FetchAllMutes
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Fetch All Mutes
echo ------------------------------------------------------------------------
echo.
echo What is the channel name you'd like to delete?
set /p DeleteChannelInput=
if %DeleteChannelInput% == r goto :sellerpage
if %DeleteChannelInput% == m goto :options
echo Please wait, deleting channel...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=delchannel&name=%DeleteChannelInput%')" 
pause
goto :options

:Chats_DeleteChannel
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete Channel
echo ------------------------------------------------------------------------
echo.
echo What is the channel name you'd like to delete?
set /p DeleteChannelInput=
if %DeleteChannelInput% == r goto :sellerpage
if %DeleteChannelInput% == m goto :options
echo Please wait, deleting channel...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=delchannel&name=%DeleteChannelInput%')" 
pause
goto :options

:Sessions
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------#
echo                       Sessions  
echo ------------------------------------------------------------------------#
echo.
echo [1] Kill Session
echo [2] Kill All Sessions
echo [3] Fetch All Sessions
echo.    
set /p SessionsInput=
if %SessionsInput% == r goto :sellerpage
if %SessionsInput% == m goto :options
if %SessionsInput% == 1 goto :Sessions_KillSession
if %SessionsInput% == 2 goto :Sessions_KillAllSessions
if %SessionsInput% == 3 goto :Sessions_FetchAllSessions
pause

:Sessions_KillSession
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Kill Session
echo ------------------------------------------------------------------------
echo.
echo What is the session ID you'd like to kill?
set /p KillSessionInput=
if %KillSessionInput% == r goto :sellerpage
if %KillSessionInput% == m goto :options
echo Please wait, killing session...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=kill&sessid=%KillSessionInput%')" 
pause
goto :options

:Sessions_KillAllSessions
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Kill All Sessions
echo ------------------------------------------------------------------------
echo.
echo Are you sure you want to kill all sessions? Y/N
set /p KillSessionsInput=
if %KillSessionsInput% == r goto :sellerpage
if %KillSessionsInput% == m goto :options
if %KillSessionsInput% == Y PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%%&type=killall')" 
echo Please wait, killing all sessions...
if %KillSessionsInput% == N goto :options
pause
goto :options

:Sessions_FetchAllSessions
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Fetch All Sessions
echo ------------------------------------------------------------------------
echo.
echo Please wait, fetching all sessions...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=fetchallsessions')" 
pause
goto :options

:Webhooks
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------#
echo                       Webhooks  
echo ------------------------------------------------------------------------#
echo.
echo [1] Create Webhook
echo.    
set /p WebhooksInput=
if %WebhooksInput% == r goto :sellerpage
if %WebhooksInput% == m goto :options
if %WebhooksInput% == 1 goto :Webhooks_CreateWebhook
pause 

:Webhooks_CreateWebhook
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Create A Webhook
echo ------------------------------------------------------------------------
echo.
echo What's the base URL of the webhook?
set /p WebhookBaseInput=
if %WebhookBaseInput% == r goto :sellerpage
if %WebhookBaseInput% == g goto :options
echo What's the user agent of the webhook?
set /p WebhookUAInput=
if %WebhookUAInput% == r goto :sellerpage
if %WebhookUAInput% == g goto :options
echo Does the user need to be authenitcated to access the webhook? [1] = yes [2] = no
set /p WebhookAuthInput=
if %WebhookAuthInput% == r goto :sellerpage
if %WebhookAuthInput% == g goto :options
echo Please wait, creating new webhook...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=addwebhook&baseurl=%WebhookBaseInput%&ua=%WebhookUAInput%&authed=%WebhookAuthInput%')" 
pause
goto :options

:Files
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------#
echo                       Files  
echo ------------------------------------------------------------------------#
echo.
echo [Main]                  [Delete]
echo [1] Upload File         [3] Delete File
echo [2] Fetch All Files     [4] Delete All Files
echo.    
set /p FilesInput=
if %FilesInput% == r goto :sellerpage
if %FilesInput% == m goto :options
if %FilesInput% == 1 goto :Files_UploadFile
if %FilesInput% == 2 goto :Files_FetchAllFiles
if %FilesInput% == 3 goto :Files_DeleteFile
if %FilesInput% == 4 goto :Files_DeleteAllFiles
pause 

:Files_UploadFile
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Upload A File
echo ------------------------------------------------------------------------
echo.
echo What's the direct download link of the file you want to upload?
set /p UploadAFileInput=
if %UploadAFileInput% == r goto :sellerpage
if %UploadAFileInput% == m goto :options
echo Please wait, uploading file...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=upload&url=%UploadAFileInput%')" 
pause
goto :options

:Files_FetchAllFiles
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Fetch All Files
echo ------------------------------------------------------------------------
echo.
echo Please wait, fetching all files...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=fetchallfiles')" 
pause
goto :options

:Files_DeleteFile
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete File
echo ------------------------------------------------------------------------
echo.
echo What's the file ID of the file you'd like to delete?
set /p DeleteFileFIDInput=
if %DeleteFileFIDInput% == r goto :sellerpage
if %DeleteFileFIDInput% == m goto :options
echo Please wait, deleting file...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=delfile&fileid=%DeleteFileFIDInput%')" 
pause
goto :options

:Files_DeleteAllFiles
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete All Files 
echo ------------------------------------------------------------------------
echo.
echo Are you sure you want to delete all files?
echo [1] Yes    [2] No
set /p DeleteAllFilesInput=
if %DeleteAllFilesInput% == r goto :sellerpage
if %DeleteAllFilesInput% == m goto :options
if %DeleteAllFilesInput% == 1 PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=delallfiles')" 
if %DeleteAllFilesInput% == 2 goto :options
pause
goto :options

:Variables
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------#
echo                       Variables  
echo ------------------------------------------------------------------------#
echo.
echo [Main]                    [Delete]
echo [1] Create Variable       [5] Delete Variable
echo [2] Edit Variable         [6] Delete All Variables
echo [3] Retrieve Variable
echo [4] Fetch All Variables
echo.    
set /p VariablesInput=
if %VariablesInput% == r goto :sellerpage
if %VariablesInput% == m goto :options
if %VariablesInput% == 1 goto :Variables_CreateVariable
if %VariablesInput% == 2 goto :Variables_EditVariable
if %VariablesInput% == 3 goto :Variables_RetrieveVariable
if %VariablesInput% == 4 goto :Variables_FetchAllVariables
if %VariablesInput% == 5 goto :Variables_DeleteVariable
if %VariablesInput% == 6 goto :Variables_DeleteAllVariables
pause 

:Variables_CreateVariable
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Create Variable 
echo ------------------------------------------------------------------------
echo.
echo What's the new variable name?
set /p CreateVariableName=
if %CreateVariableName% == r goto :sellerpage
if %CreateVariableName% == m goto :options
echo What's the data you'd like the variable to have?
set /p CreateVariableDataInput=
if %CreateVariableDataInput% == r goto :sellerpage
if %CreateVariableDataInput% == m goto :options
echo Would you like the user to be authenticated in order to get the variable? 1 = yes | 0 = no
set /p CreateAuthedInput=
if %CreateAuthedInput% == r goto :sellerpage
if %CreateAuthedInput% == m goto :options
echo Please wait, creating variable...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=addvar&name=%CreateVariableName%&data=%CreateVariableDataInput%&authed=%CreateAuthedInput%')" 
pause
goto :options

:Variables_EditVariable
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Edit Variable 
echo ------------------------------------------------------------------------
echo.
echo Which variable ID would you like to edit?
set /p EditVariableIDInput=
if %EditVariableIDInput% == r goto :sellerpage
if %EditVariableIDInput% == m goto :options
echo What's the new data you'd like the variable to have?
set /p EditVariableDataInput=
if %EditVariableDataInput% == r goto :sellerpage
if %EditVariableDataInput% == m goto :options
echo Please wait, editing variable...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=editvar&varid=%EditVariableIDInput%&data=%EditVariableDataInput%')" 
pause
goto :options

:Variables_RetrieveVariable
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Retrieve Variable 
echo ------------------------------------------------------------------------
echo.
echo Which variable would you like to retrieve?
set /p RetrieveVariableInput=
if %RetrieveVariableInput% == r goto :sellerpage
if %RetrieveVariableInput% == m goto :options
echo Please wait, retrieving variable...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=retrvvar&name=%RetrieveVariableInput%')" 
pause
goto :options

:Variables_FetchAllVariables
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Fetch All Variables 
echo ------------------------------------------------------------------------
echo.
echo Please wait, fetching all variables...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=fetchallvars')" 
pause
goto :options

:Variables_DeleteVariable
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete Variable 
echo ------------------------------------------------------------------------
echo.
echo Which variable would you like to delete?
set /p DeleteVariableInput=
if %DeleteVariableInput% == r goto :sellerpage
if %DeleteVariableInput% == m goto :options
echo Please wait, deleting variable...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=delvar&name=%DeleteVariableInput%')" 
pause
goto :options

:Variables_DeleteAllVariables
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete All Variables  
echo ------------------------------------------------------------------------
echo.
echo Please wait, deleting all variables...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=delallvars')" 
pause
goto :options

:Blacklists
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------#
echo                       Blacklists  
echo ------------------------------------------------------------------------#
echo.
echo [Main]                     [Delete]
echo [1] Add Blacklist          [3] Delete Blacklist (IP)
echo [2] Fetch All Blacklists   [4] Delete All Blacklists
echo                            [5] Delete Blacklists (HWID)
echo.    
set /p BlacklistsInput=
if %BlacklistsInput% == r goto :sellerpage
if %BlacklistsInput% == m goto :options
if %BlacklistsInput% == 1 goto :Blacklists_AddBlacklist
if %BlacklistsInput% == 2 goto :Blacklists_FetchAllBlacklists
if %BlacklistsInput% == 3 goto :Blacklists_DeleteBlacklists
if %BlacklistsInput% == 4 goto :Blacklists_DeleteAllBlacklists
if %BlacklistsInput% == 5 goto :Blacklists_DeleteBlacklistsHWID
pause 

:Blacklists_AddBlacklist
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Add Blacklist
echo ------------------------------------------------------------------------
echo.
echo What's the IP you would like to blacklist? (Put 0.0.0.0 for none)
set /p BlacklistIPInput=
if %BlacklistIPInput% == r goto :sellerpage
if %BlacklistIPInput% == m goto :options
echo What's the HWID you would like to blacklist? (Put 0-0-0-0 for none)
set /p BlacklistHWIDInput=
if %BlacklistHWIDInput% == r goto :sellerpage
if %BlacklistHWIDInput% == m goto :options
echo Please wait, adding new blacklist...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=black&ip=%BlacklistIPInput%&hwid=%BlacklistHWIDInput%')" 
pause
goto :options

:Blacklists_FetchAllBlacklists
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Fetch All Blacklists
echo ------------------------------------------------------------------------
echo.
echo Please wait, fetching all blacklists...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=fetchallblacks')" 
pause
goto :options

:Blacklists_DeleteBlacklistsHWID
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete Blacklists HWID
echo ------------------------------------------------------------------------
echo.
echo What HWID would you like to delete from blacklist?
set /p DeleteHWIDBlacklist=
if %DeleteHWIDBlacklist% == r goto :sellerkey
if %DeleteHWIDBlacklist% == m goto :options
echo Please wait, deleting HWID from blacklist...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=delblack&data=%DeleteHWIDBlacklist%&blacktype=hwid')" 
pause
goto :options

:Blacklists_DeleteBlacklists
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete Blacklists IP
echo ------------------------------------------------------------------------
echo.
echo What IP would you like to delete from blacklist?
set /p DeleteIPBlacklist=
if %DeleteIPBlacklist% == r goto :sellerkey
if %DeleteIPBlacklist% == m goto :options
echo Please wait, deleting IP from blacklist...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=delblack&data=%DeleteIPBlacklist%&blacktype=ip')" 
pause
goto :options

:Blacklists_DeleteAllBlacklists
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete All Blacklists  
echo ------------------------------------------------------------------------
echo.
echo Please wait, deleting all blacklists...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=delblacks')" 
pause
goto :options

:Settings
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------#
echo                       Settings  
echo ------------------------------------------------------------------------#
echo.
echo [1] Retrieve Settings
echo [2] Update Settings
echo [3] Reset Hash
echo [4] Add Hash
echo [5] Pause App
echo [6] Unpause App
echo.    
set /p SettingsInput=
if %SettingsInput% == r goto :sellerpage
if %SettingsInput% == m goto :options
if %SettingsInput% == 1 goto :Settings_RetrieveSettings
if %SettingsInput% == 2 goto :Settings_UpdateSettings
if %SettingsInput% == 3 goto :Settings_ResetHash
if %SettingsInput% == 4 goto :Settings_AddHash
if %SettingsInput% == 5 goto :Settings_PauseApp
if %SettingsInput% == 6 goto :Settings_UnpauseApp
pause 

:Settings_RetrieveSettings
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Retrieve Settings  
echo ------------------------------------------------------------------------
echo.
echo Please wait, retrieving settings...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=getsettings')" 
pause
goto :options

:Settings_UpdateSettings
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Update Settings  
echo ------------------------------------------------------------------------
echo.
echo Would you like to enable (true) or disable (false) your app?
set /p US_EnabledInput=
if %US_EnabledInput% == r goto :sellerpage
if %US_EnabledInput% == m goto :options
echo Would you like to enable (true) or disable (false) hwid check?
set /p US_hwidCheck=
if %US_hwidCheck% == r goto :sellerpage
if %US_hwidCheck% == m goto :options
echo What is the version of your app?
set /p US_versionInput=
if %US_versionInput% == r goto :sellerpage
if %US_versionInput% == m goto :options
echo What is the direct download link for auto update?
set /p US_autoUpdateInput=
if %US_autoUpdateInput% == r goto :sellerpage
if %US_autoUpdateInput% == m goto :options
echo What is the webhook for notify?
set /p US_WebhookInput=
if %US_WebhookInput% == r goto :sellerpage
if %US_WebhookInput% == m goto :options
echo What is the reseller store link?
set /p US_ResellerStoreInput=
if %US_ResellerStoreInput% == r goto :sellerpage
if %US_ResellerStoreInput% == m goto :options
echo What would you like the response to be when the app is disabled?
set /p US_AppDisabledResponseInput=
if %US_AppDisabledResponseInput% == r goto :sellerpage
if %US_AppDisabledResponseInput% == m goto :options
echo What would you like the response to be when a username is taken in the app on register?
set /p US_UsernameTakenResponseInput=
if %US_UsernameTakenResponseInput% == r goto :sellerpage
if %US_UsernameTakenResponseInput% == m goto :options
echo What would you like the response to be when a key isn't found on register?
set /p US_KeyNotFoundResponseInput=
if %US_KeyNotFoundResponseInput% == r goto :sellerpage
if %US_KeyNotFoundResponseInput% == m goto :options
echo What would you like the response to be when a key is taken on register?
set /p US_KeyTakenResponseInput=
if %US_KeyTakenResponseInput% == r goto :sellerpage
if %US_KeyTakenResponseInput% == m goto :options
echo What would you like the response to be when the subscription doesn't have a level?
set /p US_SubscriptionNoLevelResponseInput=
if %US_SubscriptionNoLevelResponseInput% == r goto :sellerpage
if %US_SubscriptionNoLevelResponseInput% == m goto :options
echo What would you like the response to be when username is not found on login?
set /p US_UsernameNotFoundResponseInput=
if %US_UsernameNotFoundResponseInput% == r goto :sellerpage
if %US_UsernameNotFoundResponseInput% == m goto :options
echo What would you like the response to be with a password mismatch?
set /p US_PasswordMismatchResponseInput=
if %US_PasswordMismatchResponseInput% == r goto :sellerpage
if %US_PasswordMismatchResponseInput% == m goto :options
echo What would you like the response to be with a hwid mismatch?
set /p US_HWIDMismatchResponseInput=
if %US_HWIDMismatchResponseInput% == r goto :sellerpage
if %US_HWIDMismatchResponseInput% == m goto :options
echo What would you like the response to be with no active subscriptions?
set /p US_NoActiveSubResponseInput=
if %US_NoActiveSubResponseInput% == r goto :sellerpage
if %US_NoActiveSubResponseInput% == m goto :options
echo What would you like the response to be with hwid blacklist?
set /p US_HWIDBlacklistResponseInput=
if %US_HWIDBlacklistResponseInput% == r goto :sellerpage
if %US_HWIDBlacklistResponseInput% == m goto :options
echo What would you like the response to be with key paused?
set /p US_KeyPausedResponseInput=
if %US_KeyPausedResponseInput% == r goto :sellerpage
if %US_KeyPausedResponseInput% == m goto :options
echo What would you like the response to be with key expired?
set /p US_KeyExpiredResponseInput=
if %US_KeyExpiredResponseInput% == r goto :sellerpage
if %US_KeyExpiredResponseInput% == m goto :options
echo What is your sellix secret?
set /p US_SellixSecretInput=
if %US_SellixSecretInput% == r goto :sellerpage
if %US_SellixSecretInput% == m goto :options
echo What is your day product?
set /p US_DayProductInput=
if %US_DayProductInput% == r goto :sellerpage
if %US_DayProductInput% == m goto :options
echo What is your week product?
set /p US_WeekProductInput=
if %US_WeekProductInput% == r goto :sellerpage
if %US_WeekProductInput% == m goto :options
echo What is your month product?
set /p US_MonthProductInput=
if %US_MonthProductInput% == r goto :sellerpage
if %US_MonthProductInput% == m goto :options
echo What is your lifetime product?
set /p US_LifetimeProductInput=
if %US_LifetimeProductInput% == r goto :sellerpage
if %US_LifetimeProductInput% == m goto :options
echo Please wait, updating settings...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=updatesettings&enabled=%US_EnabledInput%&hwidcheck=%US_hwidCheck%&ver=%US_versionInput%&download=%US_autoUpdateInput%&webhook=%US_WebhookInput%&resellerstore=%US_ResellerStoreInput%&appdisabled=%US_AppDisabledResponseInput%&usernametaken=%US_UsernameTakenResponseInput%&keynotfound=%US_KeyNotFoundResponseInput%&keyused=%US_KeyTakenResponseInput%&nosublevel=%US_SubscriptionNoLevelResponseInput%&usernamenotfound=%US_UsernameNotFoundResponseInput%&passmismatch=%US_PasswordMismatchResponseInput%&hwidmismatch=%US_HWIDMismatchResponseInput%&noactivesubs=%US_NoActiveSubResponseInput%&hwidblacked=%US_HWIDBlacklistResponseInput%&keypaused=%US_KeyPausedResponseInput%&keyexpired=%US_KeyExpiredResponseInput%&sellixsecret=%US_SellixSecretInput%&dayproduct=%US_DayProductInput%&weekproduct=%US_WeekProductInput%&monthproduct=%US_MonthProductInput%&lifetimeproduct=%US_LifetimeProductInput%')" 
pause
goto :options

:Settings_ResetHash
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Reset Hash  
echo ------------------------------------------------------------------------
echo.
echo Please wait, resetting hash...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=resethash')" 
pause
goto :options

:Settings_AddHash
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Add Hash  
echo ------------------------------------------------------------------------
echo.
echo What's the new MD5 hash you'd like to add?
set /p AddHashInput=
if %AddHashInput% == r goto :sellerkey
if %AddHashInput% == m goto :options
echo Please wait, adding hash...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=addhash&hash=%AddHashInput%')" 
pause
goto :options

:Settings_PauseApp
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Pause App  
echo ------------------------------------------------------------------------
echo.
echo Please wait, pausing app...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%%&type=pauseapp')" 
pause
goto :options

:Settings_UnpauseApp
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Unpause App  
echo ------------------------------------------------------------------------
echo.
echo Please wait, unpausing app...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%%&type=unpauseapp')" 
pause
goto :options

:Accounts
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------#
echo                       Accounts  
echo ------------------------------------------------------------------------#
echo.
echo [1] Create Account
echo [2] Delete Account
echo.    
set /p AccountsInput=
if %AccountsInput% == r goto :sellerkey
if %AccountsInput% == m goto :options
if %AccountsInput% == 1 goto :Accounts_CreateAccount
if %AccountsInput% == 2 goto :Accounts_DeleteAccount
pause 

:Accounts_CreateAccount
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Create Account  
echo ------------------------------------------------------------------------
echo.
echo What would you like the username to be?
set /p CreateAccountUsernameInput=
if %CreateAccountUsernameInput% == r goto :sellerpage
if %CreateAccountUsernameInput% == m goto :options
echo What would you like the password to be? 
set /p CreateAccountPasswordInput=
if %CreateAccountPasswordInput% == r goto :sellerpage
if %CreateAccountPasswordInput% == m goto :options
echo What levels would you like them to be able to assign? (ex: 1,2,3  - make sure levels are separated by ,)
set /p CreateAccountLevelInput=
if %CreateAccountLevelInput% == r goto :sellerpage
if %CreateAccountLevelInput% == m goto :options
echo What would you like the email to be? 
set /p CreateAccountEmailInput=
if %CreateAccountEmailInput% == r goto :sellerpage
if %CreateAccountEmailInput% == m goto :options
echo.
echo Please wait, creating account...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=addAccount&role=Manager&user=%CreateAccountUsernameInput%&pass=%CreateAccountPasswordInput%&keylevels=%CreateAccountLevelInput%&email=%CreateAccountEmailInput%')" 
pause
goto :options

:Accounts_DeleteAccount
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete Account  
echo ------------------------------------------------------------------------
echo.
echo What's the account name you'd like to delete?
set /p DeleteAccountUsername=
if %DeleteAccountUsername% == r goto :sellerpage
if %DeleteAccountUsername% == m goto :options
echo Please wait, deleting account...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=deleteAccount&user=%DeleteAccountUsername%')" 
pause
goto :options

:WebLoader
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------#
echo                       Web Loader  
echo ------------------------------------------------------------------------#
echo.
echo [1] Retrieve All Buttons
echo [2] Add Button
echo [3] Delete Button
echo.    
set /p WebLoaderInput=
if %WebLoaderInput% == 1 goto :RetrieveAllButtons
if %WebLoaderInput% == 2 goto :AddButton
if %WebLoaderInput% == 3 goto :DeleteButton
if %WebLoaderInput% == r goto :sellerpage
if %WebLoaderInput% == m goto :options
pause 

:RetrieveAllButtons
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Retrieve All Buttons  
echo ------------------------------------------------------------------------
echo.
echo Please wait, retrieving all buttons...
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=fetchallbuttons')" 
pause
goto :options

:AddButton
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Add Button  
echo ------------------------------------------------------------------------
echo.
echo What would you like the value of the button to be? 
set /p ButtonValue=
if %ButtonValue% == r goto :sellerpage
if %ButtonValue% == m goto :options
echo What is the text?
set /p ButtonText=
if %ButtonText% == r goto :sellerpage
if %ButtonText% == m goto :options
echo Please wait, adding button...:
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=addbutton&value=%ButtonValue%&text=%ButtonText%')" 
pause
goto :options

:DeleteButton
cls
echo Current Seller Key = %sellerkey%
echo [r] Change Seller Key
echo [m] Menu
echo.
echo.
echo.
echo ------------------------------------------------------------------------
echo                       Delete Button  
echo ------------------------------------------------------------------------
echo.
echo What is the button value that you'd like to delete?
set /p DeleteButtonValue=
if %DeleteButtonValue% == r goto :sellerpage
if %DeleteButtonValue% == m goto :options
echo Please wait, deleting button...:
PowerShell -Command "(new-object net.webclient).DownloadString('https://keyauth.win/api/seller/?sellerkey=%sellerkey%&type=delbutton&value=%DeleteButtonValue%')" 
pause
goto :options
