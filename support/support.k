import regex
import common

schema Support(common.Taggable):
    r"""
    Support channel.

    Attributes
    ----------
    channel : str, required
        Channel name or identifier.
    url : str, required
        Access URL using normal URL scheme (https, mailto, etc.).
    description : str, optional
        Description of the channel, free text.
    tool : str, optional
        Name of the tool.
    scope : str, optional
        Scope can be: `interactive`, `announcements`, `issues`.
    invitationUrl : str, optional
        Some tools uses invitation URL for requesting or subscribing. Follows the URL scheme.
    tags : Tags, optional
        A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.
    customProperties : [CustomProperty], optional
        Custom properties block.
    authoritativeDefinitions : [AuthoritativeDefinition], optional
        Authoritative definitions block.
    """
    channel: str
    url: str
    description?: str
    tool?: str
    scope?: str
    invitationUrl?: str

    check:
        regex.match(url, common.urlPattern)
        regex.match(invitationUrl, common.urlPattern) if invitationUrl

