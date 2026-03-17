@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Digi Sign Auth Matrix'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZI_SD_DigiSign_Auth
  as select from zsddigisignauth

{
  key userid        as Userid,
  key plant         as Plant,
      plantname     as Plantname,
      signatoryname as SignatoryName,
      enableresign as EnableResign
}
