"""Methods for processing raw database reports"""

import argparse
import logging

from pathlib import Path
from typing import Iterable

REPORT_DIR = Path.home() / "public_html/r"

log = logging.getLogger(__name__)


def _r_path(id: int, base: str = "raw") -> Path:
    """Gets the report `Path` for a report with the specified id.

    Args:
        id (int): The id number of the report to retrieve.
        base (str, optional): The prefix of the report. Defaults to "raw".

    Returns:
        Path: The `Path` pointing to the report with the specified prefix and id.
    """
    # return REPORT_DIR / f"{base}{id}.txt"
    return REPORT_DIR / "{}{}.txt".format(base, id)


def _dump(id: int, out: Iterable[str]) -> None:
    """Saves `out` as a newline deliminated file with the specified report `id`.

    Args:
        id (int): The report id number to save `out` as.
        out (Iterable[str]): The Iterable to save
    """
    p = _r_path(id, "report")

    log.info("Dumping a result to '%s'", p)
    p.write_text("\n".join(out))


def _main() -> None:
    """Main driver, to be run when this module is invoked directly."""
    cli_parser = argparse.ArgumentParser(description="CLI for processing raw reports")
    cli_parser.add_argument('report_ids', type=int, nargs='*', help='the report ids to process down from raw data')
    args = cli_parser.parse_args()

    if not args.report_ids:
        cli_parser.print_help()
        return

    # configure logging
    handler = logging.StreamHandler()
    handler.setFormatter(logging.Formatter("{asctime}: {levelname}: {message}", "%Y-%m-%d %H:%M:%S", "{"))
    log.addHandler(handler)
    log.setLevel("DEBUG")

    for id in args.report_ids:

        # files on enwp and commons that share a name but are not the same file
        if id == 13:
            log.info("Processing report 13...")
            c = {}
            with _r_path(5).open() as f:
                for s in f:
                    title, sha1 = s.strip().split("\t")
                    c[title] = sha1

            log.info("now processing the big file (raw5) for report13")
            out = []
            with _r_path(2).open() as f:
                for s in f:
                    title, sha1 = s.strip().split("\t")
                    if title in c and c[title] != sha1:
                        out.append(title)

            _dump(id, out)

        # orphaned file talk pages on enwp which don't belong to a commons page
        elif id == 16:
            log.info("Processing report 16...")
            with _r_path(4).open() as f:
                l = set(s.strip() for s in f)

            log.info("now processing the big file (raw1) for report16")
            with _r_path(1).open() as f:
                for s in f:
                    s = s.strip()
                    if s in l:
                    # if (s := s.strip()) in l:
                        l.remove(s)

            _dump(id, l)


if __name__ == "__main__":
    _main()
