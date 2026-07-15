type Tags = [str]

schema TagsDiscoverable(AuthoritativeCustomizable):
    r"""
    Base schema providing the common extension points shared across ODPS
    elements: tags, custom properties and authoritative definitions.

    Attributes
    ----------
    tags : Tags, optional
        A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.
    customProperties : [CustomProperty], optional
        A list of key/value pairs for custom properties.
    authoritativeDefinitions : [AuthoritativeDefinition], optional
        List of links to sources that provide more details on the data contract.
    """
    tags?: Tags
