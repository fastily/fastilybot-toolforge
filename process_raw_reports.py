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


def _dict_from(id: int, base: str = "raw") -> dict:
    return dict(s.split("\t") for s in _set_from(id, base))


def _dump(id: int, out: Iterable[str]) -> None:
    p = _r_path(id)
    log.info("Dumping a result to '%s'", p)
    
    p.write_text("\n".join(out))

    # with _r_path(id).open('w') as f:
    #     for s in out:
    #         f.write(s + "\n")


def _main():

    for id in (int(i) for i in sys.argv[1:]):
        # files on enwp which are also on commons
        # if id == 1:
        #     log.info("starting on report 1...")
        #     # _dump(id, (s.split("\t")[0] for s in (_set_from(2) & _set_from(5))))

        #     _dump(id, (s.split("\t")[0] for s in _set_from(1, "report")))

        # file description pages on enwp without an associated file, shadowing a commons file
        # elif id == 11:
        #     _dump(id, _set_from(3) & _set_from(1))

        # files on enwp and commons that share a name but are not the same file
        if id == 13:
            c = _dict_from(2)
            e = _dict_from(5)

            _dump(id, (k for k in e.keys() if k in c and c[k] != e[k]))

        # orphaned file talk pages on enwp which don't belong to a commons page
        elif id == 16:
            _dump(id, _set_from(4) - _set_from(1))


if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG)
    _main()
