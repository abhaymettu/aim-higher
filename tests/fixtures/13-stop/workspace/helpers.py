def format_name(first, last):
    return f"{last}, {first}"


def parse_flag(s):
    return s.lower() in ("1", "true", "yes")


def chunk(xs,n):
    return [xs[i:i+n] for i in range(0,len(xs),n)]
