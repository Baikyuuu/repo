## blog.enguerrand.pro
## Lightweight ActiveDirectory Toolbox - r7 'Grand Finale'
## Consulter le fichier d'info fourni dans l'archive pour plus d'informations

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
$curver = "r7"


#region UI

	#region Form
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.ClientSize = '620,580'
$mainForm.Text = "Lightweight ActiveDirectory Toolbox - $curver 'Grand Finale'"
$mainForm.FormBorderStyle = 'Fixed3D'
$mainForm.MaximizeBox = $false
    #endregion
	
	#region TabControl
$mainTabCtl = New-Object System.Windows.Forms.TabControl
$mainTabCtl.Location = New-Object System.Drawing.Point(15,55)
$mainTabCtl.Size = '590,515'
$mainTabCtl.ShowToolTips = $true

$homeTabPage = New-Object System.Windows.Forms.TabPage
$consultTabPage = New-Object System.Windows.Forms.TabPage
$compTabPage = New-Object System.Windows.Forms.TabPage
$groupTabPage = New-Object System.Windows.Forms.TabPage
$adTabPage = New-Object System.Windows.Forms.TabPage
$eventvwrPage = New-Object System.Windows.Forms.TabPage
$lockPage = New-Object System.Windows.Forms.TabPage
$logTabPage = New-Object System.Windows.Forms.TabPage

$homeTabPage.Text = "Home"
$consultTabPage.Text = "Users"
$consultTabPage.ToolTipText = "Retrieve information regarding a user account and operate basic actions."
$compTabPage.Text = "Computers"
$compTabPage.ToolTipText = "Retrieve information about computers."
$groupTabPage.Text = "Groups"
$groupTabPage.ToolTipText = "Retrieve informations regarding groups."
$adTabPage.Text = "Domain Controllers"
$adTabPage.ToolTipText = "Get access to some information about the domain controllers and operate basic actions."
$eventvwrPage.Text = "Event Viewer"
$eventvwrPage.ToolTipText = "Check the Domain Controllers event logs."
$lockPage.Text = "Locked Accounts"
$lockPage.ToolTipText = "Find the locked accounts and operate on them."
$logTabPage.Text = "Log"
$logTabPage.ToolTipText = "Check the log of changes and actions you made since application start."

$mainTabCtl.TabPages.AddRange(@($homeTabPage,$consultTabPage,$compTabPage,$groupTabPage,$adTabPage,$eventvwrPage,$lockPage,$logTabPage))

$mainForm.controls.Add($mainTabCtl)
	#endregion
	
	#region Labels    
	
$welcomeLabelFix = New-Object System.Windows.Forms.Label
$welcomeLabelFix.Location = New-Object System.Drawing.Point(20,30)
$welcomeLabelFix.Text = "Welcome to the Lightweight ActiveDirectory Toolbox. Your version is the release 7, codename 'Grand Finale'."
$welcomeLabelFix.AutoSize = $true

$welcomeUsersLabel = New-Object System.Windows.Forms.Label
$welcomeUsersLabel.Location = New-Object System.Drawing.Point(150,82)
$welcomeUsersLabel.Text = "Get some information and details about a user account.`r`nLock or unlock the account, enable or disable it, change its password...`r`nEverything regarding user accounts can be found here."
$welcomeUsersLabel.AutoSize = $true

$welcomeCompLabel = New-Object System.Windows.Forms.Label
$welcomeCompLabel.Location = New-Object System.Drawing.Point(150,143)
$welcomeCompLabel.Text = "Retrieve computer information from the ActiveDirectory with or without filters.`r`nGet the IP Address, the running OS, the specs, remotely reboot the computer..."
$welcomeCompLabel.AutoSize = $true

$welcomeGrpLabel = New-Object System.Windows.Forms.Label
$welcomeGrpLabel.Location = New-Object System.Drawing.Point(150,198)
$welcomeGrpLabel.Text = "Retrieve group information from the ActiveDirectory with or without filters.`r`nDisplay the members and export the query results for later use."
$welcomeGrpLabel.AutoSize = $true

$welcomeDCLabel = New-Object System.Windows.Forms.Label
$welcomeDCLabel.Location = New-Object System.Drawing.Point(150,253)
$welcomeDCLabel.Text = "Show the domain controllers on the forest and their IP, location or roles.`r`nRun some dcdiag tests, open a RDP connection or export the data for later use."
$welcomeDCLabel.AutoSize = $true

$welcomeEvtLabel = New-Object System.Windows.Forms.Label
$welcomeEvtLabel.Location = New-Object System.Drawing.Point(150,307)
$welcomeEvtLabel.Text = "Display the usual event logs for any domain controller. Filter your query by date,`r`nEventID or level and create reports by exporting your query results."
$welcomeEvtLabel.AutoSize = $true

$welcomeLockLabel = New-Object System.Windows.Forms.Label
$welcomeLockLabel.Location = New-Object System.Drawing.Point(150,362)
$welcomeLockLabel.Text = "Look for any locked out user accounts. Get the domain controller which is`r`nlocking the account and the computer where the account is trying to log in from."
$welcomeLockLabel.AutoSize = $true

$welcomeLogLabel = New-Object System.Windows.Forms.Label
$welcomeLogLabel.Location = New-Object System.Drawing.Point(150,422)
$welcomeLogLabel.Text = "Check out the application log where you can track your queries or modifications."
$welcomeLogLabel.AutoSize = $true

$statusLabelFix = New-Object System.Windows.Forms.Label
$statusLabelFix.Location = New-Object System.Drawing.Point(10,30)
$statusLabelFix.AutoSize = $true
$statusLabelFix.Text = "Status:"
$statusLabelVar = New-Object System.Windows.Forms.Label
$statusLabelVar.Location = New-Object System.Drawing.Point(55,30)
$statusLabelVar.AutoSize = $true
$statusLabelVar.Text = "Ready."

$accNameLabelFix = New-Object System.Windows.Forms.Label
$accNameLabelFix.Location = New-Object System.Drawing.Point(25,85)
$accNameLabelFix.Text = "User Name:"
$accNameLabelFix.AutoSize = $true
$accNameLabelVar = New-Object System.Windows.Forms.Label
$accNameLabelVar.Location = New-Object System.Drawing.Point(90,85)
$accNameLabelVar.AutoSize = $true

$accDisplayNameFix = New-Object System.Windows.Forms.Label
$accDisplayNameFix.Location = New-Object System.Drawing.Point(25,105)
$accDisplayNameFix.Text = "Display Name:"
$accDisplayNameFix.AutoSize = $true
$accDisplayNameVar = New-Object System.Windows.Forms.Label
$accDisplayNameVar.Location = New-Object System.Drawing.Point(105,105)
$accDisplayNameVar.AutoSize = $true

$lastlogonDateFix = New-Object System.Windows.Forms.Label
$lastlogonDateFix.Location = New-Object System.Drawing.Point(25,125)
$lastlogonDateFix.Text = "Last Logon Date:"
$lastlogonDateFix.AutoSize = $true
$lastlogonDateVar = New-Object System.Windows.Forms.Label
$lastlogonDateVar.Location = New-Object System.Drawing.Point(115,125)
$lastlogonDateVar.AutoSize = $true

$distinguishedNameFix = New-Object System.Windows.Forms.Label
$distinguishedNameFix.Location = New-Object System.Drawing.Point(25,145)
$distinguishedNameFix.Text = "Distinguished Name:"
$distinguishedNameFix.AutoSize = $true
$distinguishedNameVar = New-Object System.Windows.Forms.Label
$distinguishedNameVar.Location = New-Object System.Drawing.Point(135,145)
$distinguishedNameVar.AutoSize=$true
$distinguishedNameVar.MaximumSize = New-Object System.Drawing.Size(215,0)

$lastwrongpwFix = New-Object System.Windows.Forms.Label
$lastwrongpwFix.Location = New-Object System.Drawing.Point(25,380)
$lastwrongpwFix.Text = "Last wrong password timestamp:"
$lastwrongpwFix.AutoSize = $true
$lastwrongpwVar = New-Object System.Windows.Forms.Label
$lastwrongpwVar.Location = New-Object System.Drawing.Point(195,380)
$lastwrongpwVar.AutoSize = $true

$lastSetpwFix = New-Object System.Windows.Forms.Label
$lastSetpwFix.Location = New-Object System.Drawing.Point(25,400)
$lastSetpwFix.Text = "Password Set on:"
$lastSetpwFix.AutoSize = $true
$lastSetpwVar = New-Object System.Windows.Forms.Label
$lastSetpwVar.Location = New-Object System.Drawing.Point(118,400)
$lastSetpwVar.AutoSize = $true

$pwNeverExpLabel = New-Object System.Windows.Forms.Label
$pwNeverExpLabel.Location = New-Object System.Drawing.Point(25,420)
$pwNeverExpLabel.Text = "Never expires :"
$pwNeverExpLabel.AutoSize = $true
$pwExpiredLabel = New-Object System.Windows.Forms.Label
$pwExpiredLabel.Location = New-Object System.Drawing.Point(165,420)
$pwExpiredLabel.Text = "Is Expired :"
$pwExpiredLabel.AutoSize = $true

$accExpDateFix = New-Object System.Windows.Forms.Label
$accExpDateFix.Location = New-Object System.Drawing.Point(25,440)
$accExpDateFix.Text = "Account Expires On:"
$accExpDateFix.AutoSize = $true
$accExpDateVar = New-Object System.Windows.Forms.Label
$accExpDateVar.Location = New-Object System.Drawing.Point(135,440)
$accExpDateVar.Text = "Not Set"
$accExpDateVar.AutoSize = $true

$whencreatedFix = New-Object System.Windows.Forms.Label
$whencreatedFix.Location = New-Object System.Drawing.Point(25,265)
$whencreatedFix.Text = "Creation date:"
$whencreatedFix.AutoSize = $true
$whencreatedVar = New-Object System.Windows.Forms.Label
$whencreatedVar.Location = New-Object System.Drawing.Point(100,265)
$whencreatedVar.AutoSize = $true

$groupMemberFix = New-Object System.Windows.Forms.Label
$groupMemberFix.Location = New-Object System.Drawing.Point(25,285)
$groupMemberFix.Text = "User belongs to the following groups:"
$groupMemberFix.AutoSize = $true

$lockedBoolLabel = New-Object System.Windows.Forms.Label
$lockedBoolLabel.Location = New-Object System.Drawing.Point(25,355)
$lockedBoolLabel.AutoSize = $true
$lockedBoolLabel.Text = "Locked :"

$enabledBoolLabel = New-Object System.Windows.Forms.Label
$enabledBoolLabel.Location = New-Object System.Drawing.Point(165,355)
$enabledBoolLabel.Text = "Enabled :"
$enabledBoolLabel.AutoSize = $true

$DCListLabel = New-Object System.Windows.Forms.Label
$DCListLabel.Location = New-Object System.Drawing.Point(25,295)
$DCListLabel.Text = "Select a domain controller to perform actions."
$DCListLabel.AutoSize = $true

$DCIPV4LabelFix = New-Object System.Windows.Forms.Label
$DCIPV4LabelFix.Location = New-Object System.Drawing.Point(25,345)
$DCIPV4LabelFix.Text = "IPV4:"
$DCIPV4LabelFix.AutoSize = $true
$DCIPV4LabelVar = New-Object System.Windows.Forms.Label
$DCIPV4LabelVar.Location = New-Object System.Drawing.Point(55,345)
$DCIPV4LabelVar.AutoSize = $true

$DCOSverLabelFix = New-Object System.Windows.Forms.Label
$DCOSverLabelFix.Location = New-Object System.Drawing.Point(25,370)
$DCOSverLabelFix.Text = "OS:"
$DCOSverLabelFix.AutoSize = $true
$DCOSverLabelVar = New-Object System.Windows.Forms.Label
$DCOSverLabelVar.Location = New-Object System.Drawing.Point(50,370)
$DCOSverLabelVar.AutoSize = $true

$DCSiteLabelFix = New-Object System.Windows.Forms.Label
$DCSiteLabelFix.Location = New-Object System.Drawing.Point(25,395)
$DCSiteLabelFix.Text = "Site:"
$DCSiteLabelFix.AutoSize = $true
$DCSiteLabelVar = New-Object System.Windows.Forms.Label
$DCSiteLabelVar.Location = New-Object System.Drawing.Point(50,395)
$DCSiteLabelVar.AutoSize = $true

$DCRolesLabelFix = New-Object System.Windows.Forms.Label
$DCRolesLabelFix.Location = New-Object System.Drawing.Point(25,420)
$DCRolesLabelFix.Text = "Hosted domain roles :"
$DCRolesLabelFix.AutoSize = $true

$GrpListLabel = New-Object System.Windows.Forms.Label
$GrpListLabel.Location = New-Object System.Drawing.Point(25,295)
$GrpListLabel.Text = "Select a group to see its users and perform actions."
$GrpListLabel.AutoSize = $true

$CompListLabel = New-Object System.Windows.Forms.Label
$CompListLabel.Location = New-Object System.Drawing.Point(25,260)
$CompListLabel.Text = "Select a computer to get more information."
$CompListLabel.AutoSize = $true

$CompOSLabelFix = New-Object System.Windows.Forms.Label
$CompOSLabelFix.Location = New-Object System.Drawing.Point(25,310)
$CompOSLabelFix.Text = "OS:"
$CompOSLabelFix.AutoSize = $true
$CompOSLabelVar = New-Object System.Windows.Forms.Label
$CompOSLabelVar.Location = New-Object System.Drawing.Point(55,310)
$CompOSLabelVar.AutoSize = $true

$CompIPV4LabelFix = New-Object System.Windows.Forms.Label
$CompIPV4LabelFix.Location = New-Object System.Drawing.Point(25,335)
$CompIPV4LabelFix.Text = "IPV4:"
$CompIPV4LabelFix.AutoSize = $true
$CompIPV4LabelVar = New-Object System.Windows.Forms.Label
$CompIPV4LabelVar.Location = New-Object System.Drawing.Point(55,335)
$CompIPV4LabelVar.AutoSize = $true

$CompGroupLabelFix = New-Object System.Windows.Forms.Label
$CompGroupLabelFix.Location = New-Object System.Drawing.Point(25,360)
$CompGroupLabelFix.Text = "Computer group membership:"
$CompGroupLabelFix.AutoSize = $true

$EvtStatsILabel = New-Object System.Windows.Forms.Label
$EvtStatsILabel.Location = New-Object System.Drawing.Point(495,170)
$EvtStatsILabel.Size = "70,15"

$EvtStatsELabel = New-Object System.Windows.Forms.Label
$EvtStatsELabel.Location = New-Object System.Drawing.Point(495,185)
$EvtStatsELabel.Size = "70,15"

$EvtStatsWLabel = New-Object System.Windows.Forms.Label
$EvtStatsWLabel.Location = New-Object System.Drawing.Point(495,200)
$EvtStatsWLabel.Size = "70,15"

$EvtStatsCLabel = New-Object System.Windows.Forms.Label
$EvtStatsCLabel.Location = New-Object System.Drawing.Point(495,215)
$EvtStatsCLabel.Size = "70,15"

$EvtDateToLabel = New-Object System.Windows.Forms.Label
$EvtDateToLabel.Location = New-Object System.Drawing.Point(375,268)
$EvtDateToLabel.Size = "20,15"
$EvtDateToLabel.Text = "to"

$LockedAccNameLabel = New-Object System.Windows.Forms.Label
$LockedAccNameLabel.Location = New-Object System.Drawing.Point(30,95)
$LockedAccNameLabel.Text = "Account ID: "
$LockedAccNameLabel.AutoSize = $true

$lockingCompLabel = New-Object System.Windows.Forms.Label
$lockingCompLabel.Location = New-Object System.Drawing.Point(30,315)
$lockingCompLabel.Text = "Computer locking the account: "
$lockingCompLabel.AutoSize = $true 

$mainForm.controls.AddRange(@($statusLabelFix,$statusLabelVar))
$homeTabPage.controls.AddRange(@($welcomeLabelFix,$welcomeUsersLabel,$welcomeCompLabel,$welcomeGrpLabel,$welcomeDCLabel,$welcomeEvtLabel,$welcomeLockLabel,$welcomeLogLabel))
$consultTabPage.controls.AddRange(@($accNameLabelFix,$accNameLabelVar,$accDisplayNameFix,$accDisplayNameVar,$lastlogonDateFix,$lastlogonDateVar,$groupMemberFix,$distinguishedNameFix,$distinguishedNameVar,$lastwrongpwFix,$lastwrongpwVar,$lockedBoolLabel,$enabledBoolLabel,$whencreatedFix,$whencreatedVar,$lastSetpwFix,$lastSetpwVar,$pwNeverExpLabel,$pwExpiredLabel,$accExpDateFix,$accExpDateVar))
$adTabPage.controls.AddRange(@($DCListLabel,$DCIPV4LabelFix,$DCIPV4LabelVar,$DCOSverLabelFix,$DCOSverLabelVar,$DCSiteLabelFix,$DCSiteLabelVar,$DCRolesLabelFix))
$groupTabPage.controls.AddRange(@($GrpFilterLabel,$GrpListLabel))
$compTabPage.controls.AddRange(@($CompFilterLabel,$CompListLabel,$CompOSLabelFix,$CompOSLabelVar,$CompIPV4LabelFix,$CompIPV4LabelVar,$CompGroupLabelFix))
$eventvwrPage.controls.AddRange(@($EvtStatsCLabel,$EvtStatsELabel,$EvtStatsILabel,$EvtStatsWLabel,$EvtDateToLabel))
$lockPage.controls.AddRange(@($LockedAccNameLabel,$lockingCompLabel))
    #endregion

    #region ComboBox
$GroupComboBox = New-Object System.Windows.Forms.ComboBox
$GroupComboBox.Location = New-Object System.Drawing.Point(25,315)
$GroupComboBox.DropDownStyle = "DropDownList"
$GroupComboBox.Width = 240
$GroupComboBox.TabIndex = 4

$DCListComboBox = New-Object System.Windows.Forms.ComboBox
$DCListComboBox.Location = New-Object System.Drawing.Point(25,315)
$DCListComboBox.DropDownStyle = "DropDownList"
$DCListComboBox.Width = 300
$DCListComboBox.TabIndex = 4

