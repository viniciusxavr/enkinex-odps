import common

schema Team(common.TagsDiscoverable):
    """
    Team information.

    Attributes
    ----------
    name : str, optional
        Team name.
    description : str, optional
        Team description.
    members : [TeamMember], optional
        List of members.
    """
    name?: str
    description?: str
    members?: [TeamMember]

