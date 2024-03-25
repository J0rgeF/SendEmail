namespace SendEmail.SendEmail;
using System.Email;
using Microsoft.Sales.Reports;
using System.Utilities;
using Microsoft.Sales.Customer;

codeunit 50101 SendEmailWithAttachment
{
    var
        Email: Codeunit Email;
        EmailMsg: Codeunit "Email Message";
        SenderEmail: Label 'michaelecibu@gmail.com';
        EmailSubject: Label 'Sending Test Email';
        EmailBody: Label 'Dear, Mike Ecibu this is a test email';

        OutStr: OutStream;
        InStr: InStream;
        TeBlob: Codeunit "Temp Blob";

    procedure SendEmail()
    begin
        EmailMsg.Create(SenderEmail, EmailSubject, EmailBody, true);

        TeBlob.CreateOutStream(OutStr);//Writing Data
        Report.SaveAs(Report::"Customer - List", '', ReportFormat::Pdf, OutStr);
        TeBlob.CreateInStream(InStr);//Read Data
        EmailMsg.AddAttachment('CustomerList.pdf', '', InStr);

        if Email.Send(EmailMsg) then
            Message('Email Sent Successfully with attachment')
        else
            Error('Failed to send email %1', GetLastErrorText());
    end;
}
