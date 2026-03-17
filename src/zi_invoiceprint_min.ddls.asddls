@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice print cds'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_INVOICEPRINT_MIN as select from I_BillingDocument as a
     left outer join I_BillingDocumentItem as b on ( b.BillingDocument = a.BillingDocument )
     left outer join I_BusinessPartner as bb on ( bb.BusinessPartner = a.SoldToParty )
     left outer join ZSD_DOM_ADDRESS as b2 on ( b2.Customer = b.ShipToParty )
     left outer join ZSD_DOM_ADDRESS as b3 on ( b3.Customer = a.SoldToParty )
     left outer join I_DeliveryDocument as c on ( c.DeliveryDocument = b.ReferenceSDDocument )
     left outer join zsd_invoice_cbo as irn on ( irn.billingdocument = a.BillingDocument )
     left outer join ZSD_INVOICE_SUM_DATA2 as f on ( f.BillingDocument = a.BillingDocument and f.Material = b.Material  )    
//     left outer join ZSD_INVOICE_SUM_DATA as ff on ( ff.BillingDocument = a.BillingDocument )    
     left outer join I_ProductPlantBasic as g on ( g.Product = b.Product and g.Plant = b.Plant )    
     left outer join I_SalesDocument as h on ( h.SalesDocument = b.SalesDocument )    
       
{
   key a.BillingDocument,
   key min(b.BillingDocumentItem) as BillingDocumentItem,
   key b.Plant,
       a.BillingDocumentType,
       b2.Customer,
       b2.CustomerName,
       b2.StreetPrefixName1,
       b2.StreetPrefixName2,
       b2.StreetSuffixName2,
       b2.CITY,
       b2.CityName,
       b2.TaxNumber3,
       b2.PostalCode,
       b3.CustomerName as Buyer,
       b3.AddressID,
       b3.StreetPrefixName1 as Buyeradd2,
       b3.StreetPrefixName2 as Buyeradd3,
       b3.StreetSuffixName2 as Buyeradd4,
       b3.CITY as Buyercity,
       b3.PostalCode as BuyerPostelcode,
       b3.TaxNumber3 as Buyergstin,
       a.DocumentReferenceID,
       a.BillingDocumentDate,
       b.ReferenceSDDocument,
       c.DeliveryDate,
       b.SalesDocument,
       a.SoldToParty,
       irn.irnno,
       bb.BusinessPartnerIDByExtSystem,
       
       a.SalesOrganization,
       a.DistributionChannel,
       a.Division
       
      
      
         
} where a.BillingDocumentIsCancelled is initial and (a.BillingDocumentType = 'G2' or a.BillingDocumentType = 'L2' or a.BillingDocumentType = 'F2' or
a.BillingDocumentType = 'CBRE')
group by
    a.BillingDocument,
    a.BillingDocumentType,
    b.Plant,
    b2.CustomerName,
    b2.Customer,
    b2.StreetPrefixName1,
    b2.StreetPrefixName2,
    b2.StreetSuffixName2,
    b2.CITY,
    b2.CityName,
    b2.TaxNumber3,
    b2.PostalCode,
    b3.CustomerName,
    b3.AddressID,
    b3.StreetPrefixName1,
    b3.StreetPrefixName2,
    b3.StreetSuffixName2,
    b3.CITY,
    b3.PostalCode,
    b3.TaxNumber3,
    a.DocumentReferenceID,
    a.BillingDocumentDate,
    b.ReferenceSDDocument,
    c.DeliveryDate,
    b.SalesDocument,
    a.PurchaseOrderByCustomer,
    a.SoldToParty,
    bb.BusinessPartnerIDByExtSystem,
    irn.irnno,
    a.SalesOrganization,
    a.DistributionChannel,
    a.Division
   
