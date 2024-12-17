On-Cloc Service Mobile App
1. Login & Security
●	Login Screen
○	[ ] Input field for username (data from backend)
○	[ ] Input field for password (mask characters)
○	[ ] "Forgot Password" link (implement chosen recovery method)
○	[ ] First-time login prompt to change the password in Settings.
●	Password Management
○	[ ] "Change Password" form within the Settings tab.
○	[ ] Password validation criteria (if applicable)
●	Phone Security Setup
○	[ ] Initial setup prompt: Guide the user to choose a security option (PIN, Biometric, Face ID)
○	[ ] Settings option to change security preference
○	[ ] Settings option to set the inactivity lock timer (with clear choices)
2. Home Page
●	Layout
○	[ ] Set background colour: Secondary White (#eeeeee)
○	[ ] Design three main card containers (outlined in Primary Blue)
○	[ ] Position small Settings icon (Primary Blue)
●	Cloud Status
○	[ ] Design status icon (Green = connected, Red = disconnected)
○	[ ] Implement "Offline Mode" banner display when disconnected
●	Sync Functionality
○	[ ] Automatic sync upon connection restoration
○	[ ] Implement manual sync button (optional)
●	Cards
○	Time Card
■	[ ] Display current job in progress (if any)
■	[ ] Design Clock In/Out buttons (Large, Primary Blue)
■	[ ] Implement button state changes on press
■	[ ] Display recent activity summary
■	[ ] Implement manual time setup with a time picker
○	Travel Card
■	[ ] Display relevant travel status details (if in progress)
■	[ ] Integrate GPS tracking (see details below)
○	Reports
■	[ ] Display summary of recent reports

3. Time Card
●	Integration
○	[ ] Connect with the backend to retrieve activity lists
●	Clock In/Out
○	[ ] Ensure button responsiveness and clear state changes
●	Offline Functionality
○	[ ] Allow time entries to be saved locally when offline
○	[ ] Timestamp offline entries
○	[ ] Implement automatic sync of offline entries when the connection is restored
●	End-of-Day Prompt
○	[ ] Design a friendly reminder notification for outstanding Clock-outs
●	Manual Time Setup
○	[ ] Implement a time picker for manual entry of start/end times
○	[ ] Allow selection of a date (if applicable)
4. Travel Card
●	GPS Integration
○	[ ] Obtain user permissions for location tracking
○	[ ] Implement GPS functionality to record the start location
○	[ ] Implement GPS functionality to record end location
○	[ ] Calculate distance travelled (if needed)
○	[ ] Optionally, enable route mapping visualization (if helpful)
●	Start/Stop Buttons
○	[ ] Design prominent Start/Stop buttons (Primary Blue)
○	[ ] Ensure button responsiveness
●	Notes
○	[ ] Create a text input field for adding notes to travel entries
5. Service Report
●	Job Selection
○	[ ] Implement a dropdown menu or clear selection method for choosing a job
●	Data Autofill
○	[ ] Retrieve relevant job details from the backend
○	[ ] Pre-populate report fields where possible
●	Customer Signature
○	[ ] Implement signature capture functionality
○	[ ] Ensure secure signature storage
6. Settings Tab
●	Layout
○	[ ] Set background colour: Secondary White (#eeeeee)
○	[ ] Create "Account", "Security", and "App" sections
●	Sections
○	Account
■	[ ] "Change Password" button/link
■	[ ] "Logout" button/link
○	Security
■	[ ] Option to manage PIN/Biometric/FaceID settings
■	[ ] Dropdown or selection for Inactivity Lock Duration
○	App
■	[ ] "FAQs" link (text in Secondary Orange)
■	[ ] "Support" link (text in Secondary Orange, opens email/chat )
7. Additional
●	Error Handling
○	[ ] Design clear error messages (use Secondary Orange)
○	[ ] Handle connectivity issues
○	[ ] Handle data validation errors
●	Visual Design
○	[ ] Use headings and spacing for visual hierarchy
○	[ ] Choose appropriate font weights
●	User Testing
○	[ ] Conduct testing with the entire team early in development
○	[ ] Gather feedback and iterate on the design

