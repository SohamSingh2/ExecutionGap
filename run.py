import sys

from execution_gap.cli import main as cli_main
from execution_gap.web import main as web_main


if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "web":
        sys.argv.pop(1)
        web_main()
    else:
        cli_main()