$DCRolesComboBox = New-Object System.Windows.Forms.ComboBox
$DCRolesComboBox.Location = New-Object System.Drawing.Point(150,415)
$DCRolesComboBox.DropDownStyle = "DropDownList"
$DCRolesComboBox.Width = 160
$DCRolesComboBox.TabIndex = 5

$GrpListComboBox = New-Object System.Windows.Forms.ComboBox
$GrpListComboBox.Location = New-Object System.Drawing.Point(25,315)
$GrpListComboBox.DropDownStyle = "DropDownList"
$GrpListComboBox.Width = 420
$GrpListComboBox.TabIndex = 6

$GrpFilterComboBox = New-Object System.Windows.Forms.ComboBox
$GrpFilterComboBox.Location = New-Object System.Drawing.Point(155,15)
$GrpFilterComboBox.DropDownStyle = "DropDownList"
$GrpFilterComboBox.Width = 95
$GrpFilterComboBox.Items.Add("No Filter")
$GrpFilterComboBox.Items.Add("Filter by ID:")
$GrpFilterComboBox.Items.Add("Filter by Name:")
$GrpFilterComboBox.Items.Add("Filter by User:")
$GrpFilterComboBox.SelectedItem = $GrpFilterComboBox.Items[0]
$GrpFilterComboBox.TabIndex = 2

$CompFilterComboBox = New-Object System.Windows.Forms.ComboBox
$CompFilterComboBox.Location = New-Object System.Drawing.Point(155,15)
$CompFilterComboBox.DropDownStyle = "DropDownList"
$CompFilterComboBox.Width = 95
$CompFilterComboBox.Items.Add("No Filter")
$CompFilterComboBox.Items.Add("Filter by Name:")
$CompFilterComboBox.Items.Add("Filter by OS:")
$CompFilterComboBox.SelectedItem = $CompFilterComboBox.Items[0]
$CompFilterComboBox.TabIndex = 2

$CompListComboBox = New-Object System.Windows.Forms.ComboBox
$CompListComboBox.Location = New-Object System.Drawing.Point(25,280)
$CompListComboBox.DropDownStyle = "DropDownList"
$CompListComboBox.Width = 300
$CompListComboBox.TabIndex = 6

$CompGrpMbrComboBox = New-Object System.Windows.Forms.ComboBox
$CompGrpMbrComboBox.Location = New-Object System.Drawing.Point(25,380)
$CompGrpMbrComboBox.DropDownStyle = "DropDownList"
$CompGrpMbrComboBox.Width = 300
$CompGrpMbrComboBox.TabIndex = 7

$dcListEVFComboBox = New-Object System.Windows.Forms.ComboBox
$dcListEVFComboBox.Location = New-Object System.Drawing.Point(80,15)
$dcListEVFComboBox.DropDownStyle = "DropDownList"
$dcListEVFComboBox.Width = 200
$dcListEVFComboBox.TabIndex = 2

$eventTypeComboBox = New-Object System.Windows.Forms.ComboBox
$eventTypeComboBox.Location = New-Object System.Drawing.Point(290,15)
$eventTypeComboBox.DropDownStyle = "DropDownList"
$eventTypeComboBox.Width = 80
$eventTypeComboBox.TabIndex = 3
$eventTypeComboBox.Items.Add("Application")
$eventTypeComboBox.Items.Add("Security")
$eventTypeComboBox.Items.Add("System")

$evtThresholdComboBox = New-Object System.Windows.Forms.ComboBox
$evtThresholdComboBox.Location = New-Object System.Drawing.Point(380,15)
$evtThresholdComboBox.DropDownStyle = "DropDownList"
$evtThresholdComboBox.Width = 80
$evtThresholdComboBox.TabIndex = 4
$evtThresholdComboBox.Items.Add("Last 100")
$evtThresholdComboBox.Items.Add("Last 250")
$evtThresholdComboBox.Items.Add("Last 500")
$evtThresholdComboBox.Items.Add("Last 1000")
$evtThresholdComboBox.Items.Add("Full log")

$lockAccListComboBox = New-Object System.Windows.Forms.ComboBox
$lockAccListComboBox.Location = New-Object System.Drawing.Point(190,16)
$lockAccListComboBox.DropDownStyle = "DropDownList"
$lockAccListComboBox.Width = 150
$lockAccListComboBox.TabIndex = 2

$consultTabPage.controls.Add($GroupComboBox)
$adTabPage.controls.AddRange(@($DCListComboBox,$DCRolesComboBox))
$groupTabPage.controls.AddRange(@($GrpFilterComboBox,$GrpListComboBox))
$compTabPage.controls.AddRange(@($CompFilterComboBox,$CompListComboBox,$CompGrpMbrComboBox))
$eventvwrPage.controls.AddRange(@($dcListEVFComboBox,$eventTypeComboBox,$evtThresholdComboBox))
$lockPage.controls.Add($lockAccListComboBox)

    #endregion

    #region TextBox
$accNameTextBox = New-Object System.Windows.Forms.TextBox
$accNameTextBox.Location = New-Object System.Drawing.Point(20,25)
$accNameTextBox.Width = 100
$accNameTextBox.TabIndex = 0

$changePwTextBox1 = New-Object System.Windows.Forms.TextBox
$changePwTextBox1.Location = New-Object System.Drawing.Point(395,415)
$changePwTextBox1.Width = 165
$changePwTextBox1.TabIndex = 18
$changePwTextBox1.PasswordChar = '*'
$changePwTextBox2 = New-Object System.Windows.Forms.TextBox
$changePwTextBox2.Location = New-Object System.Drawing.Point(395,440)
$changePwTextBox2.Width = 165
$changePwTextBox2.TabIndex = 19
$changePwTextBox2.PasswordChar = '*'

$grpFilterTextBox = New-Object System.Windows.Forms.TextBox
$grpFilterTextBox.Location = New-Object System.Drawing.Point(265,15)
$grpFilterTextBox.Width = 110
$grpFilterTextBox.TabIndex = 3

$compFilterTextBox = New-Object System.Windows.Forms.TextBox
$compFilterTextBox.Location = New-Object System.Drawing.Point(265,15)
$compFilterTextBox.Width = 110
$compFilterTextBox.TabIndex = 3

$compDetailsTextBox = New-Object System.Windows.Forms.TextBox
$compDetailsTextBox.Location = New-Object System.Drawing.Point(25,410)
$compDetailsTextBox.Width = 300
$compDetailsTextBox.Height = 50
$compDetailsTextBox.TabIndex = 7
$compDetailsTextBox.Multiline = $true
$compDetailsTextBox.ReadOnly = $true
$compDetailsTextBox.ScrollBars = "Vertical"
$compDetailsTextBox.Text = "Computer specs will appear here if requested."

$evtMsgTextBox = New-Object System.Windows.Forms.TextBox
$evtMsgTextBox.Location = New-Object System.Drawing.Point(25,350)
$evtMsgTextBox.Width = 445
$evtMsgTextBox.Height = 120
$evtMsgTextBox.TabIndex = 17
$evtMsgTextBox.Multiline = $true
$evtMsgTextBox.ReadOnly = $true
$evtMsgTextBox.ScrollBars = "Vertical"
$evtMsgTextBox.Text = "Selected event's message will be displayed here."

$evtIDfilterTextBox = New-Object System.Windows.Forms.TextBox
$evtIDfilterTextBox.Location = New-Object System.Drawing.Point(215,290)
$evtIDfilterTextBox.Width = 45
$evtIDfilterTextBox.MaxLength = 6
$evtIDfilterTextBox.TabIndex = 16

$consultTabPage.controls.AddRange(@($accNameTextBox,$changePwTextBox1,$changePwTextBox2))
$groupTabPage.controls.Add($grpFilterTextBox)
$compTabPage.controls.AddRange(@($compFilterTextBox,$compDetailsTextBox))
$eventvwrPage.controls.AddRange(@($evtMsgTextBox,$evtIDfilterTextBox))
    #endregion

    #region Buttons
$RetrieveUserInfoButton = New-Object System.Windows.Forms.Button
$RetrieveUserInfoButton.Location = New-Object System.Drawing.Point(140,23)
$RetrieveUserInfoButton.text = "Retrieve Info"
$RetrieveUserInfoButton.width = 80
$RetrieveUserInfoButton.TabIndex = 1

$RetrieveDCListButton = New-Object System.Windows.Forms.Button
$RetrieveDCListButton.Location = New-Object System.Drawing.Point(20,15)
$RetrieveDCListButton.Text = "Retrieve Domain Controllers"
$RetrieveDCListButton.width = 200
$RetrieveDCListButton.TabIndex = 1

$ExportDCListButton = New-Object System.Windows.Forms.Button
$ExportDCListButton.Location = New-Object System.Drawing.Point(250,15)
$ExportDCListButton.Text = "Export DC List"
$ExportDCListButton.width = 120
$ExportDCListButton.TabIndex = 2

$RefreshButton = New-Object System.Windows.Forms.Button
$RefreshButton.Location = New-Object System.Drawing.Point(240,23)
$RefreshButton.text = "Refresh"
$RefreshButton.width = 80
$RefreshButton.TabIndex = 2

$ResetButton = New-Object System.Windows.Forms.Button
$ResetButton.Location = New-Object System.Drawing.Point(340,23)
$ResetButton.Text = "Reset"
$ResetButton.width = 80
$ResetButton.TabIndex = 3

$ResetDCListButton = New-Object System.Windows.Forms.Button
$ResetDCListButton.Location = New-Object System.Drawing.Point(400,15)
$ResetDCListButton.Text = "Clear DC List"
$ResetDCListButton.Width = 160
$ResetDCListButton.TabIndex = 3

$GrpMoreInfoButton = New-Object System.Windows.Forms.Button
$GrpMoreInfoButton.Location = New-Object System.Drawing.Point(275,315)
$GrpMoreInfoButton.Text = "Group Info"
$GrpMoreInfoButton.Width = 90
$GrpMoreInfoButton.TabIndex = 5

$ExportToFileButton = New-Object System.Windows.Forms.Button
$ExportToFileButton.Location = New-Object System.Drawing.Point(395,85)
$ExportToFileButton.Text = "Export to File"
$ExportToFileButton.Width = 165
$ExportToFileButton.TabIndex = 6

$UnlockAccButton = New-Object System.Windows.Forms.Button
$UnlockAccButton.Location = New-Object System.Drawing.Point(395,115)
$UnlockAccButton.Text = "Unlock Account"
$UnlockAccButton.Width = 165
$UnlockAccButton.TabIndex = 7

$DisableAccButton = New-Object System.Windows.Forms.Button
$DisableAccButton.Location = New-Object System.Drawing.Point(395,145)
$DisableAccButton.Text = "Disable Account"
$DisableAccButton.Width = 165
$DisableAccButton.TabIndex = 8

$EnableAccButton = New-Object System.Windows.Forms.Button
$EnableAccButton.Location = New-Object System.Drawing.Point(395,175)
$EnableAccButton.Text = "Enable Account"
$EnableAccButton.Width = 165
$EnableAccButton.TabIndex = 9

$SetExpDateButton = New-Object System.Windows.Forms.Button
$SetExpDateButton.Location = New-Object System.Drawing.Point(395,215)
$SetExpDateButton.Text = "Set account expiration date"
$SetExpDateButton.Width = 165
$SetExpDateButton.TabIndex = 10

$disableExpDateButton = New-Object System.Windows.Forms.Button
$disableExpDateButton.Location = New-Object System.Drawing.Point(395,280)
$disableExpDateButton.Text = "Remove account exp. date"
$disableExpDateButton.Width = 165
$disableExpDateButton.TabIndex = 14

$neverExpPwButton = New-Object System.Windows.Forms.Button
$neverExpPwButton.Location = New-Object System.Drawing.Point(395,320)
$neverExpPwButton.Text = "Password shall not expire"
$neverExpPwButton.Width = 165
$neverExpPwButton.TabIndex = 15

$doesExpPwButton = New-Object System.Windows.Forms.Button
$doesExpPwButton.Location = New-Object System.Drawing.Point(395,350)
$doesExpPwButton.Text = "Password shall expire"
$doesExpPwButton.Width = 165
$doesExpPwButton.TabIndex = 16

$changeUserPwButton = New-Object System.Windows.Forms.Button
$changeUserPwButton.Location = New-Object System.Drawing.Point(395,385)
$changeUserPwButton.Text = "Change user password"
$changeUserPwButton.Width = 165
$changeUserPwButton.TabIndex = 17

$clearLogButton = New-Object System.Windows.Forms.Button
$clearLogButton.Location = New-Object System.Drawing.Point(20,450)
$clearLogButton.Text = "Clear log"
$clearLogButton.Width = 125
$clearLogButton.TabIndex = 1

$exportLogButton = New-Object System.Windows.Forms.Button
$exportLogButton.Location = New-Object System.Drawing.Point(435,450)
$exportLogButton.Text = "Export log to CSV"
$exportLogButton.Width = 125
$exportLogButton.TabIndex = 2

$mstscButton = New-Object System.Windows.Forms.Button
$mstscButton.Location = New-Object System.Drawing.Point(370,415)
$mstscButton.Text = "Open RDP connection"
$mstscButton.Width = 170
$mstscButton.TabIndex = 10

$dcdiagButton = New-Object System.Windows.Forms.Button
$dcdiagButton.Location = New-Object System.Drawing.Point(370,325)
$dcdiagButton.Text = "Run dcdiag"
$dcdiagButton.Width = 170
$dcdiagButton.TabIndex = 7

$dcdiagRepButton = New-Object System.Windows.Forms.Button
$dcdiagRepButton.Location = New-Object System.Drawing.Point(370,355)
$dcdiagRepButton.Text = "Run dcdiag /test:replications"
$dcdiagRepButton.Width = 170
$dcdiagRepButton.TabIndex = 8

$dcdiagDnsButton = New-Object System.Windows.Forms.Button
$dcdiagDnsButton.Location = New-Object System.Drawing.Point(370,385)
$dcdiagDnsButton.Text = "Run dcdiag /test:dns"
$dcdiagDnsButton.Width = 170
$dcdiagDnsButton.TabIndex = 9

$pingDCButton = New-Object System.Windows.Forms.Button
$pingDCButton.Location = New-Object System.Drawing.Point(370,295)
$pingDCButton.Text = "Ping server"
$pingDCButton.Width = 170
$pingDCButton.TabIndex = 6

$GetGrpButton = New-Object System.Windows.Forms.Button
$GetGrpButton.Location = New-Object System.Drawing.Point(20,15)
$GetGrpButton.Text = "Retrieve AD Groups"
$GetGrpButton.Width = 120
$GetGrpButton.TabIndex = 1

$ClearGrpDGVButton = New-Object System.Windows.Forms.Button
$ClearGrpDGVButton.Location = New-Object System.Drawing.Point(390,15)
$ClearGrpDGVButton.Text = "Clear List"
$ClearGrpDGVButton.Width = 75
$ClearGrpDGVButton.TabIndex = 4

$ExportGrpDGVButton = New-Object System.Windows.Forms.Button
$ExportGrpDGVButton.Location = New-Object System.Drawing.Point(485,15)
$ExportGrpDGVButton.Text = "Export List"
$ExportGrpDGVButton.Width = 75
$ExportGrpDGVButton.TabIndex = 5

$ExportGrpInfoButton = New-Object System.Windows.Forms.Button
$ExportGrpInfoButton.Location = New-Object System.Drawing.Point(470,300)
$ExportGrpInfoButton.Text = "Export to File"
$ExportGrpInfoButton.Height = 40
$ExportGrpInfoButton.Width = 80
$ExportGrpInfoButton.TabIndex = 7

$ExportGrpMemButton = New-Object System.Windows.Forms.Button
$ExportGrpMemButton.Location = New-Object System.Drawing.Point(470,350)
$ExportGrpMemButton.Text = "Export member list"
$ExportGrpMemButton.Height = 50
$ExportGrpMemButton.Width = 80
$ExportGrpMemButton.TabIndex = 8

$GetGrpUserButton = New-Object System.Windows.Forms.Button
$GetGrpUserButton.Location = New-Object System.Drawing.Point(470,410)
$GetGrpUserButton.Text = "Get selected user info"
$GetGrpUserButton.Height = 40
$GetGrpUserButton.Width = 80
$GetGrpUserButton.TabIndex = 9

$GetCompButton = New-Object System.Windows.Forms.Button
$GetCompButton.Location = New-Object System.Drawing.Point(20,15)
$GetCompButton.Text = "Retrieve Computers"
$GetCompButton.Width = 120
$GetCompButton.TabIndex = 1

$ClearCompDGVButton = New-Object System.Windows.Forms.Button
$ClearCompDGVButton.Location = New-Object System.Drawing.Point(390,15)
$ClearCompDGVButton.Text = "Clear List"
$ClearCompDGVButton.Width = 75
$ClearCompDGVButton.TabIndex = 4

$ExportCompDGVButton = New-Object System.Windows.Forms.Button
$ExportCompDGVButton.Location = New-Object System.Drawing.Point(485,15)
$ExportCompDGVButton.Text = "Export List"
$ExportCompDGVButton.Width = 75
$ExportCompDGVButton.TabIndex = 5

$ExportCompInfoButton = New-Object System.Windows.Forms.Button
$ExportCompInfoButton.Location = New-Object System.Drawing.Point(400,260)
$ExportCompInfoButton.Text = "Export to File"
$ExportCompInfoButton.Width = 150
$ExportCompInfoButton.TabIndex = 8

$PingCompButton = New-Object System.Windows.Forms.Button
$PingCompButton.Location = New-Object System.Drawing.Point(400,290)
$PingCompButton.Text = "Ping the computer"
$PingCompButton.Width = 150
$PingCompButton.TabIndex = 9

$RetrieveCompSpecsButton = New-Object System.Windows.Forms.Button
$RetrieveCompSpecsButton.Location = New-Object System.Drawing.Point(400,320)
$RetrieveCompSpecsButton.Text = "Retrieve computer specs (using WMI)"
$RetrieveCompSpecsButton.Height = 40
$RetrieveCompSpecsButton.Width = 150
$RetrieveCompSpecsButton.TabIndex = 10

