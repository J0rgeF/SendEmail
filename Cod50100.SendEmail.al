namespace SendEmail.SendEmail;
using System.Email;

codeunit 50100 "Send Email"
{
    var
    Email: Codeunit Email;
    EmailMsg: Codeunit "Email Message";
    EmailBody: Label 'Dear, Mike this is a test email';

    procedure SendEmail()
    begin
        EmailMsg.Create('michaelecibu@gmail.com', 'Sending Test Email', '', true);
        EmailMsg.AppendToBody(StrSubstNo(EmailBody, UserId));
        
        if Email.Send(EmailMsg) then
            Message('Email Sent Successfully')
        else
            Error('Failed to send email %1', GetLastErrorText());    
    end;
}
