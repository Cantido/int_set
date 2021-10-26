# SPDX-FileCopyrightText: 2021 Rosa Richter
#
# SPDX-License-Identifier: MIT

[
  tools: [
    {:audit, "mix hex.audit"},
    {:licenses, "mix licenses.lint --reuse"},
    {:reuse, ["reuse", "lint"]}
  ]
]