$mstscCompButton = New-Object System.Windows.Forms.Button
$mstscCompButton.Location = New-Object System.Drawing.Point(400,367)
$mstscCompButton.Text = "Open a RDP session"
$mstscCompButton.Width = 150
$mstscCompButton.TabIndex = 11

$rebootCompButton = New-Object System.Windows.Forms.Button
$rebootCompButton.Location = New-Object System.Drawing.Point(400,397)
$rebootCompButton.Text = "Reboot computer"
$rebootCompButton.Width = 150
$rebootCompButton.TabIndex = 12

$gprCompButton = New-Object System.Windows.Forms.Button
$gprCompButton.Location = New-Object System.Drawing.Point(400,427)
$gprCompButton.Text = "Get a gpresult report"
$gprCompButton.Width = 150
$gprCompButton.TabIndex = 13

$getDCListEVFButton = New-Object System.Windows.Forms.Button
$getDCListEVFButton.Location = New-Object System.Drawing.Point(10,14)
$getDCListEVFButton.Text = "Get DCs"
$getDCListEVFButton.Width = 60
$getDCListEVFButton.TabIndex = 1

$getDCEventButton = New-Object System.Windows.Forms.Button
$getDCEventButton.Location = New-Object System.Drawing.Point(470,14)
$getDCEventButton.Text = "Get event log"
$getDCEventButton.Width = 100
$getDCEventButton.TabIndex = 5

$exportEvtListButton = New-Object System.Windows.Forms.Button
$exportEvtListButton.Location = New-Object System.Drawing.Point(495,65)
$exportEvtListButton.Width = 70
$exportEvtListButton.Text = "Export"
$exportEvtListButton.TabIndex = 6

$clearEvtListButton = New-Object System.Windows.Forms.Button
$clearEvtListButton.Location = New-Object System.Drawing.Point(495,100)
$clearEvtListButton.Width = 70
$clearEvtListButton.Text = "Clear"
$clearEvtListButton.TabIndex = 7

$getLockedButton = New-Object System.Windows.Forms.Button
$getLockedButton.Location = New-Object System.Drawing.Point(30,15)
$getLockedButton.Width = 150
$getLockedButton.Text = "Get locked accounts"
$getLockedButton.TabIndex = 1

$checkLockButton = New-Object System.Windows.Forms.Button
$checkLockButton.Location = New-Object System.Drawing.Point(350,15)
$checkLockButton.Width = 80
$checkLockButton.Text = "Check"
$checkLockButton.TabIndex = 3

$resetLockFormButton = New-Object System.Windows.Forms.Button
$resetLockFormButton.Location = New-Object System.Drawing.Point(470,15)
$resetLockFormButton.Width = 80
$resetLockFormButton.Text = "Reset"
$resetLockFormButton.TabIndex = 4

$UnlockFoundLockedAccButton = New-Object System.Windows.Forms.Button
$UnlockFoundLockedAccButton.Location = New-Object System.Drawing.Point(145,385)
$UnlockFoundLockedAccButton.Width = 135
$UnlockFoundLockedAccButton.Text = "Unlock this account"
$UnlockFoundLockedAccButton.TabIndex = 5

$MoreInfoLockedAccButton = New-Object System.Windows.Forms.Button
$MoreInfoLockedAccButton.Location = New-Object System.Drawing.Point(300,385)
$MoreInfoLockedAccButton.Width = 135
$MoreInfoLockedAccButton.Text = "Fetch user information"
$MoreInfoLockedAccButton.TabIndex = 6

$LockingDCMoreInfoButton = New-Object System.Windows.Forms.Button
$LockingDCMoreInfoButton.Location = New-Object System.Drawing.Point(55,415)
$LockingDCMoreInfoButton.Width = 135
$LockingDCMoreInfoButton.Height = 40
$LockingDCMoreInfoButton.Text = "Display DC information"
$LockingDCMoreInfoButton.TabIndex = 7

$LockingDCEvtButton = New-Object System.Windows.Forms.Button
$LockingDCEvtButton.Location = New-Object System.Drawing.Point(220,415)
$LockingDCEvtButton.Width = 135
$LockingDCEvtButton.Height = 40
$LockingDCEvtButton.Text = "Show DC event logs"
$LockingDCEvtButton.TabIndex = 8

$LockingCompMoreInfoButton = New-Object System.Windows.Forms.Button
$LockingCompMoreInfoButton.Location = New-Object System.Drawing.Point(385,415)
$LockingCompMoreInfoButton.Width = 135
$LockingCompMoreInfoButton.Height = 40
$LockingCompMoreInfoButton.Text = "Display extra computer information"
$LockingCompMoreInfoButton.TabIndex = 9

$HomeUserButton = New-Object System.Windows.Forms.Button
$HomeUserButton.Location = New-Object System.Drawing.Point(35,80)
$HomeUserButton.Width = 100
$HomeUserButton.Height = 40
$HomeUserButton.Text = "Users Tab"
$HomeUserButton.TabIndex = 1

$HomeCompButton = New-Object System.Windows.Forms.Button
$HomeCompButton.Location = New-Object System.Drawing.Point(35,135)
$HomeCompButton.Width = 100
$HomeCompButton.Height = 40
$HomeCompButton.Text = "Computers Tab"
$HomeCompButton.TabIndex = 2

$HomeGrpButton = New-Object System.Windows.Forms.Button
$HomeGrpButton.Location = New-Object System.Drawing.Point(35,190)
$HomeGrpButton.Width = 100
$HomeGrpButton.Height = 40
$HomeGrpButton.Text = "Groups Tab"
$HomeGrpButton.TabIndex = 3

$HomeDCButton = New-Object System.Windows.Forms.Button
$HomeDCButton.Location = New-Object System.Drawing.Point(35,245)
$HomeDCButton.Width = 100
$HomeDCButton.Height = 40
$HomeDCButton.Text = "Domain Controllers Tab"
$HomeDCButton.TabIndex = 4

$HomeEvtButton = New-Object System.Windows.Forms.Button
$HomeEvtButton.Location = New-Object System.Drawing.Point(35,300)
$HomeEvtButton.Width = 100
$HomeEvtButton.Height = 40
$HomeEvtButton.Text = "Event Viewer Tab"
$HomeEvtButton.TabIndex = 5

$HomeLockButton = New-Object System.Windows.Forms.Button
$HomeLockButton.Location = New-Object System.Drawing.Point(35,355)
$HomeLockButton.Width = 100
$HomeLockButton.Height = 40
$HomeLockButton.Text = "Locked Accounts Tab"
$HomeLockButton.TabIndex = 6

$HomeLogButton = New-Object System.Windows.Forms.Button
$HomeLogButton.Location = New-Object System.Drawing.Point(35,410)
$HomeLogButton.Width = 100
$HomeLogButton.Height = 40
$HomeLogButton.Text = "Log Tab"
$HomeLogButton.TabIndex = 7

$homeTabPage.controls.AddRange(@($HomeUserButton,$HomeCompButton,$HomeGrpButton,$HomeDCButton,$HomeEvtButton,$HomeLockButton,$HomeLogButton))
$consultTabPage.controls.AddRange(@($RetrieveUserInfoButton,$RefreshButton,$ExportToFileButton,$UnlockAccButton,$DisableAccButton,$EnableAccButton,$SetExpDateButton,$disableExpDateButton,$changeUserPwButton,$neverExpPwButton,$doesExpPwButton,$resetButton,$GrpMoreInfoButton))
$logTabPage.controls.AddRange(@($clearLogButton,$exportLogButton))
$groupTabPage.controls.AddRange(@($GetGrpButton,$ClearGrpDGVButton,$ExportGrpDGVButton,$ExportGrpInfoButton,$GetGrpUserButton,$ExportGrpMemButton))
$adTabPage.controls.AddRange(@($RetrieveDCListButton,$ResetDCListButton;$mstscButton,$dcdiagButton,$dcdiagRepButton,$dcdiagDnsButton,$ExportDCListButton,$pingDCButton))
$compTabPage.controls.AddRange(@($GetCompButton,$ClearCompDGVButton,$ExportCompDGVButton,$ExportCompInfoButton,$PingCompButton,$RetrieveCompSpecsButton,$mstscCompButton,$rebootCompButton,$gprCompButton))
$eventvwrPage.controls.AddRange(@($getDCListEVFButton,$getDCEventButton,$exportEvtListButton,$clearEvtListButton))
$lockPage.controls.AddRange(@($getLockedButton,$checkLockButton,$resetLockFormButton,$UnlockFoundLockedAccButton,$MoreInfoLockedAccButton,$LockingDCMoreInfoButton,$LockingDCEvtButton,$LockingCompMoreInfoButton))
    #endregion

    #region DateTimePick

$EvtBeforeDateTimePick = New-Object System.Windows.Forms.DateTimePicker
$EvtBeforeDateTimePick.Location = New-Object System.Drawing.Point(200,265)
$EvtBeforeDateTimePick.ShowUpDown = $true
$EvtBeforeDateTimePick.Format = 'Custom'
$EvtBeforeDateTimePick.CustomFormat = "M/d/yyyy h:mm:ss tt"
$EvtBeforeDateTimePick.Width = 155
$EvtBeforeDateTimePick.TabIndex = 13

$EvtAfterDateTimePick = New-Object System.Windows.Forms.DateTimePicker
$EvtAfterDateTimePick.Location = New-Object System.Drawing.Point(405,265)
$EvtAfterDateTimePick.ShowUpDown = $true
$EvtAfterDateTimePick.Format = 'Custom'
$EvtAfterDateTimePick.CustomFormat = "M/d/yyyy h:mm:ss tt"
$EvtAfterDateTimePick.Width = 155
$EvtAfterDateTimePick.TabIndex = 14

$eventvwrPage.controls.AddRange(@($EvtBeforeDateTimePick,$EvtAfterDateTimePick))

    #endregion

    #region Checkbox
$lockedBoolCheck = New-Object System.Windows.Forms.CheckBox
$lockedBoolCheck.Location = New-Object System.Drawing.Point(80,350)
$enabledBoolCheck = New-Object System.Windows.Forms.CheckBox
$enabledBoolCheck.Location = New-Object System.Drawing.Point(220,350)
$pwNeverExpBoolCheck = New-Object System.Windows.Forms.CheckBox
$pwNeverExpBoolCheck.Location = New-Object System.Drawing.Point(115,415)
$pwExpiredBoolCheck = New-Object System.Windows.Forms.CheckBox
$pwExpiredBoolCheck.Location = New-Object System.Drawing.Point(230,415)

$consultTabPage.controls.AddRange(@($lockedBoolCheck,$enabledBoolCheck,$pwNeverExpBoolCheck,$pwExpiredBoolCheck))

$EvtInfoCheck = New-Object System.Windows.Forms.CheckBox
$EvtInfoCheck.Location = New-Object System.Drawing.Point(25,265)
$EvtInfoCheck.Text = "Info"
$EvtInfoCheck.TabIndex = 8
$EvtWarCheck = New-Object System.Windows.Forms.CheckBox
$EvtWarCheck.Location = New-Object System.Drawing.Point(75,265)
$EvtWarCheck.Text = "Warning"
$EvtWarCheck.TabIndex = 9
$EvtErrCheck = New-Object System.Windows.Forms.CheckBox
$EvtErrCheck.Location = New-Object System.Drawing.Point(25,290)
$EvtErrCheck.Text = "Error"
$EvtErrCheck.TabIndex = 10
$EvtCritCheck = New-Object System.Windows.Forms.CheckBox
$EvtCritCheck.Location = New-Object System.Drawing.Point(75,290)
$EvtCritCheck.Text = "Critical"
$EvtCritCheck.TabIndex = 11
$EvtCritCheck.Checked = $true
$EvtErrCheck.Checked = $true
$EvtInfoCheck.Checked = $true
$EvtWarCheck.Checked = $true

$EvtDateCheck = New-Object System.Windows.Forms.CheckBox
$EvtDateCheck.Location = New-Object System.Drawing.Point(145,265)
$EvtDateCheck.Text = "Date:"
$EvtDateCheck.TabIndex = 12
$EvtIDCheck = New-Object System.Windows.Forms.CheckBox
$EvtIDCheck.Location = New-Object System.Drawing.Point(145,290)
$EvtIDCheck.Text = "Event ID:"
$EvtIDCheck.TabIndex = 15

$eventvwrPage.controls.AddRange(@($EvtIDCheck,$EvtDateCheck,$EvtWarCheck,$EvtInfoCheck,$EvtCritCheck,$EvtErrCheck))
    #endregion

	#region NumUpDowns
$DayNUD = New-Object System.Windows.Forms.NumericUpDown
$DayNUD.Location = New-Object System.Drawing.Point(460,250)
$DayNUD.Width = 35
$DayNUD.Minimum = 1
$DayNUD.Maximum = 31
$DayNUD.TabIndex = 12
$DayNUD.ReadOnly = $true
$MonthNUD = New-Object System.Windows.Forms.NumericUpDown
$MonthNUD.Location = New-Object System.Drawing.Point(400,250)
$MonthNUD.Width = 35
$MonthNUD.Minimum = 1
$MonthNUD.Maximum = 12
$MonthNUD.TabIndex = 11
$MonthNUD.ReadOnly = $true
$YearNUD = New-Object System.Windows.Forms.NumericUpDown
$YearNUD.Location = New-Object System.Drawing.Point(520,250)
$YearNUD.Width = 35
$YearNUD.Minimum = 00
$YearNUD.Maximum = 99
$YearNUD.TabIndex = 13
$YearNUD.ReadOnly = $true

$consultTabPage.controls.AddRange(@($DayNUD,$MonthNUD,$YearNUD))
	#endregion	
	
	#region DataGridView
$LogDGV = New-Object System.Windows.Forms.DataGridView
$LogDGV.Location = New-Object System.Drawing.Point(20,20)
$LogDGV.ReadOnly = $true
$LogDGV.Size = '540,415'
$LogDGV.RowHeadersVisible = $false
$LogDGV.ColumnCount = 3
$LogDGV.TabIndex = 20
$LogDGV.AllowUserToOrderColumns = $false
$LogDGV.AllowUserToResizeColumns = $false
$LogDGV.AllowUserToAddRows = $false
$LogDGV.ColumnHeadersHeightSizeMode = "DisableResizing"
$LogDGV.AllowUserToResizeRows = $false
$LogDGV.Columns[0].Name = "Timestamp"
$LogDGV.Columns[0].Width = 100
$LogDGV.Columns[1].Name = "User"
$LogDGV.Columns[1].Width = 100
$LogDGV.Columns[2].Name = "Status"
$LogDGV.Columns[2].Width = 320
$LogDGV.MultiSelect = $false

$logTabPage.controls.Add($LogDGV)	

$DCListDGV = New-Object System.Windows.Forms.DataGridView
$DCListDGV.Location = New-Object System.Drawing.Point(20,45)
$DCListDGV.ReadOnly = $true
$DCListDGV.Size = '540,210'
$DCListDGV.RowHeadersVisible = $false
$DCListDGV.ColumnCount = 3
$DCListDGV.AllowUserToOrderColumns = $false
$DCListDGV.AllowUserToResizeColumns = $true
$DCListDGV.AllowUserToAddRows = $false
$DCListDGV.ColumnHeadersHeightSizeMode = "DisableResizing"
$DCListDGV.AllowUserToResizeRows = $false
$DCListDGV.Columns[0].Name = "Hostname"
$DCListDGV.Columns[0].Width = 150
$DCListDGV.Columns[1].Name = "IPV4 Address"
$DCListDGV.Columns[1].Width = 90
$DCListDGV.Columns[2].Name = "Distinguished Name"
$DCListDGV.Columns[2].Width = 280
$DCListDGV.MultiSelect = $false

$adTabPage.controls.Add($DCListDGV)

$GrpListDGV = New-Object System.Windows.Forms.DataGridView
$GrpListDGV.Location = New-Object System.Drawing.Point(20,45)
$GrpListDGV.ReadOnly = $true
$GrpListDGV.Size = '540,210'
$GrpListDGV.RowHeadersVisible = $false
$GrpListDGV.ColumnCount = 3
$GrpListDGV.AllowUserToOrderColumns = $false
$GrpListDGV.AllowUserToResizeColumns = $true
$GrpListDGV.AllowUserToAddRows = $false
$GrpListDGV.ColumnHeadersHeightSizeMode = "DisableResizing"
$GrpListDGV.AllowUserToResizeRows = $false
$GrpListDGV.Columns[0].Name = "Group ID"
$GrpListDGV.Columns[0].Width = 120
$GrpListDGV.Columns[1].Name = "Group Name"
$GrpListDGV.Columns[1].Width = 150
$GrpListDGV.Columns[2].Name = "Distinguished Name"
$GrpListDGV.Columns[2].Width = 250
$GrpListDGV.MultiSelect = $false

$GrpSelectDGV = New-Object System.Windows.Forms.DataGridView
$GrpSelectDGV.Location = New-Object System.Drawing.Point(25,345)
$GrpSelectDGV.ReadOnly = $true
$GrpSelectDGV.Size = '420,110'
$GrpSelectDGV.RowHeadersVisible = $false
$GrpSelectDGV.ColumnCount = 3
$GrpSelectDGV.AllowUserToOrderColumns = $false
$GrpSelectDGV.AllowUserToResizeColumns = $true
$GrpSelectDGV.AllowUserToAddRows = $false
$GrpSelectDGV.ColumnHeadersHeightSizeMode = "DisableResizing"
$GrpSelectDGV.AllowUserToResizeRows = $false
$GrpSelectDGV.Columns[0].Name = "User ID"
$GrpSelectDGV.Columns[0].Width = 80
$GrpSelectDGV.Columns[1].Name = "User Name"
$GrpSelectDGV.Columns[1].Width = 120
$GrpSelectDGV.Columns[2].Name = "Distinguished Name"
$GrpSelectDGV.Columns[2].Width = 195
$GrpSelectDGV.MultiSelect = $false

