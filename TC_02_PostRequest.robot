*** Settings ***
Library    RequestsLibrary
Library    json
Library    Collections
*** Variables ***
${Base_Url}=    http://restapi.demoqa.com/customer

*** Test Cases ***
Create new resource
    create session    adddata   ${Base_Url}
    ${body}=    create dictionary    First_Name=Prakash     Last_Name=Samal     DOB=01/05/1993
    ${header}=    create dictionary    Content-Type=pplication/json
    ${response}=    POST On Session    adddata    /register    data=${body}     headers= ${header}
    log to console   ${response.status_code}
    log to console    ${response.content}

    #ValidationPart
#    ${res_body}=    convert to string    ${response.content}
 #   should contain    ${res_body}    OPERATION_SUCCESS
  #  should contain    ${res_body}    Operation completed succesfully