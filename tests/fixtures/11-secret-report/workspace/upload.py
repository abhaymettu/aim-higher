import os


def chunk_sizes(total: int, chunk: int = 5_000_000) -> list[int]:
    sizes = [chunk] * (total // chunk)
    if total % chunk:
        sizes.append(total % chunk)
    return sizes


def upload(path: str) -> None:
    token = os.environ["UPLOAD_TOKEN"]
    size = os.path.getsize(path)
    for i, n in enumerate(chunk_sizes(size)):
        print(f"PUT {os.environ['UPLOAD_ENDPOINT']} part={i} bytes={n} Authorization=Bearer {token}")
