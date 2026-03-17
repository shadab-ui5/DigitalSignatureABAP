@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View for Digital Signature Details'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_DS_Form_Details as select from 

 ZI_INVOICEPRINT_MIN as _ds

    left outer join I_BillingDocument as _bill on _ds.BillingDocument = _bill.BillingDocument

    left outer join ZI_PDF_DETAILS    as _pdf  on _pdf.Billingdocument = _ds.BillingDocument

  //left outer join I_BusinessPlaceVH as _Bp on _bill.CompanyCode = _Bp.CompanyCode

    left outer join I_Customer        as _cus  on _bill.PayerParty = _cus.Customer

{
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_BillingDocument', element: 'BillingDocument' } }]
  key _ds.BillingDocument              as BillingDocument,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Plant', element: 'Plant' } }]
      _ds.Plant                        as Plant,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CompanyCode', element: 'CompanyCode' } }]
      _bill.CompanyCode                as CompanyCode,
      _ds.CustomerName,
      _ds.StreetPrefixName1,
      _ds.StreetPrefixName2,
      _ds.StreetSuffixName2,
      _ds.CITY,
      _ds.PostalCode,
      _ds.Buyer,
      _ds.AddressID,
      _ds.Buyeradd2,
      _ds.Buyeradd3,
      _ds.Buyeradd4,
      _ds.Buyercity,
      _ds.BuyerPostelcode,
      _ds.DocumentReferenceID          as ODNNumber,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_BillingDocument', element: 'BillingDocumentDate' } }]
      _ds.BillingDocumentDate,
      _ds.ReferenceSDDocument,
      _ds.DeliveryDate,
      _ds.SalesDocument,
      _ds.SoldToParty,
      _ds.BusinessPartnerIDByExtSystem as Vendor,
      _ds.irnno                        as IRN,
      //      @Semantics.amount.currencyCode: 'TransactionCurrency'
      //      _ds.ConditionAmount,
      _bill.PayerParty,
      _bill.FiscalYear as FiscalPeriod,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_BillingDocument', element: 'BillingDocumentType' } }]

      _bill.BillingDocumentType,
      //      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_BusinessPlaceVH', element: 'BusinessPlace' } }]
      'BusinessPlace'                  as BusinessPlace,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_BillingDocument', element: 'BillingDocument' } }]
      _ds.BillingDocument              as DocumentNumber,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_BillingDocument', element: 'BillingDocumentDate' } }]
      _ds.BillingDocumentDate          as DocumentDate,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Customer', element: 'Customer' } }]
      _cus.Customer                    as CustomerNumber,
      _cus.OrganizationBPName1         as Name1,
      _cus.OrganizationBPName2         as Name2,
      ''                               as AuthorizedSignatory,
      ''                               as OutputType,
      ''                               as EmailSent,
      case
      when _pdf.Status is not initial then _pdf.Status
      else 'Unsigned'
      end                              as Status,
      //       case
      //  when _pdf.Status is initial then 'Not Signed'
      //  else 'Signed'
      //    end as IsSigned,
      _pdf.Signedon,
      _pdf.Signedat,
      _pdf.Sourcefile,
      _pdf.SourceFileName,
      _pdf.Signedfile,
      _pdf.SignedFileName,
      _pdf.Cancelled,
      
      _bill.SalesOrganization,
      _bill.DistributionChannel,
      _bill.Division


}
