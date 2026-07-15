import regex
import common

schema Support(common.TagsDiscoverable):
    """
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