$groupTabPage.controls.AddRange(@($GrpListDGV,$GrpSelectDGV)) 

$CompListDGV = New-Object System.Windows.Forms.DataGridView
$CompListDGV.Location = New-Object System.Drawing.Point(20,45)
$CompListDGV.ReadOnly = $true
$CompListDGV.Size = '540,160'
$CompListDGV.RowHeadersVisible = $false
$CompListDGV.ColumnCount = 3
$CompListDGV.AllowUserToOrderColumns = $false
$CompListDGV.AllowUserToResizeColumns = $true
$CompListDGV.AllowUserToAddRows = $false
$CompListDGV.ColumnHeadersHeightSizeMode = "DisableResizing"
$CompListDGV.AllowUserToResizeRows = $false
$CompListDGV.Columns[0].Name = "Computer Name"
$CompListDGV.Columns[0].Width = 100
$CompListDGV.Columns[1].Name = "IPV4 Address"
$CompListDGV.Columns[1].Width = 90
$CompListDGV.Columns[2].Name = "Distinguished Name"
$CompListDGV.Columns[2].Width = 330
$CompListDGV.MultiSelect = $false

$compTabPage.controls.Add($CompListDGV)

$EventListDGV = New-Object System.Windows.Forms.DataGridView
$EventListDGV.Location = New-Object System.Drawing.Point(15,45)
$EventListDGV.ReadOnly = $true
$EventListDGV.Size = '465,200'
$EventListDGV.RowHeadersVisible = $false
$EventListDGV.ColumnCount = 6
$EventListDGV.AllowUserToOrderColumns = $false
$EventListDGV.AllowUserToResizeColumns = $true
$EventListDGV.ColumnHeadersHeightSizeMode = "DisableResizing"
$EventListDGV.AllowUserToResizeRows = $false
$EventListDGV.AllowUserToAddRows = $false
$EventListDGV.Columns[0].Name = "Entry no."
$EventListDGV.Columns[0].Width = 45
$EventListDGV.Columns[1].Name = "Level"
$EventListDGV.Columns[1].Width = 75
$EventListDGV.Columns[2].Name = "Timestamp"
$EventListDGV.Columns[2].Width = 130
$EventListDGV.Columns[3].Name = "Source"
$EventListDGV.Columns[3].Width = 140
$EventListDGV.Columns[4].Name = "EventID"
$EventListDGV.Columns[4].Width = 50
$EventListDGV.Columns[5].Visible = $False
$EventListDGV.MultiSelect = $false

$eventvwrPage.controls.Add($EventListDGV)

$LockInfoDGV = New-Object System.Windows.Forms.DataGridView
$LockInfoDGV.Location = New-Object System.Drawing.Point(30,130)
$LockInfoDGV.ReadOnly = $true
$LockInfoDGV.Size = '530,160'
$LockInfoDGV.RowHeadersVisible = $false
$LockInfoDGV.ColumnCount = 4
$LockInfoDGV.AllowUserToOrderColumns = $false
$LockInfoDGV.AllowUserToResizeColumns = $true
$LockInfoDGV.AllowUserToAddRows = $false
$LockInfoDGV.ColumnHeadersHeightSizeMode = "DisableResizing"
$LockInfoDGV.AllowUserToResizeRows = $false
$LockInfoDGV.Columns[0].Name = "DC Hostname"
$LockInfoDGV.Columns[0].Width = 150
$LockInfoDGV.Columns[1].Name = "Bad pwd. Count"
$LockInfoDGV.Columns[1].Width = 90
$LockInfoDGV.Columns[2].Name = "Last Bad pwd. Timestamp"
$LockInfoDGV.Columns[2].Width = 135
$LockInfoDGV.Columns[3].Name = "Acc. Lock Timestamp"
$LockInfoDGV.Columns[3].Width = 130
$LockInfoDGV.MultiSelect = $false

$lockPage.controls.Add($LockInfoDGV)

	#endregion
	
    #region Groupbox
$ConsultInfoPanel = New-Object System.Windows.Forms.GroupBox
$ConsultInfoPanel.Location = New-Object System.Drawing.Point(20,65)
$ConsultInfoPanel.Height = 400
$ConsultInfoPanel.Width = 350
$ConsultInfoPanel.Text = "User Information"
    
$ConsultActionPanel = New-Object System.Windows.Forms.GroupBox
$ConsultActionPanel.Location = New-Object System.Drawing.Point(390,65)
$ConsultActionPanel.Height = 400
$ConsultActionPanel.Width = 175
$ConsultActionPanel.Text = "Actions"    

$DCInfoPanel = New-Object System.Windows.Forms.GroupBox
$DCInfoPanel.Location = New-Object System.Drawing.Point(20,275)
$DCInfoPanel.Height = 180
$DCInfoPanel.Width = 310
$DCInfoPanel.Text = "Domain Controller Information"

$DCActionPanel = New-Object System.Windows.Forms.GroupBox
$DCActionPanel.Location = New-Object System.Drawing.Point(350,275)
$DCActionPanel.Height = 180
$DCActionPanel.Width = 210
$DCActionPanel.Text = "Actions"

$GrpInfoPanel = New-Object System.Windows.Forms.GroupBox
$GrpInfoPanel.Location = New-Object System.Drawing.Point(20,275)
$GrpInfoPanel.Height = 190
$GrpInfoPanel.Width = 430
$GrpInfoPanel.Text = "Group Information"

$GrpActionPanel = New-Object System.Windows.Forms.GroupBox
$GrpActionPanel.Location = New-Object System.Drawing.Point(460,275)
$GrpActionPanel.Height = 190
$GrpActionPanel.Width = 100
$GrpActionPanel.Text = "Actions"

$CompInfoPanel = New-Object System.Windows.Forms.GroupBox
$CompInfoPanel.Location = New-Object System.Drawing.Point(20,235)
$CompInfoPanel.Height = 230
$CompInfoPanel.Width = 310
$CompInfoPanel.Text = "Computer Informations"

$CompActionPanel = New-Object System.Windows.Forms.GroupBox
$CompActionPanel.Location = New-Object System.Drawing.Point(390,235)
$CompActionPanel.Height = 230
$CompActionPanel.Width = 170
$CompActionPanel.Text = "Actions"

$EventTabPanel = New-Object System.Windows.Forms.GroupBox
$EventTabPanel.Location = New-Object System.Drawing.Point(490,40)
$EventTabPanel.Height = 105
$EventTabPanel.Width = 80
$EventTabPanel.Text = "Chart"

$EventStatsPanel = New-Object System.Windows.Forms.GroupBox
$EventStatsPanel.Location = New-Object System.Drawing.Point(490,150)
$EventStatsPanel.Height = 95
$EventStatsPanel.Width = 80
$EventStatsPanel.Text = "Stats"

$EventFilterPanel = New-Object System.Windows.Forms.GroupBox
$EventFilterPanel.Location = New-Object System.Drawing.Point(15,250)
$EventFilterPanel.Height = 70
$EventFilterPanel.Width = 555
$EventFilterPanel.Text = "Event Filters"

$EventMsgPanel = New-Object System.Windows.Forms.GroupBox
$EventMsgPanel.Location = New-Object System.Drawing.Point(15,335)
$EventMsgPanel.Height = 145
$EventMsgPanel.Width = 465
$EventMsgPanel.Text = "Event message"

$LockedAccDetPanel = New-Object System.Windows.Forms.GroupBox
$LockedAccDetPanel.Location = New-Object System.Drawing.Point(15,60)
$LockedAccDetPanel.Height = 285
$LockedAccDetPanel.Width = 552
$LockedAccDetPanel.Text = "Account Details"

$LockedAccActPanel = New-Object System.Windows.Forms.GroupBox
$LockedAccActPanel.Location = New-Object System.Drawing.Point(15,355)
$LockedAccActPanel.Height = 120
$LockedAccActPanel.Width = 552
$LockedAccActPanel.Text = "Actions"

$consultTabPage.controls.AddRange(@($ConsultInfoPanel,$ConsultActionPanel))
$groupTabPage.controls.AddRange(@($GrpInfoPanel,$GrpActionPanel))
$adTabPage.controls.AddRange(@($DCInfoPanel,$DCActionPanel))
$compTabPage.controls.AddRange(@($CompInfoPanel,$CompActionPanel))
$eventvwrPage.controls.AddRange(@($EventTabPanel,$EventFilterPanel,$EventMsgPanel,$EventStatsPanel))
$lockPage.controls.AddRange(@($LockedAccDetPanel,$LockedAccActPanel))
    #endregion

	#region Menu
$MainMenu = New-Object System.Windows.Forms.MenuStrip
$MainMenu.Location = New-Object System.Drawing.Point(0,0)
$MainMenu.ShowItemToolTips = $true
$mainForm.controls.Add($MainMenu)

$FileMenu = New-Object System.Windows.Forms.ToolStripMenuItem
$FileChgLog = New-Object System.Windows.Forms.ToolStripMenuItem
$FileQuit = New-Object System.Windows.Forms.ToolStripMenuItem
$FileMenu.Text = "&File"
$FileChgLog.Text = "&Changelog"
$FileChgLog.ToolTipText = "Read the changelog."
$FileQuit.Text = "&Quit"
$FileQuit.ToolTipText = "Quit the Lightweight ActiveDirectory Toolbox."
$FileMenu.DropDownItems.AddRange(@($FileChgLog,$FileQuit))

$DevMenu = New-Object System.Windows.Forms.ToolStripMenuItem
$DevBlog = New-Object System.Windows.Forms.ToolStripMenuItem
$DevWfr = New-Object System.Windows.Forms.ToolStripMenuItem
$DevWen = New-Object System.Windows.Forms.ToolStripMenuItem
$DevMenu.Text = "&Developer links"
$DevBlog.Text = "Blog (fr)"
$DevBlog.ToolTipText = "Visit the developer's blog page about this application."
$DevWfr.Text = "Website (fr)"
$DevWfr.ToolTipText = "Visit the developer's website (in French)."
$DevWen.Text = "Website (en)"
$DevWen.ToolTipText = "Visit the developer's website (in English)."
$DevMenu.DropDownItems.AddRange(@($DevBlog,$DevWfr,$DevWen))

$UpdateMenu = New-Object System.Windows.Forms.ToolStripMenuItem
$UpdateMenu.Text = "Check for updates"
$UpdateMenu.ToolTipText = "Click to check for updates. An internet connection is required."

$queryingADMenu = New-Object System.Windows.Forms.ToolStripMenuItem
$queryingADMenu.ToolTipText = "The ActiveDirectory that you're querying."
$queryingADMenu.Enabled = $false

$MainMenu.Items.AddRange(@($FileMenu,$DevMenu,$UpdateMenu,$queryingADMenu))
	#endregion

	#region Tooltip
$NoExpPwToolTip = New-Object System.Windows.Forms.ToolTip
$DoesExpPwToolTip = New-Object System.Windows.Forms.ToolTip
$RemAccExpDateToolTip = New-Object System.Windows.Forms.ToolTip
$SetExpDateToolTip = New-Object System.Windows.Forms.ToolTip
$enableAccToolTip = New-Object System.Windows.Forms.ToolTip
$disableAccToolTip = New-Object System.Windows.Forms.ToolTip
$unlockAccToolTip = New-Object System.Windows.Forms.ToolTip
$exportToolTip = New-Object System.Windows.Forms.ToolTip
$changeUserPwToolTip = New-Object System.Windows.Forms.ToolTip
$monthToolTip = New-Object System.Windows.Forms.ToolTip
$dayToolTip = New-Object System.Windows.Forms.ToolTip
$yearToolTip = New-Object System.Windows.Forms.ToolTip
$retrieveToolTip = New-Object System.Windows.Forms.ToolTip
$refreshToolTip = New-Object System.Windows.Forms.ToolTip
$pwToolTip = New-Object System.Windows.Forms.ToolTip
$quitToolTip = New-Object System.Windows.Forms.ToolTip
$accDisplayNameVarToolTip = New-Object System.Windows.Forms.ToolTip
$clearLogButtonToolTip = New-Object System.Windows.Forms.ToolTip
$exportLogButtonToolTip = New-Object System.Windows.Forms.ToolTip 
$resetButtonToolTip = New-Object System.Windows.Forms.ToolTip
$resetDCListToolTip = New-Object System.Windows.Forms.ToolTip
$retrieveDCListToolTip = New-Object System.Windows.Forms.ToolTip
$mstscButtonToolTip = New-Object System.Windows.Forms.ToolTip
$dcdiagButtonToolTip = New-Object System.Windows.Forms.ToolTip
$dcdiagRepButtonToolTip = New-Object System.Windows.Forms.ToolTip
$dcdiagDnsButtonToolTip = New-Object System.Windows.Forms.ToolTip
$ExportDCListToolTip = New-Object System.Windows.Forms.ToolTip
$GetGrpButtonToolTip = New-Object System.Windows.Forms.ToolTip
$ClearGrpDGVButtonToolTip = New-Object System.Windows.Forms.ToolTip
$grpFilterTextBoxToolTip = New-Object System.Windows.Forms.ToolTip
$ExportGrpDGVButtonToolTip = New-Object System.Windows.Forms.ToolTip
$ExportGrpInfoButtonToolTip = New-Object System.Windows.Forms.ToolTip
$GetCompButtonToolTip = New-Object System.Windows.Forms.ToolTip
$ClearCompDGVButtonToolTip = New-Object System.Windows.Forms.ToolTip
$compFilterTextBoxToolTip = New-Object System.Windows.Forms.ToolTip
$ExportCompDGVButtonToolTip = New-Object System.Windows.Forms.ToolTip
$ExportCompInfoButtonToolTip = New-Object System.Windows.Forms.ToolTip
$pingDCButtonToolTip = New-Object System.Windows.Forms.ToolTip
$PingCompButtonToolTip = New-Object System.Windows.Forms.ToolTip
$RetrieveCompSpecsButtonToolTip = New-Object System.Windows.Forms.ToolTip
$mstscCompButtonToolTip = New-Object System.Windows.Forms.ToolTip
$rebootCompButtonToolTip = New-Object System.Windows.Forms.ToolTip
$gprCompButtonToolTip = New-Object System.Windows.Forms.ToolTip
$GrpMoreInfoButtonToolTip = New-Object System.Windows.Forms.ToolTip
$GetGrpUserButtonToolTip = New-Object System.Windows.Forms.ToolTip
$EvtThresholdComboBoxToolTip = New-Object System.Windows.Forms.ToolTip
$GetEventLogButtonToolTip = New-Object System.Windows.Forms.ToolTip
$ExportEvtListButtonToolTip = New-Object System.Windows.Forms.ToolTip
$ClearEvtListButtonToolTip = New-Object System.Windows.Forms.ToolTip
$LockedAccButtonToolTip = New-Object System.Windows.Forms.ToolTip
$UnlockLockedAccButtonToolTip = New-Object System.Windows.Forms.ToolTip
$FetchUserInfoButtonToolTip = New-Object System.Windows.Forms.ToolTip
$LockingDCInfoButtonToolTip = New-Object System.Windows.Forms.ToolTip
$LockingDCEvtButtonToolTip = New-Object System.Windows.Forms.ToolTip
$LockingCompMoreInfoButtonToolTip = New-Object System.Windows.Forms.ToolTip
$resetLockFormButtonToolTip = New-Object System.Windows.Forms.ToolTip
$checkLockButtonToolTip = New-Object System.Windows.Forms.ToolTip
$ExportGrpMemButtonToolTip = New-Object System.Windows.Forms.ToolTip

