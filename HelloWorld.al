// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.SendEmail;

using Microsoft.Sales.Customer;
using SendEmail.SendEmail;

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        SendEmail.SendEmail();
    end;


    var
    SendEmail: Codeunit SendEmailWithAttachment;
}