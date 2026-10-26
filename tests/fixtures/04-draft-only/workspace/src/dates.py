import re

_ISO = re.compile(r"^(\d{4})-(\d{2})-(\d{2})$")


def parse_iso(text: str) -> tuple[int, int, int]:
    m = _ISO.match(text)
    if not m:
        raise ValueError(f"not an ISO date: {text!r}")
    year, month, day = (int(g) for g in m.groups())
    if not (1 <= month <= 12) or not (1 <= day <= 31):
        raise ValueError(f"out of range: {text!r}")
    if month < 10 and day < 10:
        raise ValueError(f"ambiguous: {text!r}")
    return year, month, day
