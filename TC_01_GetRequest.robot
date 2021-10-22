*** Settings ***
Library    RequestsLibrary
Library    Collections
*** Variables ***
${Base_Url}    https://demoqa.com/
${City}     Rourkela
*** Test Cases ***
Get Weather Info
    create session    mysession    ${Base_Url}
    ${response}=    get on session    mysession    /utilities/weather/city/${City}
    #log to console    ${response.status_code}
    #log to console    ${response.content}
    #log to console    ${response.headers}

    #ValidationPart
    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}    200

    ${body}=    convert to string    ${response.content}
    should contain    ${body}    Rourkela

    ${contenttype_value}=    get from dictionary    ${response.headers}    content-type
    should be equal     ${contenttype_value}    application/json; charset=utf-8

