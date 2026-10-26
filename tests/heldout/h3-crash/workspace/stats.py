def mean_of_column(path: str, col: int) -> float:
    total = 0.0
    count = 0
    with open(path) as fh:
        next(fh)
        for line in fh:
            total += float(line.split(",")[col])
            count += 1
    return total / count