$NoExpPwToolTip.SetToolTip($neverExpPwButton, "Click if you want the password for this account to never expire.")
$DoesExpPwToolTip.SetToolTip($doesExpPwButton, "Click if you want the password for this account to expire as defined by the AD policy.")
$RemAccExpDateToolTip.SetToolTip($disableExpDateButton, "This will remove the account expiration date.")
$SetExpDateToolTip.SetToolTip($SetExpDateButton, "This will set the expiration date set below on the account.")
$enableAccToolTip.SetToolTip($enableAccButton, "Enable this account.")
$disableAccToolTip.SetToolTip($disableAccButton, "Disable this account.")
$unlockAccToolTip.SetToolTip($unlockAccButton, "Unlock this account.")
$exportToolTip.SetToolTip($ExportToFileButton, "Click to export the whole AD query results to a file.")
$changeUserPwToolTip.SetToolTip($changeUserPwButton, "This will change the account password to the values typed in the two fields below.")
$monthToolTip.SetToolTip($MonthNUD, "Month.")
$dayToolTip.SetToolTip($DayNUD, "Day.")
$yearToolTip.SetToolTip($YearNUD, "Year. The last two digits will do.")
$retrieveToolTip.SetToolTip($RetrieveUserInfoButton, "Query the ActiveDirectory for the given username and start working!")
$refreshToolTip.SetToolTip($RefreshButton, "Query the ActiveDirectory for the same user to refresh any values shown.")
$pwToolTip.SetToolTip($changePwTextBox1, "Type the new password for the account if needed. The two values have to be exactly identical and have to match your AD password security policy.")
$pwToolTip.SetToolTip($changePwTextBox2, "Type the new password for the account if needed. The two values have to be exactly identical and have to match your AD password security policy.")
$accDisplayNameVarToolTip.SetToolTip($accNameTextBox, "Enter the username of the account you wish to work on.")
$clearLogButtonToolTip.SetToolTip($clearLogButton, "Clear the log. Be careful as there is no confirmation prompt.")
$exportLogButtonToolTip.SetToolTip($exportLogButton, "Export the log to a CSV file readable in Excel or LibreOffice.")
$resetButtonToolTip.SetToolTip($resetButton,"Reset all the fields to query another account.")
$resetDCListToolTip.SetToolTip($ResetDCListButton,"Wipe the chart below listing all of the domain controllers.")
$retrieveDCListToolTip.SetToolTip($RetrieveDCListButton,"Get the list of domain controllers.")
$mstscButtonToolTip.SetToolTip($mstscButton,"Open the Remote Desktop Connection application to connect to the server.")
$dcdiagButtonToolTip.SetToolTip($dcdiagButton,"Start a dcdiag instance for the selected DC.")
$dcdiagRepButtonToolTip.SetToolTip($dcdiagRepButton,"Start a dcdiag instance to test the replications on the selected DC.")
$dcdiagDnsButtonToolTip.SetToolTip($dcdiagDnsButton,"Start a dcdiag instance to test the DNS on the selected DC.")
$ExportDCListToolTip.SetToolTip($ExportDCListButton,"Export the chart below as a CSV file to be opened in Excel or LibreOffice.")
$GetGrpButtonToolTip.SetToolTip($GetGrpButton,"Retrieve the ActiveDirectory groups based on the optional selected filter.")
$ClearGrpDGVButtonToolTip.SetToolTip($ClearGrpDGVButton,"Clear the chart below listing the AD groups to start a new search.")
$grpFilterTextBoxToolTip.SetToolTip($grpFilterTextBox,"Filter your AD query with a group name to only retrieve what you're looking for.")
$ExportGrpDGVButtonToolTip.SetToolTip($ExportGrpDGVButton,"Export the group list in the chart below to a CSV file.")
$ExportGrpInfoButtonToolTip.SetToolTip($ExportGrpInfoButton,"Export this group's information to a text file.") 
$GetCompButtonToolTip.SetToolTip($GetCompButton,"Retrieve the Computer objects based on the optional selected filter.")
$ClearCompDGVButtonToolTip.SetToolTip($ClearCompDGVButton,"Clear the chart below listing the computers and start a new query.")
$compFilterTextBoxToolTip.SetToolTip($compFilterTextBox,"Filter your AD query with a group name to only retrieve what you're looking for.")
$ExportCompDGVButtonToolTip.SetToolTip($ExportCompDGVButton,"Export the computer list in the chart below to a CSV file.")
$ExportCompInfoButtonToolTip.SetToolTip($ExportCompInfoButton,"Export this computer's information to a text file.") 
$pingDCButtonToolTip.SetToolTip($pingDCButton,"Start a ping request on the selected DC.")
$PingCompButtonToolTip.SetToolTip($PingCompButton,"Start a ping request on the computer.")
$RetrieveCompSpecsButtonToolTip.SetToolTip($RetrieveCompSpecsButton,"Get CPU, RAM, GPU and disk extra information for the selected computer using WMI.")
$mstscCompButtonToolTip.SetToolTip($mstscCompButton,"Open a RDP connection to this computer.")
$rebootCompButtonToolTip.SetToolTip($rebootCompButton,"Initiate a reboot with a 60-second timer on the selected computer.")
$gprCompButtonToolTip.SetToolTip($gprCompButton,"Start a gpresult query for this computer.")
$GrpMoreInfoButtonToolTip.SetToolTip($GrpMoreInfoButton,"Get information regarding this group.")
$GetGrpUserButtonToolTip.SetToolTip($GetGrpUserButton,"Retrieve the selected user information, switching to the Users tab.")
$retrieveDCListToolTip.SetToolTip($getDCListEVFButton,"Get the list of domain controllers.")
$EvtThresholdComboBoxToolTip.SetToolTip($evtThresholdComboBox,"Select how many entries you want the query to return. The more entries the longer to retrieve and process.")
$GetEventLogButtonToolTip.SetToolTip($getDCEventButton,"Click to retrieve only a part or the whole selected log. Keep in mind that requesting a lot of entries can take some time and application might look frozen.")
$ExportEvtListButtonToolTip.SetToolTip($exportEvtListButton,"Export the chart (including messages) with the current active filters to a CSV file.")
$ClearEvtListButtonToolTip.SetToolTip($clearEvtListButton,"Clear the chart and reset all filters to start a new query.")
$LockedAccButtonToolTip.SetToolTip($getLockedButton,"Query the ActiveDirectory to list all currently locked accounts.")
$UnlockLockedAccButtonToolTip.SetToolTip($UnlockFoundLockedAccButton,"Unlock this account.")
$FetchUserInfoButtonToolTip.SetToolTip($MoreInfoLockedAccButton,"Switch to the Users tab and display information for this account.")
$LockingDCInfoButtonToolTip.SetToolTip($LockingDCMoreInfoButton,"Switch to the DC tab and get information about the DC.")
$LockingDCEvtButtonToolTip.SetToolTip($LockingDCEvtButton,"Switch to the Event Viewer tab and pull out the events of the DC.")
$LockingCompMoreInfoButtonToolTip.SetToolTip($LockingCompMoreInfoButton,"Switch to the Computers tab and get information about the locking computer.")
$resetLockFormButtonToolTip.SetToolTip($resetLockFormButton,"Wipe out the Locked Account form and start a new query.")
$checkLockButtonToolTip.SetToolTip($checkLockButton,"Start analyzing your domain controllers to find when and where the account is locked. This can take up to a couple of minutes.")
$ExportGrpMemButtonToolTip.SetToolTip($ExportGrpMemButton,"Export the selected group member list to a CSV file.")
 
	#endregion
	
	#region SaveFileDialog
$fileExpl = New-Object System.Windows.Forms.SaveFileDialog
$fileExpl.ValidateNames = $true
$fileExpl.CreatePrompt = $false
$fileExpl.OverwritePrompt = $true
$fileExpl.RestoreDirectory = $false
$fileExpl.InitialDirectory = "$env:userprofile"
	#endregion
	
#endregion

	#region EventHandlers Home
	
$HomeUserButton.Add_Click({
	$mainTabCtl.SelectedTab = $consultTabPage
})

$HomeCompButton.Add_Click({
	$mainTabCtl.SelectedTab = $compTabPage
})

$HomeGrpButton.Add_Click({
	$mainTabCtl.SelectedTab = $groupTabPage
})

$HomeDCButton.Add_Click({
	$mainTabCtl.SelectedTab = $adTabPage
})

$HomeEvtButton.Add_Click({
	$mainTabCtl.SelectedTab = $eventvwrPage
})

$HomeLockButton.Add_Click({
	$mainTabCtl.SelectedTab = $lockPage
})

$HomeLogButton.Add_Click({
	$mainTabCtl.SelectedTab = $logTabPage
})
	
	#endregion

	#region EventHandlers User

$RefreshButton.Add_Click({
	refresh
	logthis("refresh")
})

$RetrieveUserInfoButton.Add_Click({
    $UserInfo = Get-ADUser -Identity $accNameTextBox.Text -Properties *
    Retrieveuser($UserInfo) 
	logthis("retrieve")
	$RefreshButton.Focus()
})

$ResetButton.Add_Click({
	$accNameTextBox.Text = $null
	Resetform
	logthis("wipe")
	$accNameTextBox.Focus()
})

$GroupComboBox.Add_SelectedIndexChanged({
$GrpMoreInfoButton.Enabled = $true
})

$GrpMoreInfoButton.Add_Click({
$GrpListDGV.Rows.Clear()
$GrpSelectDGV.Rows.Clear()
$GrpListComboBox.Items.Clear()
$mainTabCtl.SelectedTab = $groupTabPage
$GrpFilterComboBox.SelectedItem = $GrpFilterComboBox.Items[2]
$GrpFilterTextBox.Text = $GroupComboBox.Text
retrieveadgrp
$GrpListComboBox.SelectedItem = $GrpListComboBox.Items[0]
})

$ExportToFileButton.Add_Click({
	$UserInfo = Get-ADUser -Identity $accNameTextBox.Text -Properties *
	if ($?){
		$fileExpl.DefaultExt = "txt"
		$fileExpl.Filter = "Text Documents (*.txt)|*.txt"
		$fileExpl.Title = "Export user information to text file"
		$fileExpl.Filename = ""
		$fileExpl.ShowDialog()
		if ($fileExpl.Filename -ne "") {
			$UserInfo > $fileExpl.Filename
			$statusLabelVar.Text = "Exported user information to file "+$fileExpl.Filename+"."
			logthis("user")}
		else { $statusLabelVar.Text = "Aborted user information export." ; logthis("user") }
	}
	else {
		$statusLabelVar.Text = "Couldn't export file."
		logthis("user")}
})

$UnlockAccButton.Add_Click({
	Unlock-ADAccount $accNameTextBox.Text
	if ($?) {
		refresh
		$statusLabelVar.Text = "Successfully unlocked account."
		logthis("user")
	}
	else {
		$statusLabelVar.Text = "Failed to unlock account."
		logthis("user")
	}})

$EnableAccButton.Add_Click({
	Enable-ADAccount $accNameTextBox.Text
	if ($?) {
		refresh
		$statusLabelVar.Text = "Successfully enabled account."
		logthis("user")
	}
	else {
		$statusLabelVar.Text = "Failed to enable account."
		logthis("user")
	}
	})

$DisableAccButton.Add_Click({
	Disable-ADAccount $accNameTextBox.Text
	if ($?) {
		refresh
		$statusLabelVar.Text = "Successfully disabled account."
		logthis("user")
	}
	else {
		$statusLabelVar.Text = "Failed to disable account."
		logthis("user")
	}})

$changeUserPwButton.Add_Click({
	if($changePwTextBox1.Text -ne $changePwTextBox2.Text)
		{
		$statusLabelVar.Text = "Couldn't change password. Be sure to type the exact same passwords."
		logthis("user")
		}
	else
		{
		Set-ADAccountPassword -Identity $accNameTextBox.Text -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $changePwTextBox1.Text -Force)
		if ($?) {
		refresh
		$statusLabelVar.Text = "Changed user password."
		logthis("user")
		}
	else {
		$statusLabelVar.Text = "Failed to change password. Be sure to have the right to do so and that it matches the password complexity."
		logthis("user")
	}}})

$disableExpDateButton.Add_Click({
	Clear-ADAccountExpiration -Identity $accNameTextBox.Text
	if ($?) {
	refresh
	$statusLabelVar.Text = "Successfully cleared this account's expiration date."
	logthis("user")
	}
	else {
	$statusLabelVar.Text = "Failed to clear this account's expiration date."
	logthis("user")
	}
	})

$SetExpDateButton.Add_Click({
	$expDateValue = $MonthNUD.Value.ToString()+"/"+$DayNUD.Value.ToString()+"/20"+$YearNUD.Value.ToString()
	$expDateValue = [datetime]"$expDateValue"
	Set-ADAccountExpiration -Identity $accNameTextBox.Text -DateTime $expDateValue
	if ($?) {
	refresh
	$statusLabelVar.Text = "Successfully set this account's expiration date."
	logthis("user")
	}
	else{
	$statusLabelVar.Text = "Failed to set this account's expiration date."
	logthis("user")
	}
	})

$neverExpPwButton.Add_Click({
	Set-AdUser -Identity $accNameTextBox.Text -PasswordNeverExpires:$true
	if ($?) {
	refresh
	$statusLabelVar.Text = "The password for this account is set to never expire."
	logthis("user")
	}
	else {
	$statusLabelVar.Text = "Failed to switch on the 'never expire' flag."
	logthis("user")
	}
	})

$doesExpPwButton.Add_Click({
	Set-AdUser -Identity $accNameTextBox.Text -PasswordNeverExpires:$false
	if ($?) {
	refresh
	$statusLabelVar.Text = "The password for this account is set to expire according to the AD policy."
	logthis("user")
	}
	else {
	$statusLabelVar.Text = "Failed to switch off the 'never expire' flag."
	logthis("user")
	}
	})
	#endregion 
	
	#region EventHandlers Menu
	
$FileQuit.Add_Click({
	$mainForm.Close()
})

$DevBlog.Add_Click({
	[system.Diagnostics.Process]::start("https://blog.enguerrand.pro/lightweight-ad-toolbox")
	})

$DevWfr.Add_Click({
	[system.Diagnostics.Process]::start("http://www.enguerrand.pro")
	})

$DevWen.Add_Click({
	[system.Diagnostics.Process]::start("http://www.enguerrand.pro/index-en.html")
	})
	
$UpdateMenu.Add_Click({
	$AvailVerQuery = Invoke-WebRequest "http://blog.enguerrand.pro/lwadt/curver" | Select-Object -ExpandProperty RawContent
	if ($?) {
		$relindex = $AvailVerQuery.IndexOf("current:")
		$AvailVer = $AvailVerQuery.Substring($relindex+8,2)
		if ($AvailVer -eq $curver)
		{
			$UpdateMenu.Text = "Up to date."
			$UpdateMenu.ToolTipText = "Your release is the most up to date."
			$UpdateMenu.Enabled = $false
		}
		else
		{
			$UpdateMenu.Text = "New version available: $AvailVer"
			$UpdateMenu.ToolTipText = "A more recent version is available to download. You can find the link to the download in the Developer Links menu."
			$UpdateMenu.Enabled = $false
		}
	}
	else { $UpdateMenu.Text = "Unable to check for a new release." ; $UpdateMenu.Enabled = $false }
})

$FileChgLog.Add_Click({
	notepad.exe "lwadt-info.txt"
})

	
	#endregion 

	#region EventHandlers Log

$clearLogButton.Add_Click({
	$LogDGV.Rows.Clear()
	$statusLabelVar.Text = "Log successfully cleared."
	logthis("std")
	})

$exportLogButton.Add_Click({
	$CsvNameDump = Get-Date -Format "yyyyMMddHHmmss"
	$CsvFileDump = "log-export-$CsvNameDump.csv"
	$HeaderDump = "Timestamp,User,Status"
	Add-Content -Value $HeaderDump -Path $CsvFileDump
	if ($?){logtocsv}
	else
		{
		$statusLabelVar.Text = "Couldn't export the log to CSV."
		logthis("std")
		}
	})

	#endregion

	#region EventHandlers DC
	
$RetrieveDCListButton.Add_Click({ $tab = "dc" ; retrievedc })

$ResetDCListButton.Add_Click({ cleardclist })

$DCListComboBox.Add_SelectedIndexChanged({
	$selectedDC = $DCListComboBox.Text
	$DCRolesComboBox.Items.Clear()
	$DCRolesComboBox.Enabled = $true
	$DCinfo = Get-ADDomainController $selectedDC
	if ($?) {
		$DCIPV4LabelVar.Text = $DCinfo.IPv4Address
		$DCOSverLabelVar.Text = $DCinfo.OperatingSystem
		$DCSiteLabelVar.Text = $DCinfo.Site
		if ($DCInfo.OperationMasterRoles.Count -eq 0) { $DCRolesComboBox.Enabled = $false ; $DCRolesComboBox.Items.Add("None") ; $DCRolesComboBox.SelectedItem = $DCRolesComboBox.Items[0] }
		else {
			foreach ($role in $DCinfo.OperationMasterRoles){
				$DCRolesComboBox.Items.Add($role) }

		}
		$mstscButton.Enabled = $true
		$dcdiagButton.Enabled = $true
		$dcdiagDnsButton.Enabled = $true
		$dcdiagRepButton.Enabled = $true
		$pingDCButton.Enabled = $true
	$statusLabelVar.Text = "Retrieved $selectedDC domain controller information."
	logthis("std")
	}
	else { $statusLabelVar.Text = "Couldn't retrieve ActiveDirectory information." ; logthis("std") }
})

$pingDCButton.Add_Click({
    $DC = $DCListComboBox.Text
	$statusLabelVar.Text = "Started a ping test on $DC."
	logthis("std")
    Start-Process "$env:windir\system32\cmd.exe" -ArgumentList "/k ping $DC -t"
})
	
$mstscButton.Add_Click({
	$rdpServ = $DCListComboBox.Text
	$statusLabelVar.Text = "Started mstsc.exe for $rdpserv."
	logthis("std")
	Start-Process "$env:windir\system32\mstsc.exe" -ArgumentList "/v:$rdpServ"
	})

$dcdiagButton.Add_Click({
	$rdpServ = $DCListComboBox.Text
	$statusLabelVar.Text = "Started a dcdiag test on $rdpserv."
	logthis("std")
	Start-Process "$env:windir\system32\cmd.exe" -ArgumentList "/k dcdiag.exe -s:$rdpServ"
	})

$dcdiagRepButton.Add_Click({
	$rdpServ = $DCListComboBox.Text
	$statusLabelVar.Text = "Started a dcdiag replication test on $rdpserv."
	logthis("std")
	Start-Process "$env:windir\system32\cmd.exe" -ArgumentList "/k dcdiag.exe /test:replications -s:$rdpServ"
	})

$dcdiagDnsButton.Add_Click({
	$rdpServ = $DCListComboBox.Text
	$statusLabelVar.Text = "Started a dcdiag DNS test on $rdpserv."
	logthis("std")
	Start-Process "$env:windir\system32\cmd.exe" -ArgumentList "/k dcdiag.exe /test:dns -s:$rdpServ"
	})

$ExportDCListButton.Add_Click({
	$CsvNameDump = Get-Date -Format "yyyyMMddHHmmss"
	$CsvFileDump = "$env:temp\dclist-export-$CsvNameDump.tmp"
	$HeaderDump = "Hostname,IPV4,Distinguished Name"
	Add-Content -Value $HeaderDump -Path $CsvFileDump
	if ($?){dctocsv}
	else
		{
		$statusLabelVar.Text = "Couldn't export the domain controller list to CSV."
		logthis("std")
		}
	})
	#endregion
	
	#region EventHandlers Group
	
$GetGrpButton.Add_Click({ retrieveadgrp })

$ClearGrpDGVButton.Add_Click({
	$GetGrpButton.Enabled = $true
	$ClearGrpDGVButton.Enabled = $false
	$GrpListComboBox.Enabled = $false
	$ExportGrpInfoButton.Enabled = $false
	$grpFilterTextBox.Enabled = $true
	$grpFilterComboBox.Enabled = $true
	$GrpListDGV.Rows.Clear()
	$GrpListComboBox.Items.Clear()
	$GrpSelectDGV.Rows.Clear()
	$grpFilterTextBox.Text = $null
	$ExportGrpDGVButton.Enabled = $false
	$GetGrpUserButton.Enabled = $false
	$ExportGrpMemButton.Enabled = $false
	$statusLabelVar.Text = "Group list wiped."
	logthis("std")
})

