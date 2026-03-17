@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PDF Details'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_PDF_DETAILS
  as select from zdb_pdf_details
{
  key billingdocument as Billingdocument,
      uuid            as Uuid,
      status          as Status,
      billingdate     as Billingdate,
      sourcefile      as Sourcefile,
      sourcefilename  as SourceFileName,
      signedfile      as Signedfile,
      signedfilename  as SignedFileName,
      cancelled       as Cancelled,
      signedon        as Signedon,
      signedat        as Signedat,
      @Semantics.user.createdBy: true
      createdby       as Createdby,
      @Semantics.systemDateTime.createdAt: true
      createdon       as Createdon,
      @Semantics.user.lastChangedBy: true
      lastchangedby   as Lastchangedby,
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedon   as Lastchangedon
}
