
# Windows SDK Installer
* This project contains a `.bat` file which will install the following windows dependencies:
    * Chocolatey
    * curl
    * git-bash
    * Python
    * Node.js
    * Notepad++
    * Visual Studio Code
    * IntelliJ Idea
    * Chrome
    * WAMP
        * (includes installations of Apache, PHP, and MySQL)
    


## Automated installer
* Download this project as a `.zip`
* From the root directory of the project, execute `start ./windows-sdk/installer.bat`





## Manual Installation

### Install WAMP
1. Download and install WAMP
2. ensure WAMP selects `chrome` as its browser.
3. Chrome can be found here:
4. `C:\Program Files (x86)\Google\Chrome\Application\chrome.exe`

### Running WAMP
1. Start the newly installed WAMP application.
2. Navigate to `http://localhost/phpmyadmin/index.php`
3. Select the `databases` tab
4. Create a database named `wordpress`.

### Download Wordprss
1. Download `wordpress.zip`
2. extract `wordpress.zip` in `C:\wamp64\www` directory
3. edit `wp-config-sample.php`
    * edit `line 19` by renaming `'database_name_here'` to `wordpress
    * edit `line 22` by renaming `'username_here'` to `'root'`.
    * edit `line 25` by setting `'password_here'` to `''`
4. Save the newly edited `wp-config-sample.php` as a new file named `wp-config.php`


### Configure Wordpress
1. Navigate to `localhost/wordpress/wp-admin`
2. Set `username` to `root`
3. Set `password` to `1`
4. Set `email`
5. Log in