@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PDF_DETAILS'
@Metadata.ignorePropagatedAnnotations: true
define root
 view entity ZC_PDF_DETAILS  provider contract transactional_query as projection on  ZI_PDF_DETAILS
{
    key Billingdocument,
    Uuid,
    Status,
    Billingdate,
    Sourcefile,
    SourceFileName,
    Signedfile,
    SignedFileName,
    Cancelled,
    Signedon,
    Signedat,
    Createdby,
    Createdon,
    Lastchangedby,
    Lastchangedon
}
