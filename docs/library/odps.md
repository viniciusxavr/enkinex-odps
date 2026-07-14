# enkinex-odps

## Index

- [DataProduct](#dataproduct)
- common
  - [AuthoritativeDefinition](#authoritativedefinition)
  - [CustomProperty](#customproperty)
  - [Description](#description)
  - [Extensible](#extensible)
  - [Taggable](#taggable)
- management
  - [ManagementPort](#managementport)
- product
  - [Sbom](#sbom)
  - input
    - [InputContract](#inputcontract)
    - [InputPort](#inputport)
  - output
    - [OutputPort](#outputport)
- support
  - [Support](#support)
- team
  - [Team](#team)
  - [TeamMember](#teammember)

## Schemas

### DataProduct

An open data product standard descriptor to enable defining data products.

#### Attributes

| name | type | description | default value |
| --- | --- | --- | --- |
|**apiVersion** `required`|"v0.9.0" \| "v1.0.0"|Version of the standard used to build data product. Default value is v1.0.0.|"v1.0.0"|
|**authoritativeDefinitions**|[[AuthoritativeDefinition](#authoritativedefinition)]|List of links to sources that provide more details on the data contract.||
|**customProperties**|[[CustomProperty](#customproperty)]|A list of key/value pairs for custom properties.||
|**description**|[Description](#description)|Object containing the descriptions.||
|**domain**|str|Business domain||
|**id** `required`|str|A unique identifier used to reduce the risk of dataset name collisions, such as a UUID.||
|**inputPorts**|[[InputPort](#inputport)]|List of objects describing an input port. You need at least one as a data product needs to get data somewhere.||
|**kind** `required` `readOnly`|"DataProduct"|The kind of file this is. Valid value is `DataProduct`.|"DataProduct"|
|**managementPorts**|[[ManagementPort](#managementport)]|Management ports define access points for managing the data product.||
|**name**|str|Name of the data product.||
|**outputPorts**|[[OutputPort](#outputport)]|List of objects describing an output port. You need at least one, as a data product without output is useless.||
|**productCreatedTs**|str|Timestamp in UTC of when the data product was created, using ISO 8601.||
|**status** `required`|"proposed" \| "draft" \| "active" \| "deprecated" \| "retired"|Current status of the data product.||
|**support**|[[Support](#support)]|Support and communication channels.||
|**tags**|[str]|A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.||
|**team**|[Team](#team)|Team information.||
|**tenant**|str|Organization identifier||
|**version**|str|Current version of the data product. Not required, but highly recommended.||
### AuthoritativeDefinition

A type/link pair for authoritative definitions.

#### Attributes

| name | type | description | default value |
| --- | --- | --- | --- |
|**description**|str|Optional description.||
|**type** `required`|str|||
|**url** `required`|str|URL to the authority.||
### CustomProperty

A key/value pair for custom properties.

#### Attributes

| name | type | description | default value |
| --- | --- | --- | --- |
|**description**|str|Optional description.||
|**property** `required`|str|The name of the key. Names should be in camel case, the same as if they were permanent properties in the contract.||
|**value** `required`|any|The value of the key.||
### Description

Object containing the descriptions.

#### Attributes

| name | type | description | default value |
| --- | --- | --- | --- |
|**authoritativeDefinitions**|[[AuthoritativeDefinition](#authoritativedefinition)]|List of links to sources that provide more details on the data contract.||
|**customProperties**|[[CustomProperty](#customproperty)]|A list of key/value pairs for custom properties.||
|**limitations**|str|Technical, compliance, and legal limitations for data use.||
|**purpose**|str|Intended purpose for the provided data.||
|**usage**|str|Recommended usage of the data.||
### Extensible

Base schema providing the common extension points shared across ODPS elements: custom properties and authoritative definitions.

#### Attributes

| name | type | description | default value |
| --- | --- | --- | --- |
|**authoritativeDefinitions**|[[AuthoritativeDefinition](#authoritativedefinition)]|List of links to sources that provide more details on the data contract.||
|**customProperties**|[[CustomProperty](#customproperty)]|A list of key/value pairs for custom properties.||
### Taggable

Base schema providing the common extension points shared across ODPS elements: tags, custom properties and authoritative definitions.

#### Attributes

| name | type | description | default value |
| --- | --- | --- | --- |
|**authoritativeDefinitions**|[[AuthoritativeDefinition](#authoritativedefinition)]|List of links to sources that provide more details on the data contract.||
|**customProperties**|[[CustomProperty](#customproperty)]|A list of key/value pairs for custom properties.||
|**tags**|[str]|A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.||
### ManagementPort

Management port for managing the data product.

#### Attributes

| name | type | description | default value |
| --- | --- | --- | --- |
|**authoritativeDefinitions**|[[AuthoritativeDefinition](#authoritativedefinition)]|List of links to sources that provide more details on the data contract.||
|**channel**|str|Channel to communicate with the data product.||
|**content** `required`|str|Content type.||
|**customProperties**|[[CustomProperty](#customproperty)]|A list of key/value pairs for custom properties.||
|**description**|str|Purpose and usage.||
|**name** `required`|str|Endpoint identifier or unique name.||
|**tags**|[str]|A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.||
|**type**|str||"rest"|
|**url**|str|URL to access the endpoint.||
### Sbom

Software Bill of Materials.

#### Attributes

| name | type | description | default value |
| --- | --- | --- | --- |
|**type**|str||"external"|
|**url** `required`|str|URL to the SBOM.||
### InputContract

Input contract dependency.

#### Attributes

| name | type | description | default value |
| --- | --- | --- | --- |
|**id** `required`|str|Contract ID or contractId.||
|**version** `required`|str|Version of the input contract.||
### InputPort

An input port describing expectations.

#### Attributes

| name | type | description | default value |
| --- | --- | --- | --- |
|**authoritativeDefinitions**|[[AuthoritativeDefinition](#authoritativedefinition)]|List of links to sources that provide more details on the data contract.||
|**contractId** `required`|str|Contract ID for the input port.||
|**customProperties**|[[CustomProperty](#customproperty)]|A list of key/value pairs for custom properties.||
|**name** `required`|str|Name of the input port.||
|**tags**|[str]|A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.||
|**version** `required`|str|Version of the input port.||
### OutputPort

An output port describing promises.

#### Attributes

| name | type | description | default value |
| --- | --- | --- | --- |
|**authoritativeDefinitions**|[[AuthoritativeDefinition](#authoritativedefinition)]|List of links to sources that provide more details on the data contract.||
|**contractId**|str|Contract ID for the output port.||
|**customProperties**|[[CustomProperty](#customproperty)]|A list of key/value pairs for custom properties.||
|**description**|str|Human readable short description of the output port.||
|**inputContracts**|[[InputContract](#inputcontract)]|Dependencies or input contracts.||
|**name** `required`|str|Name of the output port.||
|**sbom**|[[Sbom](#sbom)]|The SBOM can/should be at the version level.||
|**tags**|[str]|A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.||
|**type**|str|||
|**version** `required`|str|For each version, a different instance of the output port is listed. The combination of the name and version is the key.||
### Support

Support channel.

#### Attributes

| name | type | description | default value |
| --- | --- | --- | --- |
|**authoritativeDefinitions**|[[AuthoritativeDefinition](#authoritativedefinition)]|List of links to sources that provide more details on the data contract.||
|**channel** `required`|str|Channel name or identifier.||
|**customProperties**|[[CustomProperty](#customproperty)]|A list of key/value pairs for custom properties.||
|**description**|str|Description of the channel, free text.||
|**invitationUrl**|str|Some tools uses invitation URL for requesting or subscribing. Follows the URL scheme.||
|**scope**|str|Scope can be: `interactive`, `announcements`, `issues`.||
|**tags**|[str]|A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.||
|**tool**|str|Name of the tool.||
|**url** `required`|str|Access URL using normal URL scheme (https, mailto, etc.).||
### Team

Team information.

#### Attributes

| name | type | description | default value |
| --- | --- | --- | --- |
|**authoritativeDefinitions**|[[AuthoritativeDefinition](#authoritativedefinition)]|List of links to sources that provide more details on the data contract.||
|**customProperties**|[[CustomProperty](#customproperty)]|A list of key/value pairs for custom properties.||
|**description**|str|Team description.||
|**members**|[[TeamMember](#teammember)]|List of members.||
|**name**|str|Team name.||
|**tags**|[str]|A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.||
### TeamMember

Team member information.

#### Attributes

| name | type | description | default value |
| --- | --- | --- | --- |
|**authoritativeDefinitions**|[[AuthoritativeDefinition](#authoritativedefinition)]|List of links to sources that provide more details on the data contract.||
|**customProperties**|[[CustomProperty](#customproperty)]|A list of key/value pairs for custom properties.||
|**dateIn**|str|The date when the user joined the team, using the ISO 8601 date format (YYYY-MM-DD).||
|**dateOut**|str|The date when the user ceased to be part of the team, using the ISO 8601 date format (YYYY-MM-DD).||
|**description**|str|The user&#39;s description.||
|**name**|str|The user&#39;s name.||
|**replacedByUsername**|str|The username of the user who replaced the previous user.||
|**role**|str|The user&#39;s job role; Examples might be owner, data steward. There is no limit on the role.||
|**tags**|[str]|A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.||
|**username** `required`|str|The user&#39;s username or email.||
<!-- Auto generated by kcl-doc tool, please do not edit. -->