$ExportGrpDGVButton.Add_Click({
	$CsvNameDump = Get-Date -Format "yyyyMMddHHmmss"
	$CsvFileDump = "$env:temp\grouplist-export-$CsvNameDump.csv"
	$HeaderDump = "Group ID,Group Name,Distinguished Name"
	Add-Content -Value $HeaderDump -Path $CsvFileDump
	if ($?){grptocsv}
	else
		{
		$statusLabelVar.Text = "Couldn't export the group list to CSV."
		logthis("std")
		}
})

$ExportGrpMemButton.Add_Click({
	$CsvNameDump = Get-Date -Format "yyyyMMddHHmmss"
	$CsvFileDump = "$env:temp\memberlist-export-$CsvNameDump.csv"
	$HeaderDump = "UserID,User Name,Distinguished Name"
	Add-Content -Value $HeaderDump -Path $CsvFileDump
	if ($?){grpmembertocsv}
	else
		{
		$statusLabelVar.Text = "Couldn't export the member list to CSV."
		logthis("std")
		}
})

$GrpListComboBox.Add_SelectedIndexChanged({
	$selectedgrp = $GrpListComboBox.Text
	$GrpSelectDGV.Rows.Clear()
	$ExportGrpInfoButton.Enabled = $true
	$GetGrpUserButton.Enabled = $true
	$ExportGrpMemButton.Enabled = $true
	$GrpInfo = Get-ADgroup $selectedgrp -Properties *
	if ($?){ 
		foreach ($GrpMember in $GrpInfo.Member)
		{
			$UserOrGrp = Get-ADObject $GrpMember | select ObjectClass
			if ($UserOrGrp.ObjectClass -eq 'user'){
				$MemberInfo = Get-ADUser $GrpMember
				$MemberName = $MemberInfo.GivenName+" "+$MemberInfo.Surname
				$GrpSelectDGV.Rows.Add($MemberInfo.samAccountName,$MemberName,$MemberInfo.DistinguishedName)
			}
		}
	$statusLabelVar.Text = "Retrieved $selectedgrp group information."
	logthis("std")
	}
	else { $statusLabelVar.Text = "Couldn't retrieve group information." ; logthis("std") }
})

$ExportGrpInfoButton.Add_Click({
	$GrpInfo = Get-ADgroup $GrpListComboBox.Text -Properties *
	if ($?) {
		$fileExpl.DefaultExt = "txt"
		$fileExpl.Filter = "Text Documents (*.txt)|*.txt"
		$fileExpl.Title = "Export group information to text file"
		$fileExpl.Filename = ""
		$fileExpl.ShowDialog()
		if ($fileExpl.Filename -ne "") {
		$GrpInfo > $fileExpl.Filename
		$statusLabelVar.Text = "Exported group information to file "+$fileExpl.Filename+"."
		logthis("std") }
		else { $statusLabelVar.Text = "Aborted group information export." ; logthis("std") }
	}
	else { $statusLabelVar.Text = "Couldn't export group information." ; logthis("std") }
})

$GrpFilterComboBox.Add_SelectedIndexChanged({
	$GrpFilterTextBox.Text = ""
	if ($GrpFilterComboBox.Text -eq "No Filter") { 
		$GrpFilterTextBox.Text = ""
		$GetGrpButton.Enabled = $true
		$GrpFilterTextBox.Enabled = $false }
	else { $GrpFilterTextBox.Enabled = $true ; $GetGrpButton.Enabled = $false }
})

$GrpFilterTextBox.Add_TextChanged({
	if ($GrpFilterTextBox.Text -eq ""){ $GetGrpButton.Enabled = $false }
	else { $GetGrpButton.Enabled = $true }
})

$GetGrpUserButton.Add_Click({
	$SelectedUserIndex = $GrpSelectDGV.SelectedCells.RowIndex
	$SelectedUserSAM = $GrpSelectDGV[0,$SelectedUserIndex].Value
	resetform
	$accNameTextBox.Text = $SelectedUserSAM
	$UserInfo = Get-ADUser -Identity $accNameTextBox.Text -Properties *
    Retrieveuser($UserInfo) 
	logthis("retrieve")
	$mainTabCtl.SelectedTab = $consultTabPage
})

	#endregion

	#region EventHandlers Computer
	
$GetCompButton.Add_Click({ retrievecomp })

$ClearCompDGVButton.Add_Click({ clearcompform })

$ExportCompDGVButton.Add_Click({
	$CsvNameDump = Get-Date -Format "yyyyMMddHHmmss"
	$CsvFileDump = "$env:temp\computerlist-export-$CsvNameDump.csv"
	$HeaderDump = "Hostname,IP Address,Distinguished Name"
	Add-Content -Value $HeaderDump -Path $CsvFileDump
	if ($?){comptocsv}
	else
		{
		$statusLabelVar.Text = "Couldn't export the computer list to CSV."
		logthis("std")
		}
})

$ExportCompInfoButton.Add_Click({
	$filter = $CompListComboBox.Text
	$adQuery = "Get-ADComputer -filter 'DNSHostName -like ""$filter""' -Properties *"
	$CompInfo = Invoke-Expression $adQuery
	if ($?){
		$fileExpl.DefaultExt = "txt"
		$fileExpl.Filter = "Text Documents (*.txt)|*.txt"
		$fileExpl.Title = "Export computer information to text file"
		$fileExpl.Filename = ""
		$fileExpl.ShowDialog()
		if ($fileExpl.Filename -ne "") {
			$CompInfo > $fileExpl.Filename
			$statusLabelVar.Text = "Exported computer "+$CompListComboBox.Text+" information to file "+$fileExpl.Filename+"."
			logthis("std")}
		else { $statusLabelVar.Text = "Aborted computer information export." ; logthis("std") }
	}
	else {
		$statusLabelVar.Text = "Couldn't export file."
		logthis("std")}	
})

$CompListComboBox.Add_SelectedIndexChanged({
    $selectedComp = $CompListComboBox.Text
	$CompGrpMbrComboBox.Items.Clear()
	$ExportCompInfoButton.Enabled = $true
    $PingCompButton.Enabled = $true
    $RetrieveCompSpecsButton.Enabled = $true
    $mstscCompButton.Enabled = $true
    $rebootCompButton.Enabled = $true
    $gprCompButton.Enabled = $true
    $filter = $CompListComboBox.Text
	$adQuery = "Get-ADComputer -filter 'DNSHostName -like ""$filter""' -Properties *"
	$CompInfo = Invoke-Expression $adQuery
	if ($?) {
		$CompOSLabelVar.Text = $CompInfo.OperatingSystem+", "+$CompInfo.OperatingSystemVersion
		$CompIPV4LabelVar.Text = $CompInfo.IPV4Address
		foreach ($Membership in $CompInfo.MemberOf){
			$MbrNameCutIndex = $Membership.ToString().IndexOf(",OU=")
			if ($GrpNameCutIndex -eq -1) { $MbrNameCutIndex = $Membership.ToString().IndexOf(",CN=") }
			$MbrGrpName = $Membership.ToString().Substring(3,$MbrNameCutIndex-3)
			$CompGrpMbrComboBox.Items.Add($MbrGrpName)
		}
	$statusLabelVar.Text = "Retrieved $filter computer information."
	logthis("std")
	}
	else { $statusLabelVar.Text = "Couldn't retrieve computer information." ; logthis("std") }
})

$PingCompButton.Add_Click({
    $comp = $CompListComboBox.Text
	$statusLabelVar.Text = "Started a ping test on $comp."
	logthis("std")
    Start-Process "$env:windir\system32\cmd.exe" -ArgumentList "/k ping $comp -t"
})

$RetrieveCompSpecsButton.Add_Click({
$comp = $CompListComboBox.Text
$compDetailsTextBox.Text = $null
$CPU = Get-WmiObject win32_Processor -ComputerName $comp
if ($?) {
	$GPU = Get-WmiObject win32_videocontroller -ComputerName $comp 
	$Disk = Get-WmiObject win32_LogicalDisk -ComputerName $comp
	$Mem = Get-WmiObject win32_PhysicalMemory -ComputerName $comp
	foreach ($uniquecpu in $CPU){
		$cpuname = $uniqueCPU.Name
		$cpustring = "CPU: "+"$cpuname`r`n"
		$specString = "$specString"+"$cpustring"
		}
	foreach ($uniqueram in $Mem){
		$ramindex = $uniqueram.Tag
		$ramsize = [math]::Round($uniqueram.Capacity/1073741824,0)
		$ramString = "RAM: "+"$ramindex"+", "+"$ramsize GB`r`n"
		$specString = "$specString"+"$ramString"
		}
	foreach ($uniquegpu in $GPU) {
		$gpuname = $uniqueGPU.Name
		$gpuram = $uniqueGPU.AdapterRAM/1048576
		$gpuNstring = "GPU: "+"$gpuname`r`n"
		$gpuMstring = "Memory in MB: "+"$gpuram`r`n"
		$specString = "$specString"+"$gpuNstring"+"$gpuMstring"
		}
	foreach ($uniquedisk in $Disk) {
		$diskletter = $uniquedisk.DeviceID
		$diskname = $uniquedisk.VolumeName
		$diskfs = [math]::Round($uniquedisk.FreeSpace/1073741824,1)
		$diskmax = [math]::Round($uniquedisk.Size/1073741824,1)
		if ($diskmax -eq 0) { $diskfree = "?" } else { $diskfree = [math]::Round(($diskfs/$diskmax)*100,1) }
		$diskstring = "Disk: "+"$diskletter"+", "+"$diskname`r`n"
		$diskstring = "$diskstring"+"Free Space (GB): "+$diskfs+", "+"Capacity (GB): "+,$diskmax+", "+"$diskfree % Free`r`n"
		$specString = "$specString"+"$diskstring"
		}
	$compDetailsTextBox.Text = $specString
	$statusLabelVar.Text = "Retrieved $comp specs."
	logthis("std")
	}
else { $statusLabelVar.Text = "Failed to query $comp. Make sure WMI is enabled and the computer online." 
	logthis("std")
	}
})

$mstscCompButton.Add_Click({
    $comp = $CompListComboBox.Text
	$statusLabelVar.Text = "Started mstsc.exe for $comp."
	logthis("std")
	Start-Process "$env:windir\system32\mstsc.exe" -ArgumentList "/v:$comp"
})

$rebootCompButton.Add_Click({
    $comp = $CompListComboBox.Text
    $statusLabelVar.Text = "Started a shutdown.exe reboot process with a 60-second timer on $comp."
    logthis("std")
    Start-Process "$env:windir\system32\shutdown.exe" -ArgumentList "/r /t 60 /m \\$comp"
})

$gprCompButton.Add_Click({
	$comp = $CompListComboBox.Text
	$htmlpath = "$env:temp\gpreport.html"
	Start-Process "$env:windir\system32\gpresult.exe" -ArgumentList "/s $comp /scope COMPUTER /h $htmlpath /f"
	while ((Get-Process gpresult).id -ne $null)
	{
		Start-Sleep -Seconds 1
	}
	clear
	[system.Diagnostics.Process]::start("$htmlpath")
	$statusLabelVar.Text = "Started a gpresult query on $comp."
	logthis("std")
})

$CompFilterComboBox.Add_SelectedIndexChanged({
	$CompFilterTextBox.Text = ""
	if ($CompFilterComboBox.Text -eq "No Filter") { 
		$CompFilterTextBox.Text = ""
		$GetCompButton.Enabled = $true
		$CompFilterTextBox.Enabled = $false }
	else { $CompFilterTextBox.Enabled = $true ; $GetCompButton.Enabled = $false }
})

$CompFilterTextBox.Add_TextChanged({
	if ($CompFilterTextBox.Text -eq ""){ $GetCompButton.Enabled = $false }
	else { $GetCompButton.Enabled = $true }
})

	#endregion
	
	#region EventHandlers EventViewer

$getDCListEVFButton.Add_Click({ getdclistevent })

$dcListEVFComboBox.Add_SelectedIndexChanged({
	$eventTypeComboBox.Enabled = $true
	$evtThresholdComboBox.Enabled = $true
    $getDCEventButton.Enabled = $true
})

$getDCEventButton.Add_Click({ getdcevent })
	
$EventListDGV.Add_SelectionChanged({
	$evtMsgTextBox.Text = $EventListDGV[5,$EventListDGV.SelectedCells.RowIndex].Value
})	

$EvtInfoCheck.Add_CheckedChanged({ evtfilter("info") ; evtdatetimefilter })

$EvtWarCheck.Add_CheckedChanged({ evtfilter("warn") ; evtdatetimefilter })

$EvtCritCheck.Add_CheckedChanged({ evtfilter("crit") ; evtdatetimefilter })

$EvtErrCheck.Add_CheckedChanged({ evtfilter("error") ; evtdatetimefilter })

$EvtIDCheck.Add_CheckedChanged({ 
	if ($EvtIDCheck.Checked -eq $true) {
		$EvtCritCheck.Enabled = $false
		$EvtErrCheck.Enabled = $false
		$EvtInfoCheck.Enabled = $false
		$EvtWarCheck.Enabled = $false
		$EvtDateCheck.Enabled = $false
		$EvtCritCheck.Checked = $true
		$EvtErrCheck.Checked = $true 
		$EvtInfoCheck.Checked = $true
		$EvtWarCheck.Checked = $true
		$EvtDateCheck.Checked = $false
		$evtIDfilterTextBox.Enabled = $true
		
}
	else {
		$EvtCritCheck.Enabled = $true
		$EvtErrCheck.Enabled = $true
		$EvtInfoCheck.Enabled = $true
		$EvtWarCheck.Enabled = $true
		$EvtDateCheck.Enabled = $true
		$EvtCritCheck.Checked = $true
		$EvtErrCheck.Checked = $true 
		$EvtInfoCheck.Checked = $true
		$EvtWarCheck.Checked = $true
		$EvtDateCheck.Checked = $false
        $evtIDfilterTextBox.Text = ""
		$evtIDfilterTextBox.Enabled = $false }

})

$EvtDateCheck.Add_CheckedChanged({ 
	if ($EvtDateCheck.Checked -eq $false) {
		$EvtAfterDateTimePick.Enabled = $false
		$EvtBeforeDateTimePick.Enabled = $false
		$EvtIDCheck.Enabled = $true
		$EvtIDCheck.Checked = $false
		evtfilterall
	}
	else { 
		$EvtAfterDateTimePick.Enabled = $true
		$EvtBeforeDateTimePick.Enabled = $true
		$EvtIDCheck.Enabled = $false
		$EvtIDCheck.Checked = $false
		evtdatetimefilter 
	}
})

$EvtAfterDateTimePick.Add_ValueChanged({ evtdatetimefilter })
$EvtBeforeDateTimePick.Add_ValueChanged({ evtdatetimefilter })

$exportEvtListButton.Add_Click({
	$CsvNameDump = Get-Date -Format "yyyyMMddHHmmss"
	$CsvFileDump = "$env:temp\computerlist-export-$CsvNameDump.csv"
	$HeaderDump = "Entry;Level;Timestamp;Source;EventID;Message"
	Add-Content -Value $HeaderDump -Path $CsvFileDump
	if ($?){evtlisttocsv}
	else
		{
		$statusLabelVar.Text = "Couldn't export the event list to CSV."
		logthis("std")
		}
})

$clearEvtListButton.Add_Click({ clearevtlist })

$evtIDfilterTextBox.Add_TextChanged({ 
	if ($evtIDfilterTextBox.Text -eq "") {
        foreach ($Row in $EventListDGV.Rows) {
            $Row.Visible = $true }
        }
    else {
	    foreach ($Row in $EventListDGV.Rows) {
				    if ($Row.Cells[4].Value -ne $evtIDfilterTextBox.Text) { $Row.Visible = $false }
				    else { $Row.Visible = $true }
			}
        }
 })
	
	#endregion
	
	#region EventHandlers LockAcc
$getLockedButton.Add_Click({
	$lockedOutList = Search-ADAccount -LockedOut -UsersOnly
	if ($?) {
		if ($lockedOutList -eq $null) { $statusLabelVar.Text = "There are currently no locked user accounts on the domain." ; logthis("std") }
		else {
			foreach ($Account in $lockedOutList) {
				$lockAccListComboBox.Items.Add($Account.samAccountName) }
			$statusLabelVar.Text = "Successfully retrieved the list of currently locked user accounts."
			logthis("std")
			$lockAccListComboBox.Enabled = $true
			$getLockedButton.Enabled = $false
		}
	}
	else { $statusLabelVar.Text = "" ; logthis("std") }
})

$resetLockFormButton.Add_Click({
	$LockedAccNameLabel.Text = "Account ID: "
	$lockingCompLabel.Text = "Computer locking the account: "
	$lockAccListComboBox.Enabled = $false
	$lockAccListComboBox.Items.Clear()
	$LockInfoDGV.Rows.Clear()
	$getLockedButton.Enabled = $true
	$resetLockFormButton.Enabled = $false
	$UnlockFoundLockedAccButton.Enabled = $false
	$MoreInfoLockedAccButton.Enabled = $false
	$LockingCompMoreInfoButton.Enabled = $false
	$LockingDCEvtButton.Enabled = $false
	$LockingDCMoreInfoButton.Enabled = $false
	$checkLockButton.Enabled = $false
	$statusLabelVar.Text = "Cleared the locked account tab."
	logthis("std")
})

$lockAccListComboBox.Add_SelectedIndexChanged({
	$checkLockButton.Enabled = $true
	$resetLockFormButton.Enabled = $true
})

