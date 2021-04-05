import logging
import sys

from pathlib import Path
from typing import Iterable

REPORT_DIR = Path.home() / "public_html/r"

log = logging.getLogger(__name__)


def _r_path(id: int, base: str = "report") -> Path:
    return REPORT_DIR / "{}{}.txt".format(base, id)


def _set_from(id: int, base: str = "raw") -> set:
    with _r_path(id, base).open() as f:
        return set(s.strip() for s in f)


# def _dict_from(id: int, base: str = "raw") -> dict:
#     return dict(s.split("\t") for s in _set_from(id, base))


def _dump(id: int, out: Iterable[str]) -> None:
    p = _r_path(id)

    log.info("Dumping a result to '%s'", p)
    p.write_text("\n".join(out))


def _main() -> None:
    """Main driver, to be run when this module is invoked directly."""
    for id in (int(i) for i in sys.argv[1:]):

        # files on enwp and commons that share a name but are not the same file
        if id == 13:
            log.info("Processing report 13...")
            # c = _dict_from(2)
            c = {}
            with _r_path(5, "raw").open() as f:
                for s in f:
                    title, sha1 = s.strip().split("\t")
                    c[title] = sha1

            log.info("now processing the big file (raw5) for report13")
            out = []
            with _r_path(2, "raw").open() as f:
                for s in f:
                    title, sha1 = s.strip().split("\t")
                    if title in c and c[title] != sha1:
                        out.append(title)

            _dump(id, out)

            # e = _dict_from(5)
            # _dump(id, (k for k in e.keys() if k in c and c[k] != e[k]))

        # orphaned file talk pages on enwp which don't belong to a commons page
        elif id == 16:
            log.info("Processing report 16...")
            l = _set_from(4)
            log.info("now processing the big file (raw1) for report16")
            with _r_path(1, "raw").open() as f:
                for s in f:
                    s = s.strip()
                    if s in l:
                        l.remove(s)

            _dump(id, l)

            # _dump(id, _set_from(4) - _set_from(1))


if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG)
    _main()
