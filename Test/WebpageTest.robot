*** Settings ***
Documentation    VDC Live Webpage Test
Library          Selenium2Library
Library          BuiltIn

*** Variable ***
${URL}              https://vdc-live.com/viasys/public/
${title}            Viasys VDC Live
${SEARCH_TEXTBOX}   Apartment
${email}            anusatish80@gmail.com
${pwd}              AnuSatish
${timeout}          5s
${inpwd}            anusatish
${sleep}          3s


*** Test Cases ***
VDC live web page test cases
    [Tags]    DEBUG
      Open VDC Website in Chrome and maximize the window and then Verify the home page title
      Click on Login with Valid Credentials
      Click on Login with invalid Credentials
      Sleep          ${sleep}
      Check Search button
      Sleep          ${sleep}
      [Tear Down]   Close Browser

*** Keywords ***
Open VDC Website in Chrome and maximize the window and then Verify the home page title
        Open Browser     url=${URL}     browser=firefox
        Maximize Browser Window
        Log to Console   Website launched successfully
        Title Should Be   ${title}
        Log to Console   Homepage Title Verified
        Sleep          ${sleep}

Click on Login with Valid Credentials
        Click Button    xpath://*[@id="title"]/div[6]/button[1]
        Sleep          ${sleep}
        Input Text     xpath://*[@id="auth_user_email"]   ${email}
        Input Password   xpath://*[@id="auth_user_password"]  ${pwd}
        Click Element    xpath://*[@id="submit_record__row"]/td[2]/input[1]
        Wait Until Page Contains   Welcome          timeout=${timeout}
        Sleep          ${sleep}
        Log To Console    Logged in successfully
        Click Button       xpath://*[@id="title"]/div[3]/button[2]
        Sleep          ${sleep}
Click on Login with invalid Credentials
       Click Button     xpath://*[@id="title"]/div[6]/button[1]
       Input Text      xpath://*[@id="auth_user_email"]       ${email}
       Input Password   xpath://*[@id="auth_user_password"]    ${inpwd}
       Click Element    xpath://*[@id="submit_record__row"]/td[2]/input[1]
       Wait Until Page Contains     Invalid login      timeout=${timeout}
       Log to Console      Invalid Login

Check Search button
       Go Back
       Input Text    xpath://*[@id="search_input"]      ${SEARCH_TEXTBOX}
       Click Button   xpath://*[@id="title"]/div[5]/button
       Wait Until Element Is Visible  xpath:/html/body/div[4]/div[1]/div[2]/div[3]/div[2]/div/div[1]/div[3]/img  timeout=${timeout}
       Click image   css:#preview_LrBpwykbenOJCjnJ_search > img:nth-child(1)
       Log To Console    Image is clicked
