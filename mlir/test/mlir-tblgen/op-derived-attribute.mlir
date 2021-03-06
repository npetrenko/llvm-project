// RUN: mlir-opt -test-derived-attr -verify-diagnostics %s | FileCheck %s --dump-input-on-failure

// CHECK-LABEL: verifyDerivedAttributes
func @verifyDerivedAttributes() {
  // expected-remark @+2 {{element_dtype = f32}}
  // expected-remark @+1 {{size = 320}}
  %0 = "test.derived_type_attr"() : () -> tensor<10xf32>
  // expected-remark @+2 {{element_dtype = i79}}
  // expected-remark @+1 {{size = 948}}
  %1 = "test.derived_type_attr"() : () -> tensor<12xi79>

  return
}
