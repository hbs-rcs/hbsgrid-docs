# **New** HBSGrid Guest Users: How to Set Up Your Research Computing Guest Account and Access the HBSGrid

## Before You Begin

Make sure you can access the email with the subject line **“HBS Research Computing Environment Guest Account with Time-Sensitive Link.”** You’ll use the link in this email to retrieve your temporary password.

## Step 1: Download Duo Mobile

Install Duo Mobile on your smartphone. You’ll set it up in Step 2, after you activate your HBS Guest Researcher Account.

- [Duo Mobile for iPhone (iOS)](https://apps.apple.com/us/app/duo-mobile/id422663827)
- [Duo Mobile for Android](https://play.google.com/store/apps/details?id=com.duosecurity.duomobile)

## Step 2: Activate Your Account and Set Up Duo Mobile

1. Retrieve your temporary password by clicking the link in the email titled **“HBS Research Computing Environment Guest Account with Time-Sensitive Link.”**
2. Open the [HBS sign-in page](https://cas.hbs.edu/cas/login).
3. Enter your new `rcs_username` email account in the **Username** field and your temporary password in the **Password** field. Select **Sign In**.
   > 🛑 **Do not use the HarvardKey login button.**
5. When prompted, create a new password.

   **Password requirements:** Your password must:
   - Be at least 8 characters long.
   - Include at least 3 of these 4 character types: uppercase letters, lowercase letters, numbers, and special characters.
   - Contain no spaces.
   - Not contain 3 or more consecutive characters from your name or account name.
   - Not reuse a previous password.

6. After changing your password, select **Continue to Sign In**.
7. Select **Log in Again**.
8. Enter your `rcs_username` email account and newly created password, then select **Sign In**.
   > 🛑 **Do not use the HarvardKey login button.**
10. When prompted to set up Duo Security for multifactor authentication, select **Get Started**.
11. Select **Duo Mobile** as your verification method.
12. Enter your mobile phone number and select **Continue**.
13. Check that your phone number is correct, then select **Yes, it's correct**. If needed, use the option to change your phone number.
14. Confirm that Duo Mobile is installed on your smartphone, then select **Next** in your computer browser.
15. Open Duo Mobile on your smartphone and tap **Add (+)** to add an account.
16. Select **Use QR Code** in Duo Mobile and scan the QR code displayed in your computer browser.
17. When your computer displays **Added Duo Mobile**, select **Continue**.
18. Select **I don't want to add more devices** or **Skip for now**, depending on the screen, unless you want to register another verification method.
19. When you see **Setup Complete**, select **Log in with Duo**.
20. Approve the Duo verification request on your smartphone.

After your account is created and Duo is activated, you’ll see a page that says **“Access Denied.”** This is expected. Continue to Step 3.

<img width="368" height="288" alt="image" src="https://github.com/user-attachments/assets/7473e03a-f193-4e67-8ce8-8b60179b8dc7" />

## Step 3: Install and Configure Ivanti VPN

1. Download and install Ivanti for [Windows](https://downloads.secure.ctfassets.net/beh2ph2tgbqk/1x8GfPyxaO4DaJS6SgrU75/52d37eeeaa640bcf1f9d7b07ee30057e/ps-pulse-win-22.8r6-b44527-64bit-installer.msi) or [macOS](https://downloads.secure.ctfassets.net/beh2ph2tgbqk/3pN8dyGs16ZSnrhgcpDga3/f791bf5f25fa7c11f5b7da8b4e25f428/ps-pulse-mac-22.8r6-b44527-installer.pkg.zip), accepting all default settings.
2. Open the Ivanti application on your computer.
3. Check whether **HBS VPN SSO** is listed as a connection:
   - **If HBS VPN SSO is listed:** Select it, then select **Connect**.
   - **If HBS VPN SSO is not listed:** Select the **+** icon at the top of the screen to add a connection, using:
     - **Name:** HBS VPN
     - **Server URL:** [https://vpnconnect.hbs.edu/sso](https://vpnconnect.hbs.edu/sso)
4. Sign in with your HBS Guest Account and password, then approve the Duo Mobile push notification.
   > 🛑 **Do not use the HarvardKey login button.**

## Step 4: Get Started with the HBSGrid

- Open the [HBSGrid Quick Start Guide](https://hbs-rcs.github.io/hbsgrid-docs/#quick-start) for instructions on accessing and using the Grid.
- Review the [HBSGrid Storage Guide](https://hbs-rcs.github.io/hbsgrid-docs/storage/) to learn how to access and manage your research files.

# **Existing** HBSGrid Guest Users: How to Install Ivanti VPN for Secure Access to the Grid

## Install and Configure Ivanti Secure

1. Install the updated version of Ivanti Secure for [Windows](https://downloads.secure.ctfassets.net/beh2ph2tgbqk/1x8GfPyxaO4DaJS6SgrU75/52d37eeeaa640bcf1f9d7b07ee30057e/ps-pulse-win-22.8r6-b44527-64bit-installer.msi) or [macOS](https://downloads.secure.ctfassets.net/beh2ph2tgbqk/3pN8dyGs16ZSnrhgcpDga3/f791bf5f25fa7c11f5b7da8b4e25f428/ps-pulse-mac-22.8r6-b44527-installer.pkg.zip), accepting all default settings.
2. Open the Ivanti application on your computer.
3. Check whether **HBS VPN SSO** is listed as a connection:
   - **If HBS VPN SSO is listed:** Select it, then select **Connect**. Sign in with your HBS Guest Account and password, and approve the Duo Mobile push notification.
     > 🛑 **Do not use the HarvardKey login button.**
   - **If HBS VPN SSO is not listed:** Select the **+** icon at the top of the screen to add a connection:
     - **Name:** HBS VPN
     - **Server URL:** [https://vpnconnect.hbs.edu/sso](https://vpnconnect.hbs.edu/sso)

     Select **Connect**. Sign in with your HBS Guest Account and password, and approve the Duo Mobile push notification.
     > 🛑 **Do not use the HarvardKey login button.**

## Remove the Previous VPN Connection

1. Open the Ivanti Secure Access Client.
2. Confirm that **HBS VPN SSO** ([https://vpnconnect.hbs.edu/sso](https://vpnconnect.hbs.edu/sso)) appears in the connection list and that you can successfully connect and sign in.
3. Select **HBS VPN** ([https://vpnconnect.hbs.edu](https://vpnconnect.hbs.edu)). **Do not select HBS VPN SSO.**
4. Select the **X** (delete) icon in the upper-right corner of the **Connections** section.
