type KindType = "DataProduct"
type ApiVersionType = "v1.0.0"
type StatusType = "proposed" | "draft" | "active" | "deprecated" | "retired"

schema DataProduct:
    """
    An open data product standard descriptor to enable defining data products.

    Attributes
    ----------
    apiVersion: ApiVersionType, default is "v1.0.0", required.
        Version of the standard used to build data product.
    kind: KindType, default is "DataProduct", required.
        The kind of file this is.
        Valid value is `DataProduct`.
    id: str, default is Undefined, required.
        A unique identifier used to reduce the risk of dataset name collisions, such as a UUID.
    name: str, default is Undefined, optional.
        Name of the data product.
    version: str, default is Undefined, required.
        Current version of the data product.
        Not required, but highly recommended.
    status: StatusType, default is Undefined, required.
        Current status of the data product.
        One of "proposed", "draft", "active", "deprecated", "retired".
    tenant: str, default is Undefined, optional.
        Organization identifier.
    domain: str, default is Undefined, optional.
        Business domain.
    """
    apiVersion: ApiVersionType = "v1.0.0"
    kind: KindType = "DataProduct"
    id: str
    name?: str
    version: str
    status: StatusType
    tenant?: str
    domain?: str

    check:
        len(version) > 0, "version must not be empty"
        len(id) > 0, "id must not be empty"