$checkLockButton.Add_Click({
	$UserStatus = Get-ADUser -Identity $lockAccListComboBox.Text -Properties LockedOut
	if ($UserStatus.LockedOut -eq $true) {
		$AccountName = $lockAccListComboBox.Text
		$lockAccListComboBox.Enabled = $false
		$LockInfoDGV.Rows.Clear()
		$LockedAccNameLabel.Text = "Account ID: "
		$lockingCompLabel.Text = "Computer locking the account: "
		$LockedAccNameLabel.Text = $LockedAccNameLabel.Text+$AccountName
		$DCList = Get-ADDomainController -Filter *
		$foundit = $false
		if ($?) {
			Foreach ($DC in $DCList) {
				$UserDump = Get-ADUser -Identity $lockAccListComboBox.Text -Server $DC.Hostname -Properties LastBadPasswordAttempt,badPwdCount,AccountLockoutTime
				if ($UserDump.LastBadPasswordAttempt -ne $null) {
					$LockInfoDGV.Rows.Insert(0,$DC.Hostname,$UserDump.badPwdCount,$UserDump.LastBadPasswordAttempt,$UserDump.AccountLockoutTime)
				}
			}
			$ClosestTimeStamp = '01/01/1970'
			Foreach ($Row in $LockInfoDGV.Rows){
				$FortySevenForty = Get-WinEvent -ComputerName $Row.Cells[0].Value -FilterHashtable @{LogName='Security';Id=4740}
				if ($?) {
					Foreach ($Event in $FortySevenForty) {
						$LockTimeStamp = $Event.TimeCreated
						if ($Event.Properties[2].Value -eq $UserDump.SID.Value -and $LockTimeStamp -gt $ClosestTimeStamp) { 
							$lockingCompLabel.Text = $lockingCompLabel.Text+$Event.Properties[1].Value
							$ClosestTimeStamp = $LockTimeStamp }
					}
				}
			}
			$statusLabelVar.Text = "Successfully identified locked "+$UserDump.samAccountName+" account and found related information."
			logthis("std")
			$checkLockButton.Enabled = $false
			$UnlockFoundLockedAccButton.Enabled = $true
			$MoreInfoLockedAccButton.Enabled = $true
			$LockingCompMoreInfoButton.Enabled = $true
			$LockingDCEvtButton.Enabled = $true
			$LockingDCMoreInfoButton.Enabled = $true
			}
		else {
			$statusLabelVar.Text = "Failed to retrieve all domain controllers to query for account lockouts."
			logthis("std")
		}
	}
	else { $statusLabelVar.Text = "This account is no longer locked." }
})

$UnlockFoundLockedAccButton.Add_Click({
	Unlock-ADAccount $lockAccListComboBox.Text
	if ($?) {
		$statusLabelVar.Text = "Successfully unlocked "+$lockAccListComboBox.Text+" account."
		logthis("std")
		$UnlockFoundLockedAccButton.Enabled = $false
	}
	else {
		$statusLabelVar.Text = "Failed to unlock"+$lockAccListComboBox.Text+" account."
		logthis("std")
	}
})

$MoreInfoLockedAccButton.Add_Click({
	$UserSAM = $lockAccListComboBox.Text
	resetform
	$accNameTextBox.Text = $UserSAM
	$UserInfo = Get-ADUser -Identity $accNameTextBox.Text -Properties *
    Retrieveuser($UserInfo) 
	logthis("retrieve")
	$mainTabCtl.SelectedTab = $consultTabPage
})

$LockingDCMoreInfoButton.Add_Click({
	cleardclist
	$tab = "dc"
	retrievedc
	$mainTabCtl.SelectedTab = $adTabPage
})

$LockingDCEvtButton.Add_Click({
	clearevtlist
	getdclistevent
	$dcListEVFComboBox.SelectedItem = $dcListEVFComboBox.Items[0]
	$eventTypeComboBox.SelectedItem = $eventTypeComboBox.Items[1]
	$evtThresholdComboBox.SelectedItem = $evtThresholdComboBox.Items[0]
	getdcevent
	$mainTabCtl.SelectedTab = $eventvwrPage
})

$LockingCompMoreInfoButton.Add_Click({
	clearcompform
	$CompFilterComboBox.SelectedItem = $CompFilterComboBox.Items[1]
	$lockingCompLength = $lockingCompLabel.Text.Length - 30
	$lockingComp = $lockingCompLabel.Text.Substring(30,$lockingCompLength)
	$CompFilterTextBox.Text = $lockingComp
	retrievecomp
	$mainTabCtl.SelectedTab = $compTabPage
})

	#endregion

	#region Functions 
function resetform{
	$UserInfo = $null
	$UserGroups = $null

	$accNameLabelVar.Text = $null
	$accDisplayNameVar.Text = $null
	$lastlogonDateVar.Text = $null
	$distinguishedNameVar.Text = $null
	$lastwrongpwVar.Text = $null
	$whencreatedVar.Text = $null
	$lastSetpwVar.Text = $null
	$changePwTextBox1.Text = $null
	$changePwTextBox2.Text = $null
	$GroupComboBox.Items.Clear()
	$lockedBoolCheck.Checked = $false
	$enabledBoolCheck.Checked = $false
	$pwNeverExpBoolCheck.Checked = $false
	$pwExpiredBoolCheck.Checked = $false
	$accNameTextBox.Enabled = $true
	$GroupComboBox.Enabled = $false
	$ExportToFileButton.Enabled = $false
	$RetrieveUserInfoButton.Enabled = $true
	$UnlockAccButton.Enabled = $false
	$DisableAccButton.Enabled = $false
	$EnableAccButton.Enabled = $false
	$RefreshButton.Enabled = $false
	$SetExpDateButton.Enabled = $false
	$GrpMoreInfoButton.Enabled = $false
	$DayNUD.Enabled = $false
	$MonthNUD.Enabled = $false
	$YearNUD.Enabled = $false
	$disableExpDateButton.Enabled = $false
	$neverExpPwButton.Enabled = $false
	$doesExpPwButton.Enabled = $false
	$changeUserPwButton.Enabled = $false
	$changePwTextBox1.Enabled = $false
	$changePwTextBox2.Enabled = $false

	$accExpDateVar.Text = "Not Set"
	$statusLabelVar.Text = "Ready."
}

function retrieveuser{
	param($user)
	if ($user -ne $null)
			{
			$accNameLabelVar.Text = $user.samAccountName
			$accDisplayNameVar.Text = $user.DisplayName
			$accNameTextBox.Enabled = $false
			$lastlogonDateVar.Text = $user.lastLogonDate
			$distinguishedNameVar.Text = $user.DistinguishedName
			$lastwrongpwVar.Text = $user.lastBadPasswordAttempt
			$whenCreatedVar.Text = $user.CreateTimeStamp
			$lastSetpwVar.Text = $user.PasswordLastSet
			$statusLabelVar.Text = "User found!"
		
			$GroupComboBox.Enabled = $true
			$SetExpDateButton.Enabled = $true
			$ExportToFileButton.Enabled = $true
			$retrieveUserInfoButton.Enabled = $false
			$refreshButton.Enabled = $true
			$DayNUD.Enabled = $true
			$MonthNUD.Enabled = $true
			$YearNUD.Enabled = $true
			
			$changeUserPwButton.Enabled = $true
			$changePwTextBox1.Enabled = $true
			$changePwTextBox2.Enabled = $true
	   
			$UserGroups = $user | select MemberOf
			$UserGroups = $UserGroups.MemberOf
			foreach($grp in $UserGroups)
			{
				$GrpNameCutIndex = $grp.ToString().IndexOf(",OU=")
				if ($GrpNameCutIndex -eq -1) { $GrpNameCutIndex = $grp.ToString().IndexOf(",CN=") }
				$ProperGrpName = $grp.ToString().Substring(3,$GrpNameCutIndex-3)
				$GroupComboBox.Items.Add($ProperGrpName)
				}

			if($user.LockedOut -eq "True")
			{
			$lockedBoolCheck.Checked = $true
			$UnlockAccButton.Enabled = $true
			}
			if($user.Enabled -eq "True")
			{
				$enabledBoolCheck.Checked = $true
				$enableAccButton.Enabled = $false
				$disableAccButton.Enabled = $true
				}
			else {
				$enabledBoolCheck.Checked = $false
				$enableAccButton.Enabled = $true
				$disableAccButton.Enabled = $false
				}
			if($user.PasswordNeverExpires -eq "True")
			{
				$pwNeverExpBoolCheck.Checked = $true
				$doesExpPwButton.Enabled = $true
			}
			else {
				$neverExpPwButton.Enabled = $true
			}
			if($user.PasswordExpired -eq "True")
			{
				$pwExpiredBoolCheck.Checked = $true
				$neverExpPwButton.Enabled = $true
			}
			if($user.AccountExpirationDate -ne $null)
			{
				$accExpDateVar.Text = $user.AccountExpirationDate
				$disableExpDateButton.Enabled = $true
			}
			}
		else {$statusLabelVar.Text = "User not found!"}    
	}

function retrieveadgrp{
if ($grpFilterTextBox.Text -eq "") { $typeQuery = "grp" ; $adQuery = "Get-ADgroup -filter * -properties samAccountName,Name,DistinguishedName" }
	if ($grpFilterComboBox.Text -eq "Filter by Name:") {
		$filter = $grpFilterTextBox.Text
		$filtertype = "name"
		$typeQuery = "grp"
		$adQuery = "Get-ADgroup -filter 'Name -like ""$filter""' -properties samAccountName,Name,DistinguishedName" }
	if ($grpFilterComboBox.Text -eq "Filter by ID:") {
		$filter = $grpFilterTextBox.Text
		$filtertype = "ID"
		$typeQuery = "grp"
		$adQuery = "Get-ADgroup -filter 'samAccountName -like ""$filter""' -properties samAccountName,Name,DistinguishedName" }
	if ($grpFilterComboBox.Text -eq "Filter by User:") {
		$filter = $grpFilterTextBox.Text
		$filtertype = "user"
		$typeQuery = "usr"
		$adQuery = "Get-ADuser $filter -properties MemberOf | select -ExpandProperty MemberOf" }
	$GroupListArray = Invoke-Expression $adQuery
		if ($?) {
			if ($typeQuery -eq "grp") {
				foreach ($Grp in $GroupListArray)
				{
					$GrpListDGV.Rows.Add($Grp.samAccountName,$Grp.Name,$Grp.DistinguishedName)
				}
			}
			if ($typeQuery -eq "usr") {
				foreach ($Grp in $GroupListArray) {
					$GrpQuery = "Get-ADgroup -identity ""$Grp"" -properties samAccountName,Name,DistinguishedName"
					$GrpDump = Invoke-Expression $GrpQuery
					$GrpListDGV.Rows.Add($GrpDump.samAccountName,$GrpDump.Name,$GrpDump.DistinguishedName)
				}
			}
			$statusLabelVar.Text = "Successfully retrieved AD groups."
			$ClearGrpDGVButton.Enabled = $true
			$GetGrpButton.Enabled = $false
			if ($grpFilterTextBox.Text -eq "") { logthis ("retrievenofilter") }
			else { $type = "groups"; logthis("retrievefilter") }
			$grpFilterTextBox.Enabled = $false
			$GrpListComboBox.Enabled = $true
			$GrpFilterComboBox.Enabled = $false
			$ExportGrpDGVButton.Enabled = $true
			foreach ($GrpRow in $GrpListDGV.Rows)
				{
				if ($GrpRow.Cells[1].Value -ne $null) {
				$GrpListComboBox.Items.Add($GrpRow.Cells[1].Value) }
				}	
		}
		else {
			$statusLabelVar.Text = "Couldn't list the AD groups."
			logthis("std")
			}
}			

function retrievecomp{
if ($compFilterTextBox.Text -eq "") { $adQuery = "Get-ADComputer -filter * -properties DNSHostName,IPv4Address,DistinguishedName" }
	if ($compFilterComboBox.Text -eq "Filter by Name:") { 
		$filter = $compFilterTextBox.Text
		$filtertype = "name"
		$adQuery = "Get-ADComputer -filter 'Name -like ""$filter""' -properties DNSHostName,IPv4Address,DistinguishedName" }
	if ($CompFilterComboBox.Text -eq "Filter by OS:") {	
		$filter = $compFilterTextBox.Text
		$filtertype = "OS"
		$adQuery = "Get-ADComputer -filter 'OperatingSystem -like ""$filter""' -properties DNSHostName,IPv4Address,DistinguishedName" }
	$CompListArray = Invoke-Expression $adQuery
		if ($?) {
			foreach ($Comp in $CompListArray)
			{
				$CompListDGV.Rows.Add($Comp.DNSHostName,$Comp.IPV4Address,$Comp.DistinguishedName)
			}
			$statusLabelVar.Text = "Successfully retrieved computers."
			$ClearCompDGVButton.Enabled = $true
			$GetCompButton.Enabled = $false
            if ($compFilterTextBox.Text -eq "") { logthis ("retrievenofilter") }
            else { $type = "computers"; logthis("retrievefilter") }
			$CompFilterTextBox.Enabled = $false
			$CompFilterComboBox.Enabled = $false
			$CompListComboBox.Enabled = $true
            $CompGrpMbrComboBox.Enabled = $true
            $ExportCompDGVButton.Enabled = $true
			foreach ($CompRow in $CompListDGV.Rows)
			{
				if ($CompRow.Cells[0].Value -ne $null) {
				$CompListComboBox.Items.Add($CompRow.Cells[0].Value) }
			}
			$GetCompButton.Text = "Retrieve computers"
			}
		else {
			logthis("std")
			}
}

function retrievedc{
	$DCListArray = (Get-ADForest).Domains | %{ Get-ADDomainController -Filter * -Server $_ }
	if ($?) {
		if ($tab -eq "dc") {
			foreach ($DC in $DCListArray)
			{
				$DCListDGV.Rows.Add($DC.Hostname,$DC.IPv4Address,$DC.ComputerObjectDN)
			}
			$statusLabelVar.Text = "Successfully retrieved domain controllers from the forest."
			logthis("std")
			$RetrieveDCListButton.Enabled = $false
			$ResetDCListButton.Enabled = $true
			$ExportDCListButton.Enabled = $true
			foreach ($DCRow in $DCListDGV.Rows)
			{
				if ($DCRow.Cells[0].Value -ne $null) {
				$DCListComboBox.Items.Add($DCRow.Cells[0].Value) }
			}
			$DCListComboBox.Enabled = $true }
			
		if ($tab -eq "event") {
			$getDCListEVFButton.Enabled = $false
			foreach ($DC in $DCListArray) { $dcListEVFComboBox.Items.Add($DC.Hostname) }
			$statusLabelVar.Text = "Successfully retrieved domain controllers from the forest."
			logthis("std")
			$dcListEVFComboBox.Enabled = $true }
	}
	else {
		$statusLabelVar.Text = "Couldn't fetch the domain controllers from the forest."
		logthis("std")
	}
}
	
function refresh{
	resetform
	$UserInfo = Get-ADUser -Identity $accNameTextBox.Text -Properties *
	RetrieveUser($UserInfo)
	$RefreshButton.Focus()
}

function getdclistevent{
	$tab = "event"
	$dcListEVFComboBox.Items.Clear()
	$eventTypeComboBox.Enabled = $false
	$getDCEventButton.Enabled = $false
	$EvtDateCheck.Enabled = $false
	$EvtIDCheck.Enabled = $false
	$eventTypeComboBox.SelectedItem = $eventTypeComboBox.Items[0]
	retrievedc
	$dcListEVFComboBox.Focus()
}

function getdcevent{
	$nbI = 0
	$nbE = 0
	$nbC = 0
	$nbW = 0
	$logtype = $eventTypeComboBox.Text
	$ad = $dcListEVFComboBox.Text
	$EventListDGV.Rows.Clear()
	$threshold = $evtThresholdComboBox.Text
	if ($threshold -ne "Full log"){
		if ($threshold -ne "Last 1000") {
			$threshold = $threshold.Substring(5,3)
			$adQuery = "Get-EventLog -logname $logtype -ComputerName $ad -Newest $threshold" }
		else {
			$threshold = $threshold.Substring(5,4)
			$adQuery = "Get-EventLog -logname $logtype -ComputerName $ad -Newest $threshold" }
	}
	else { 	$adQuery = "Get-EventLog -logname $logtype -ComputerName $ad" } 
	$LogFile = Invoke-Expression $adQuery
	if ($?) {
		foreach ($LogEntry in $LogFile) {
			if ($LogEntry.EntryType -ne 0) { $EventListDGV.Rows.Insert(0,$LogEntry.Index,$LogEntry.EntryType,$LogEntry.TimeGenerated,$LogEntry.Source,$LogEntry.eventID,$LogEntry.Message) }
			else { $EventListDGV.Rows.Insert(0,$LogEntry.Index,[System.Diagnostics.EventLogEntryType]::"Information",$LogEntry.TimeGenerated,$LogEntry.Source,$LogEntry.eventID,$LogEntry.Message) }
		}
		foreach ($Row in $EventListDGV.Rows){
			$EvtType = $Row.Cells[1].Value
			switch ($EvtType) {
				"Information" { $nbI++ }
				"Error" { $nbE ++ }
				"Critical" { $nbC++ }
				"Warning" { $nbW++ }
			}
		}
		$EvtStatsCLabel.Text = "$nbC critical"
		$EvtStatsELabel.Text = "$nbE error"
		$EvtStatsILabel.Text = "$nbI inform."
		$EvtStatsWLabel.Text = "$nbW warning"
		$exportEvtListButton.Enabled = $true
		$clearEvtListButton.Enabled = $true
		$EvtCritCheck.Enabled = $true
		$EvtErrCheck.Enabled = $true
		$EvtInfoCheck.Enabled = $true
		$EvtWarCheck.Enabled = $true
		$EvtCritCheck.Checked = $true
		$EvtErrCheck.Checked = $true 
		$EvtInfoCheck.Checked = $true
		$EvtWarCheck.Checked = $true
		$EvtDateCheck.Enabled = $true
		$EvtIDCheck.Enabled = $true
		$statusLabelVar.Text = "Successfully retrieved "+$logtype+" log on "+$ad+"."
		logthis("std")
	}
	else {
		$statusLabelVar.Text = "Couldn't fetch "+$logtype+" log on "+$ad+"."
		logthis("std")
	}
}

function clearcompform{
	$GetCompButton.Enabled = $true
	$CompFilterComboBox.Enabled = $true
	$ClearCompDGVButton.Enabled = $false
	$CompListComboBox.Enabled = $false
	$ExportCompInfoButton.Enabled = $false
	$CompFilterTextBox.Enabled = $true
    $CompGrpMbrComboBox.Enabled = $false
    $ExportCompDGVButton.Enabled = $false
    $PingCompButton.Enabled = $false
    $RetrieveCompSpecsButton.Enabled = $false
    $mstscCompButton.Enabled = $false
    $rebootCompButton.Enabled = $false
    $gprCompButton.Enabled = $false
    $CompFilterTextBox.Text = $null
	$CompListDGV.Rows.Clear()
	$CompListComboBox.Items.Clear()
    $CompGrpMbrComboBox.Items.Clear()
    $CompOSLabelVar.Text = $null
    $CompIPV4LabelVar.Text = $null
	$statusLabelVar.Text = "Computer list cleared."
	logthis("std")
    $compDetailsTextBox.Text = "Computer specs will appear here if requested."
}

