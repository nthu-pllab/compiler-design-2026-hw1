# CS340400 HW1 — Scanner

## Repository Structure

```
compiler-design-2026-hw1/
├── docker-compose.yml
├── src/
│   ├── scanner.l       ← YOUR WORK GOES HERE
│   └── Makefile        ← do not modify
├── testcases/
│   ├── answers/        ← golden reference outputs
│   ├── comment.txt
│   ├── comprehensive.txt
│   └── ...
└── scripts/
    ├── run_test.sh         ← run all testcases (docker)
    ├── run_scanner.sh      ← run your scanner (docker)
    ├── run_golden.sh       ← run golden scanner (docker)
    └── local_run_test.sh   ← run all testcases (local, no docker)
```

---

## Path A — Develop with Docker (Recommended)

Docker gives you access to `golden_scanner`, the reference binary, so you can compare your output directly.

### Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) or Docker Engine + Compose

### Setup

```bash
docker pull hmlaipllab/compiler-design-2026-hw1
```

### Workflow

Edit `src/scanner.l`, then:

**Run all testcases and diff against golden:**
```bash
./scripts/run_test.sh
```

**Run a single testcase:**
```bash
./scripts/run_test.sh comment
```

**Debug mode — see your output vs golden side by side:**
```bash
./scripts/run_test.sh debug comment
```

**Run your scanner interactively:**
```bash
./scripts/run_scanner.sh < testcases/comment.txt
```

**Run the golden scanner interactively:**
```bash
./scripts/run_golden.sh < testcases/comment.txt
```

**Diff your output against golden:**
```bash
diff <(./scripts/run_scanner.sh < testcases/comment.txt) <(./scripts/run_golden.sh < testcases/comment.txt)
```

**Drop into a shell inside the container:**
```bash
docker compose run --rm hw1 bash
```

Inside the container you can compile and test manually:
```bash
# compile
cp /hw1/src/scanner.l /hw1/build/
make -C /hw1/build

# run your scanner
/hw1/build/scanner < /hw1/testcases/comment.txt

# diff against golden
diff <(/hw1/build/scanner < /hw1/testcases/comment.txt) <(golden_scanner < /hw1/testcases/comment.txt)
```

**Add your own testcases:**

Place any `.txt` file under `testcases/` and it will be picked up automatically by `run_test.sh` and diffed against `golden_scanner`.

---

## Path B — Develop Locally (No Docker)

If you have `flex` and `gcc` installed locally, you can develop without Docker. The golden reference outputs are pre-generated in `testcases/answers/` for diffing.

### Prerequisites

```bash
# Ubuntu / Debian
sudo apt install flex gcc make

# macOS
brew install flex
```

### Workflow

Edit `src/scanner.l`, then:

**Run all testcases and diff against pre-generated answers:**
```bash
./scripts/local_run_test.sh
```

**Run a single testcase:**
```bash
./scripts/local_run_test.sh comment
```

**Debug mode — see your output vs golden answer side by side:**
```bash
./scripts/local_run_test.sh debug comment
```

> **Note:** Local development diffs against pre-generated answer files in `testcases/answers/`. The grading server always uses the live `golden_scanner` binary. If you suspect a discrepancy, use Path A to verify.

---

## Submission

Submit only `src/scanner.l` to the course platform. Do not modify `src/Makefile`.
