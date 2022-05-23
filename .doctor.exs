# SPDX-FileCopyrightText: 2022 Rosa Richter
#
# SPDX-License-Identifier: MIT

%Doctor.Config{
  exception_moduledoc_required: true,
  failed: false,
  ignore_modules: [
    Collectable.IntSet,
    Enumerable.IntSet,
    Inspect.IntSet
  ],
  ignore_paths: [],
  min_module_doc_coverage: 40,
  min_module_spec_coverage: 0,
  min_overall_doc_coverage: 50,
  min_overall_spec_coverage: 0,
  moduledoc_required: true,
  raise: false,
  reporter: Doctor.Reporters.Full,
  struct_type_spec_required: false,
  umbrella: false
}