function clearevtlist{
	$EventListDGV.Rows.Clear()
	$dcListEVFComboBox.Items.Clear()
	$getDCListEVFButton.Enabled = $true
	$dcListEVFComboBox.Enabled = $false
	$eventTypeComboBox.Enabled = $false
	$getDCEventButton.Enabled = $false
	$exportEvtListButton.Enabled = $false
	$clearEvtListButton.Enabled = $false
	$evtThresholdComboBox.Enabled = $false
	$EvtCritCheck.Enabled = $false
	$EvtErrCheck.Enabled = $false
	$EvtInfoCheck.Enabled = $false
	$EvtWarCheck.Enabled = $false
	$evtIDfilterTextBox.Enabled = $false
	$EvtCritCheck.Checked = $true
	$EvtErrCheck.Checked = $true 
	$EvtInfoCheck.Checked = $true
	$EvtWarCheck.Checked = $true
	$EvtDateCheck.Checked = $false
	$EvtIDCheck.Checked = $false
	$eventTypeComboBox.SelectedItem = $eventTypeComboBox.Items[0]
    $evtThresholdComboBox.SelectedItem = $evtThresholdComboBox.Items[0]
	$evtMsgTextBox.Text = "Selected event's message will be displayed here."
	$EvtBeforeDateTimePick.Enabled = $false
	$EvtAfterDateTimePick.Enabled = $false
	$statusLabelVar.Text = "Cleared the event chart."
	$EvtStatsCLabel.Text = ""
	$EvtStatsELabel.Text = ""
	$EvtStatsILabel.Text = ""
	$EvtStatsWLabel.Text = ""
	logthis("std")
}

function cleardclist{
	$DCListDGV.Rows.Clear()
	$DCListComboBox.Items.Clear()
	$DCRolesComboBox.Items.Clear()
	$statusLabelVar.Text = "Domain controller list wiped."
	logthis("std")
	$RetrieveDCListButton.Enabled = $true
	$ResetDCListButton.Enabled = $false
	$DCListComboBox.Enabled = $false
	$mstscButton.Enabled = $false
	$dcdiagButton.Enabled = $false
	$dcdiagDnsButton.Enabled = $false
	$dcdiagRepButton.Enabled = $false
	$ExportDCListButton.Enabled = $false
	$pingDCButton.Enabled = $false
	$DCIPV4LabelVar.Text = $null
	$DCOSverLabelVar.Text = $null
	$DCSiteLabelVar.Text = $null
}

function logthis{
	param ($actiontype)
	whichad
	clear
	$actualDate = Get-Date -format "MM/dd/yy HH:mm:ss"
	$startUser = $env:username

    switch ($actiontype) {
    "std" { $LogDGV.Rows.Insert(0,$actualDate,$startUser,$statusLabelVar.Text) }
    "retrievenofilter" { $LogDGV.Rows.Insert(0,$actualDate,$startUser,$statusLabelVar.Text) }
	"retrievefilter" { $LogDGV.Rows.Insert(0,$actualDate,$startUser,"Successfully retrieved AD $type with $filter $filtertype filter.") }
    "wipe" { $LogDGV.Rows.Insert(0,$actualDate,"-- None --","Reset.") }
	"retrieve" { $LogDGV.Rows.Insert(0,$actualDate,$accNameTextBox.Text,"Retrieved user information - "+$statusLabelVar.Text) }
    "refresh" { $LogDGV.Rows.Insert(0,$actualDate,$accNameTextBox.Text,"Refreshed displayed information.") }
    "user" { $LogDGV.Rows.Insert(0,$actualDate,$accNameTextBox.Text,$statusLabelVar.Text)}
    }
}

function logtocsv{
	foreach ($rowDump in $LogDGV.Rows)
		{
			$finalDump = $rowDump.Cells[0].Value+","+$rowDump.Cells[1].Value+","+$rowDump.Cells[2].Value
			Add-Content -Value $finalDump -Path $CsvFileDump
		}
		$fileExpl.DefaultExt = "csv"
		$fileExpl.Filter = "Comma-separated values file (*.csv)|*.csv"
		$fileExpl.Title = "Export log to CSV file"
		$fileExpl.Filename = ""
		$fileExpl.ShowDialog()
		if ($fileExpl.Filename -ne "") {
			Copy-Item $CsvFileDump -Destination $fileExpl.Filename
            if ($?){
			    Remove-Item $CsvFileDump
			    $statusLabelVar.Text = "Log successfully exported to "+$fileExpl.Filename+"."
			    logthis("std") }
            else { $statusLabelVar.Text = "Failed to export to "+$fileExpl.Filename+"." ; logthis("std") }
            }
		else { Remove-Item $CsvFileDump ; $statusLabelVar.Text = "Aborted log export." ; logthis("std") }}

function dctocsv{
	foreach ($rowDump in $DCListDGV.Rows)
		{
			$finalDump = $rowDump.Cells[0].Value+","+$rowDump.Cells[1].Value+","+$rowDump.Cells[2].Value
			Add-Content -Value $finalDump -Path $CsvFileDump
		}
		$fileExpl.DefaultExt = "csv"
		$fileExpl.Filter = "Comma-separated values file (*.csv)|*.csv"
		$fileExpl.Title = "Export DC list to CSV file"
		$fileExpl.Filename = ""
		$fileExpl.ShowDialog()
		if ($fileExpl.Filename -ne "") {
			Copy-Item $CsvFileDump -Destination $fileExpl.Filename
            if ($?){
			    Remove-Item $CsvFileDump
			    $statusLabelVar.Text = "Domain controller list successfully exported to "+$fileExpl.Filename+"."
			    logthis("std") }
            else { $statusLabelVar.Text = "Failed to export to "+$fileExpl.Filename+"." ; logthis("std") }
            }
		else { Remove-Item $CsvFileDump ; $statusLabelVar.Text = "Aborted DC list export." ; logthis("std") }
}

function grptocsv{
	foreach ($rowDump in $GrpListDGV.Rows)
		{
			$finalDump = $rowDump.Cells[0].Value+","+$rowDump.Cells[1].Value+","+$rowDump.Cells[2].Value
			Add-Content -Value $finalDump -Path $CsvFileDump
		}
		$fileExpl.DefaultExt = "csv"
		$fileExpl.Filter = "Comma-separated values file (*.csv)|*.csv"
		$fileExpl.Title = "Export group list to CSV file"
		$fileExpl.Filename = ""
		$fileExpl.ShowDialog()
		if ($fileExpl.Filename -ne "") {
			Copy-Item $CsvFileDump -Destination $fileExpl.Filename
            if ($?){
			    Remove-Item $CsvFileDump
			    $statusLabelVar.Text = "Group list successfully exported to "+$fileExpl.Filename+"."
			    logthis("std") }
            else { $statusLabelVar.Text = "Failed to export to "+$fileExpl.Filename+"." ; logthis("std") }
            }
		else { Remove-Item $CsvFileDump ; $statusLabelVar.Text = "Aborted group list export." ; logthis("std") }
}

function grpmembertocsv{
	foreach ($rowDump in $GrpSelectDGV.Rows)
		{
			$finalDump = $rowDump.Cells[0].Value+";"+$rowDump.Cells[1].Value+";"+$rowDump.Cells[2].Value
			Add-Content -Value $finalDump -Path $CsvFileDump
		}
		$fileExpl.DefaultExt = "csv"
		$fileExpl.Filter = "Semicolon-separated values file (*.csv)|*.csv"
		$fileExpl.Title = "Export group list to CSV file"
		$fileExpl.Filename = ""
		$fileExpl.ShowDialog()
		if ($fileExpl.Filename -ne "") {
			Copy-Item $CsvFileDump -Destination $fileExpl.Filename
            if ($?){
			    Remove-Item $CsvFileDump
			    $statusLabelVar.Text = "Member list successfully exported to "+$fileExpl.Filename+"."
			    logthis("std") }
            else { $statusLabelVar.Text = "Failed to export to "+$fileExpl.Filename+"." ; logthis("std") }
            }
		else { Remove-Item $CsvFileDump ; $statusLabelVar.Text = "Aborted member list export." ; logthis("std") }
}

function comptocsv{
	foreach ($rowDump in $CompListDGV.Rows)
		{
			$finalDump = $rowDump.Cells[0].Value+","+$rowDump.Cells[1].Value+","+$rowDump.Cells[2].Value
			Add-Content -Value $finalDump -Path $CsvFileDump
		}
		$fileExpl.DefaultExt = "csv"
		$fileExpl.Filter = "Comma-separated values file (*.csv)|*.csv"
		$fileExpl.Title = "Export computer list to CSV file"
		$fileExpl.Filename = ""
		$fileExpl.ShowDialog()
		if ($fileExpl.Filename -ne "") {
			Copy-Item $CsvFileDump -Destination $fileExpl.Filename
            if ($?){
			    Remove-Item $CsvFileDump
			    $statusLabelVar.Text = "Computer list successfully exported to "+$fileExpl.Filename+"."
			    logthis("std") }
            else { $statusLabelVar.Text = "Failed to export to "+$fileExpl.Filename+"." ; logthis("std") }
            }
		else { Remove-Item $CsvFileDump ; $statusLabelVar.Text = "Aborted computer list export." ; logthis("std") }
}

function evtlisttocsv{
	foreach ($rowDump in $EventListDGV.Rows)
		{
			if ($rowDump.Visible -eq $true) {
                $entryid = $rowDump.Cells[0].Value.ToString()
                $level = $rowDump.Cells[1].Value.ToString()
                $timestamp = $rowDump.Cells[2].Value.ToString()
                $source = $rowDump.Cells[3].Value.ToString()
                $eventid = $rowDump.Cells[4].Value.ToString()
                $msg = $rowDump.Cells[5].Value.ToString()
                $msg = $msg -replace "\r","  -  "
                $msg = $msg -replace "\n","  -  "
				$finalDump = $entryid+";"+$level+";"+$timestamp+";"+$source+";"+$eventid+";"+$msg
				Add-Content -Value $finalDump -Path $CsvFileDump
			}
		}
		$fileExpl.DefaultExt = "csv"
		$fileExpl.Filter = "Semicolon-separated values file (*.csv)|*.csv"
		$fileExpl.Title = "Export event list to CSV file"
		$fileExpl.Filename = ""
		$fileExpl.ShowDialog()
		if ($fileExpl.Filename -ne "") {
			Copy-Item $CsvFileDump -Destination $fileExpl.Filename
            if ($?){
			    Remove-Item $CsvFileDump
			    $statusLabelVar.Text = "Event list successfully exported to "+$fileExpl.Filename+"."
			    logthis("std") }
            else { $statusLabelVar.Text = "Failed to export to "+$fileExpl.Filename+"." ; logthis("std") }
            }
		else { Remove-Item $CsvFileDump ; $statusLabelVar.Text = "Aborted event list export." ; logthis("std") }
}	

function evtfilter{
	param($filtertype)
	switch ($filtertype) {
		"info" {
			if ($EvtInfoCheck.Checked -eq $true) {
				foreach ($Row in $EventListDGV.Rows){
					if ($Row.Cells[1].Value -eq "Information") { $Row.Visible = $true }
				}
			}
			else {
				foreach ($Row in $EventListDGV.Rows) {
					if ($Row.Cells[1].Value -eq "Information") { $Row.Visible = $false }
				}
			}
		}
		"warn" {
			if ($EvtWarCheck.Checked -eq $true) {
				foreach ($Row in $EventListDGV.Rows){
					if ($Row.Cells[1].Value -eq "Warning") { $Row.Visible = $true }
				}
			}
			else {
				foreach ($Row in $EventListDGV.Rows) {
					if ($Row.Cells[1].Value -eq "Warning") { $Row.Visible = $false }
				}
			}
		}
		"crit" {
			if ($EvtCritCheck.Checked -eq $true) {
				foreach ($Row in $EventListDGV.Rows){
					if ($Row.Cells[1].Value -eq "Critical") { $Row.Visible = $true }
				}
			}
			else {
				foreach ($Row in $EventListDGV.Rows) {
					if ($Row.Cells[1].Value -eq "Critical") { $Row.Visible = $false }
				}
			}
		}
		"error" {
			if ($EvtErrCheck.Checked -eq $true) {
				foreach ($Row in $EventListDGV.Rows){
					if ($Row.Cells[1].Value -eq "Error") { $Row.Visible = $true }
				}
			}
			else {
				foreach ($Row in $EventListDGV.Rows) {
					if ($Row.Cells[1].Value -eq "Error") { $Row.Visible = $false }
				}
			}
		}
	}
}

function evtfilterall{
	evtfilter("info")
	evtfilter("warn")
	evtfilter("crit")
	evtfilter("error")
}

function evtdatetimefilter{
	evtfilterall
	if ($EvtDateCheck.Checked -eq $true) {
		foreach ($Row in $EventListDGV.Rows) {
				if ($Row.Visible -eq $true){
					if ($Row.Cells[2].Value -lt $EvtBeforeDateTimePick.Value -or $Row.Cells[2].Value -gt $EvtAfterDateTimePick.Value) { $Row.Visible = $false }
				}
		}
	}
}

function initeverything{
	#consult
	$GroupComboBox.Enabled = $false
	$GrpMoreInfoButton.Enabled = $false
	$ExportToFileButton.Enabled = $false
	$lockedBoolCheck.Enabled = $false
	$lockedBoolCheck.Checked = $false
	$enabledBoolCheck.Enabled = $false
	$enabledBoolCheck.Checked = $false
	$pwNeverExpBoolCheck.Checked = $false
	$pwNeverExpBoolCheck.Enabled = $false
	$pwExpiredBoolCheck.Checked = $false
	$pwExpiredBoolCheck.Enabled = $false
	$UnlockAccButton.Enabled = $false
	$DisableAccButton.Enabled = $false
	$EnableAccButton.Enabled = $false
	$RefreshButton.Enabled = $false
	$SetExpDateButton.Enabled = $false
	$DayNUD.Enabled = $false
	$MonthNUD.Enabled = $false
	$YearNUD.Enabled = $false
	$disableExpDateButton.Enabled = $false
	$neverExpPwButton.Enabled = $false
	$doesExpPwButton.Enabled = $false
	$changeUserPwButton.Enabled = $false
	$changePwTextBox1.Enabled = $false
	$changePwTextBox2.Enabled = $false
	$currentdate = Get-Date -UFormat "%d%m%y"
	$DayNUD.Value = $currentdate.Substring(0,2)
	$MonthNUD.Value = $currentdate.Substring(2,2)
	$YearNUD.Value = $currentdate.Substring(4,2)
	
	#ad
	$ExportDCListButton.Enabled = $false
	$RetrieveDCListButton.Enabled = $true
	$ResetDCListButton.Enabled = $false
	$DCListComboBox.Enabled = $false
	$mstscButton.Enabled = $false
	$dcdiagButton.Enabled = $false
	$dcdiagDnsButton.Enabled = $false
	$dcdiagRepButton.Enabled = $false
	$pingDCButton.Enabled = $false
	$DCRolesComboBox.Enabled = $false
	
	#group
	$ClearGrpDGVButton.Enabled = $false
	$GrpListComboBox.Enabled = $false
	$ExportGrpInfoButton.Enabled = $false
	$GrpFilterTextBox.Enabled = $false
	$ExportGrpDGVButton.Enabled = $false
	$GetGrpUserButton.Enabled = $false
	$ExportGrpMemButton.Enabled = $false
	
	#comp
	$ClearCompDGVButton.Enabled = $false
	$CompListComboBox.Enabled = $false
    $ExportCompDGVButton.Enabled = $false
	$ExportCompInfoButton.Enabled = $false
    $CompGrpMbrComboBox.Enabled = $false
    $PingCompButton.Enabled = $false
    $RetrieveCompSpecsButton.Enabled = $false
    $mstscCompButton.Enabled = $false
    $rebootCompButton.Enabled = $false
    $gprCompButton.Enabled = $false
	$CompFilterTextBox.Enabled = $false
	
	#event
	$dcListEVFComboBox.Enabled = $false
	$eventTypeComboBox.Enabled = $false
	$getDCEventButton.Enabled = $false
	$exportEvtListButton.Enabled = $false
	$clearEvtListButton.Enabled = $false
	$evtThresholdComboBox.Enabled = $false
	$EvtCritCheck.Enabled = $false
	$EvtErrCheck.Enabled = $false
	$EvtInfoCheck.Enabled = $false
	$EvtWarCheck.Enabled = $false
	$EvtDateCheck.Enabled = $false
	$EvtIDCheck.Enabled = $false
	$evtIDfilterTextBox.Enabled = $false
	$eventTypeComboBox.SelectedItem = $eventTypeComboBox.Items[0]
    $evtThresholdComboBox.SelectedItem = $evtThresholdComboBox.Items[0]
	$EvtBeforeDateTimePick.Enabled = $false
	$EvtAfterDateTimePick.Enabled = $false
	
	#lock
	$lockAccListComboBox.Enabled = $false
	$resetLockFormButton.Enabled = $false
	$UnlockFoundLockedAccButton.Enabled = $false
	$MoreInfoLockedAccButton.Enabled = $false
	$LockingCompMoreInfoButton.Enabled = $false
	$LockingDCEvtButton.Enabled = $false
	$LockingDCMoreInfoButton.Enabled = $false
	$checkLockButton.Enabled = $false
}

function whichad {
	$currentAD = $env:logonserver
	if ($currentAD -eq $null) { $currentAD = "Unknown" }
	else { $currentAD = $currentAD.Substring(2,$currentAD.length-2) }
	$queryingADMenu.Text = "Querying DC: $currentAD"
}

#endregion

	#region Actual Script Code
clear
initeverything
whichad
$mainForm.ShowDialog()

	#endregion