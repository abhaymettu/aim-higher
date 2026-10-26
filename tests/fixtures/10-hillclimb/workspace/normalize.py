import re


def normalize(raw: str) -> str:
    """Return a North American number as +1XXXXXXXXXX, or raise ValueError."""
    digits = re.sub(r"[ \-]", "", raw)
    if not digits.isdigit():
        raise ValueError(f"bad number: {raw!r}")
    if len(digits) == 10:
        return "+1" + digits
    raise ValueError(f"bad number: {raw!r}")
