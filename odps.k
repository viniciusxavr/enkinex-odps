import regex
import common
import management
import support
import team
import product.input
import product.output

type KindType = "DataProduct"
type ApiVersionType = "v0.9.0" | "v1.0.0"
type StatusType = "proposed" | "draft" | "active" | "deprecated" | "retired"

schema DataProduct(common.TagsDiscoverable):
    """
    An open data product standard descriptor to enable defining data products.

    Attributes
    ----------
    apiVersion : "v0.9.0" | "v1.0.0", default is "v1.0.0", required
        Version of the standard used to build data product. Default value is v1.0.0.
    kind : "DataProduct", default is "DataProduct", required
        The kind of file this is. Valid value is `DataProduct`.
    id : str, required
        A unique identifier used to reduce the risk of dataset name collisions, such as a UUID.
    name : str, optional
        Name of the data product.
    version : str, optional
        Current version of the data product. Not required, but highly recommended.
    status : "proposed" | "draft" | "active" | "deprecated" | "retired", required
        Current status of the data product.
    domain : str, optional
        Business domain
    tenant : str, optional
        Organization identifier
    description : Description, optional
        Object containing the descriptions.
    inputPorts : [InputPort], optional
        List of objects describing an input port. You need at least one as a data product needs to get data somewhere.
    outputPorts : [OutputPort], optional
        List of objects describing an output port. You need at least one, as a data product without output is useless.
    managementPorts : [ManagementPort], optional
        Management ports define access points for managing the data product.
    support : [Support], optional
        Support and communication channels.
    team : Team, optional
        Team information.
    productCreatedTs : str, optional
        Timestamp in UTC of when the data product was created, using ISO 8601.
    """
    apiVersion: ApiVersionType = "v1.0.0"
    kind: KindType = "DataProduct"
    id: str
    name?: str
    version?: str
    status: StatusType
    domain?: str
    tenant?: str
    description?: common.Description
    inputPorts?: [input.InputPort]
    outputPorts?: [output.OutputPort]
    managementPorts?: [management.ManagementPort]
    support?: [support.Support]
    team?: team.Team
    productCreatedTs?: str

    check:
        regex.match(productCreatedTs, r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\.\d+)?(Z|[+-]\d{2}:\d{2})$") if productCreatedTs

