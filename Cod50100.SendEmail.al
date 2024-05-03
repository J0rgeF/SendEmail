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
            Message(SucessfullEmailMessage)
        else
            Error(FailedEmailMessage, GetLastErrorText());
    end;

    var
        SucessfullEmailMessage: Label 'Email Sent Sccessfully';
        FailedEmailMessage: Label 'Failed to send email %1';
}
