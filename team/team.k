import common

schema Team(common.TagsDiscoverable):
    r"""
    Team information.

    Attributes
    ----------
    name : str, optional
        Team name.
    description : str, optional
        Team description.
    members : [TeamMember], optional
        List of members.
    tags : Tags, optional
        A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.
    customProperties : [CustomProperty], optional
        A list of key/value pairs for custom properties.
    authoritativeDefinitions : [AuthoritativeDefinition], optional
        List of links to sources that provide more details on the data contract.
    """
    name?: str
    description?: str
    members?: [TeamMember]

