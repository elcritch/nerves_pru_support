; ModuleID = 'softspi_setup_example.cpp'
source_filename = "softspi_setup_example.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"struct.SoftSPI::ClockTimings" = type { i32, i32, i32, i32, i32 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::bitset" = type { %"struct.std::_Base_bitset" }
%"struct.std::_Base_bitset" = type { i64 }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" = type { i8* }
%union.anon = type { i64, [8 x i8] }

$_ZStlsIcSt11char_traitsIcELm32EERSt13basic_ostreamIT_T0_ES6_RKSt6bitsetIXT1_EE = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@__R30 = global i32 0, align 4
@_ZL7timings = internal global %"struct.SoftSPI::ClockTimings" zeroinitializer, align 16
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [19 x i8] c"\0ARunning... mode 0\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"\0ADone: cout: \00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_softspi_setup_example.cpp, i8* null }]

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #0

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #2

; Function Attrs: norecurse nounwind uwtable
define void @_Z12digitalWritejj(i32, i32) local_unnamed_addr #3 {
  %3 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %4 = xor i32 %3, %1
  %5 = and i32 %4, %0
  %6 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %7 = xor i32 %5, %6
  store volatile i32 %7, i32* @__R30, align 4, !tbaa !1
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define zeroext i1 @_Z11digitalReadj(i32) local_unnamed_addr #3 {
  %2 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %3 = and i32 %2, %0
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

; Function Attrs: norecurse nounwind uwtable
define void @_Z13digitalTogglej(i32) local_unnamed_addr #3 {
  %2 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %3 = xor i32 %2, %0
  store volatile i32 %3, i32* @__R30, align 4, !tbaa !1
  ret void
}

; Function Attrs: argmemonly nounwind
declare {}* @llvm.invariant.start.p0i8(i64, i8* nocapture) #4

; Function Attrs: norecurse uwtable
define i32 @main() local_unnamed_addr #5 personality i32 (...)* @__gxx_personality_v0 {
  %1 = alloca %"class.std::bitset", align 8
  %2 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i64 18)
  %3 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !5
  %4 = getelementptr i8, i8* %3, i64 -24
  %5 = bitcast i8* %4 to i64*
  %6 = load i64, i64* %5, align 8
  %7 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %6
  %8 = getelementptr inbounds i8, i8* %7, i64 240
  %9 = bitcast i8* %8 to %"class.std::ctype"**
  %10 = load %"class.std::ctype"*, %"class.std::ctype"** %9, align 8, !tbaa !7
  %11 = icmp eq %"class.std::ctype"* %10, null
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %0
  tail call void @_ZSt16__throw_bad_castv() #9
  unreachable

; <label>:13:                                     ; preds = %0
  %14 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %10, i64 0, i32 8
  %15 = load i8, i8* %14, align 8, !tbaa !11
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %20, label %17

; <label>:17:                                     ; preds = %13
  %18 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %10, i64 0, i32 9, i64 10
  %19 = load i8, i8* %18, align 1, !tbaa !13
  br label %26

; <label>:20:                                     ; preds = %13
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %10)
  %21 = bitcast %"class.std::ctype"* %10 to i8 (%"class.std::ctype"*, i8)***
  %22 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %21, align 8, !tbaa !5
  %23 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %22, i64 6
  %24 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %23, align 8
  %25 = tail call signext i8 %24(%"class.std::ctype"* nonnull %10, i8 signext 10)
  br label %26

; <label>:26:                                     ; preds = %20, %17
  %27 = phi i8 [ %19, %17 ], [ %25, %20 ]
  %28 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %27)
  %29 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %28)
  %30 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %31 = and i32 %30, 7
  %32 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %33 = xor i32 %31, %32
  store volatile i32 %33, i32* @__R30, align 4, !tbaa !1
  %34 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %35 = xor i32 %34, 14
  store volatile i32 %35, i32* @__R30, align 4, !tbaa !1
  %36 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %37 = and i32 %36, 11
  %38 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %39 = xor i32 %38, %37
  %40 = xor i32 %39, 1
  store volatile i32 %40, i32* @__R30, align 4, !tbaa !1
  %41 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %42 = xor i32 %41, 14
  store volatile i32 %42, i32* @__R30, align 4, !tbaa !1
  %43 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %44 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %45 = xor i32 %44, 14
  store volatile i32 %45, i32* @__R30, align 4, !tbaa !1
  %46 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %47 = and i32 %46, 11
  %48 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %49 = xor i32 %48, %47
  store volatile i32 %49, i32* @__R30, align 4, !tbaa !1
  %50 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %51 = xor i32 %50, 14
  store volatile i32 %51, i32* @__R30, align 4, !tbaa !1
  %52 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %53 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %54 = xor i32 %53, 14
  store volatile i32 %54, i32* @__R30, align 4, !tbaa !1
  %55 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %56 = and i32 %55, 11
  %57 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %58 = xor i32 %57, %56
  %59 = xor i32 %58, 1
  store volatile i32 %59, i32* @__R30, align 4, !tbaa !1
  %60 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %61 = xor i32 %60, 14
  store volatile i32 %61, i32* @__R30, align 4, !tbaa !1
  %62 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %63 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %64 = xor i32 %63, 14
  store volatile i32 %64, i32* @__R30, align 4, !tbaa !1
  %65 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %66 = and i32 %65, 11
  %67 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %68 = xor i32 %67, %66
  store volatile i32 %68, i32* @__R30, align 4, !tbaa !1
  %69 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %70 = xor i32 %69, 14
  store volatile i32 %70, i32* @__R30, align 4, !tbaa !1
  %71 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %72 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %73 = xor i32 %72, 14
  store volatile i32 %73, i32* @__R30, align 4, !tbaa !1
  %74 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %75 = and i32 %74, 11
  %76 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %77 = xor i32 %76, %75
  %78 = xor i32 %77, 1
  store volatile i32 %78, i32* @__R30, align 4, !tbaa !1
  %79 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %80 = xor i32 %79, 14
  store volatile i32 %80, i32* @__R30, align 4, !tbaa !1
  %81 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %82 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %83 = xor i32 %82, 14
  store volatile i32 %83, i32* @__R30, align 4, !tbaa !1
  %84 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %85 = and i32 %84, 11
  %86 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %87 = xor i32 %86, %85
  store volatile i32 %87, i32* @__R30, align 4, !tbaa !1
  %88 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %89 = xor i32 %88, 14
  store volatile i32 %89, i32* @__R30, align 4, !tbaa !1
  %90 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %91 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %92 = xor i32 %91, 14
  store volatile i32 %92, i32* @__R30, align 4, !tbaa !1
  %93 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %94 = and i32 %93, 11
  %95 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %96 = xor i32 %95, %94
  %97 = xor i32 %96, 1
  store volatile i32 %97, i32* @__R30, align 4, !tbaa !1
  %98 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %99 = xor i32 %98, 14
  store volatile i32 %99, i32* @__R30, align 4, !tbaa !1
  %100 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %101 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %102 = xor i32 %101, 14
  store volatile i32 %102, i32* @__R30, align 4, !tbaa !1
  %103 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %104 = and i32 %103, 11
  %105 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %106 = xor i32 %105, %104
  store volatile i32 %106, i32* @__R30, align 4, !tbaa !1
  %107 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %108 = xor i32 %107, 14
  store volatile i32 %108, i32* @__R30, align 4, !tbaa !1
  %109 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %110 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %111 = xor i32 %110, 14
  store volatile i32 %111, i32* @__R30, align 4, !tbaa !1
  %112 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %113 = and i32 %112, 7
  %114 = xor i32 %113, 7
  %115 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %116 = xor i32 %114, %115
  store volatile i32 %116, i32* @__R30, align 4, !tbaa !1
  %117 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), i64 13)
  %118 = bitcast %"class.std::bitset"* %1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %118) #2
  %119 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds %"class.std::bitset", %"class.std::bitset"* %1, i64 0, i32 0, i32 0
  store i64 %120, i64* %121, align 8, !tbaa !14
  %122 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsIcSt11char_traitsIcELm32EERSt13basic_ostreamIT_T0_ES6_RKSt6bitsetIXT1_EE(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, %"class.std::bitset"* nonnull dereferenceable(8) %1)
  %123 = bitcast %"class.std::basic_ostream"* %122 to i8**
  %124 = load i8*, i8** %123, align 8, !tbaa !5
  %125 = getelementptr i8, i8* %124, i64 -24
  %126 = bitcast i8* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = bitcast %"class.std::basic_ostream"* %122 to i8*
  %129 = getelementptr inbounds i8, i8* %128, i64 %127
  %130 = getelementptr inbounds i8, i8* %129, i64 240
  %131 = bitcast i8* %130 to %"class.std::ctype"**
  %132 = load %"class.std::ctype"*, %"class.std::ctype"** %131, align 8, !tbaa !7
  %133 = icmp eq %"class.std::ctype"* %132, null
  br i1 %133, label %134, label %135

; <label>:134:                                    ; preds = %26
  call void @_ZSt16__throw_bad_castv() #9
  unreachable

; <label>:135:                                    ; preds = %26
  %136 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %132, i64 0, i32 8
  %137 = load i8, i8* %136, align 8, !tbaa !11
  %138 = icmp eq i8 %137, 0
  br i1 %138, label %142, label %139

; <label>:139:                                    ; preds = %135
  %140 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %132, i64 0, i32 9, i64 10
  %141 = load i8, i8* %140, align 1, !tbaa !13
  br label %148

; <label>:142:                                    ; preds = %135
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %132)
  %143 = bitcast %"class.std::ctype"* %132 to i8 (%"class.std::ctype"*, i8)***
  %144 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %143, align 8, !tbaa !5
  %145 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %144, i64 6
  %146 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %145, align 8
  %147 = call signext i8 %146(%"class.std::ctype"* nonnull %132, i8 signext 10)
  br label %148

; <label>:148:                                    ; preds = %139, %142
  %149 = phi i8 [ %141, %139 ], [ %147, %142 ]
  %150 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %122, i8 signext %149)
  %151 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %150)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %118) #2
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #4

; Function Attrs: uwtable
define linkonce_odr dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsIcSt11char_traitsIcELm32EERSt13basic_ostreamIT_T0_ES6_RKSt6bitsetIXT1_EE(%"class.std::basic_ostream"* dereferenceable(272), %"class.std::bitset"* dereferenceable(8)) local_unnamed_addr #6 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__cxx11::basic_string", align 8
  %4 = alloca %"class.std::locale", align 8
  %5 = bitcast %"class.std::__cxx11::basic_string"* %3 to i8*
  call void @llvm.lifetime.start(i64 32, i8* nonnull %5) #2
  %6 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 2
  %7 = bitcast %"class.std::__cxx11::basic_string"* %3 to %union.anon**
  store %union.anon* %6, %union.anon** %7, align 8, !tbaa !17
  %8 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 1
  store i64 0, i64* %8, align 8, !tbaa !19
  %9 = bitcast %union.anon* %6 to i8*
  store i8 0, i8* %9, align 8, !tbaa !13
  %10 = bitcast %"class.std::locale"* %4 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %10) #2
  %11 = bitcast %"class.std::basic_ostream"* %0 to i8**
  %12 = load i8*, i8** %11, align 8, !tbaa !5
  %13 = getelementptr i8, i8* %12, i64 -24
  %14 = bitcast i8* %13 to i64*
  %15 = load i64, i64* %14, align 8
  %16 = bitcast %"class.std::basic_ostream"* %0 to i8*
  %17 = getelementptr inbounds i8, i8* %16, i64 %15
  %18 = getelementptr inbounds i8, i8* %17, i64 208
  %19 = bitcast i8* %18 to %"class.std::locale"*
  call void @_ZNSt6localeC1ERKS_(%"class.std::locale"* nonnull %4, %"class.std::locale"* dereferenceable(8) %19) #2
  %20 = invoke dereferenceable(576) %"class.std::ctype"* @_ZSt9use_facetISt5ctypeIcEERKT_RKSt6locale(%"class.std::locale"* nonnull dereferenceable(8) %4)
          to label %21 unwind label %83

; <label>:21:                                     ; preds = %2
  call void @_ZNSt6localeD1Ev(%"class.std::locale"* nonnull %4) #2
  call void @llvm.lifetime.end(i64 8, i8* nonnull %10) #2
  %22 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %20, i64 0, i32 8
  %23 = load i8, i8* %22, align 8, !tbaa !11
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %28, label %25

; <label>:25:                                     ; preds = %21
  %26 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %20, i64 0, i32 9, i64 48
  %27 = load i8, i8* %26, align 1, !tbaa !13
  br label %38

; <label>:28:                                     ; preds = %21
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %20)
          to label %29 unwind label %87

; <label>:29:                                     ; preds = %28
  %30 = bitcast %"class.std::ctype"* %20 to i8 (%"class.std::ctype"*, i8)***
  %31 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %30, align 8, !tbaa !5
  %32 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %31, i64 6
  %33 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %32, align 8
  %34 = invoke signext i8 %33(%"class.std::ctype"* nonnull %20, i8 signext 48)
          to label %35 unwind label %87

; <label>:35:                                     ; preds = %29
  %36 = load i8, i8* %22, align 8, !tbaa !11
  %37 = icmp eq i8 %36, 0
  br i1 %37, label %42, label %38

; <label>:38:                                     ; preds = %25, %35
  %39 = phi i8 [ %27, %25 ], [ %34, %35 ]
  %40 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %20, i64 0, i32 9, i64 49
  %41 = load i8, i8* %40, align 1, !tbaa !13
  br label %49

; <label>:42:                                     ; preds = %35
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %20)
          to label %43 unwind label %87

; <label>:43:                                     ; preds = %42
  %44 = bitcast %"class.std::ctype"* %20 to i8 (%"class.std::ctype"*, i8)***
  %45 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %44, align 8, !tbaa !5
  %46 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %45, i64 6
  %47 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %46, align 8
  %48 = invoke signext i8 %47(%"class.std::ctype"* nonnull %20, i8 signext 49)
          to label %49 unwind label %87

; <label>:49:                                     ; preds = %38, %43
  %50 = phi i8 [ %39, %38 ], [ %34, %43 ]
  %51 = phi i8 [ %41, %38 ], [ %48, %43 ]
  %52 = load i64, i64* %8, align 8, !tbaa !19
  %53 = invoke dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE14_M_replace_auxEmmmc(%"class.std::__cxx11::basic_string"* nonnull %3, i64 0, i64 %52, i64 32, i8 signext %50)
          to label %54 unwind label %87

; <label>:54:                                     ; preds = %49
  %55 = getelementptr inbounds %"class.std::bitset", %"class.std::bitset"* %1, i64 0, i32 0, i32 0
  %56 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 0, i32 0
  br label %57

; <label>:57:                                     ; preds = %105, %54
  %58 = phi i64 [ 32, %54 ], [ %69, %105 ]
  %59 = add nsw i64 %58, -1
  %60 = load i64, i64* %55, align 8, !tbaa !14
  %61 = shl i64 1, %59
  %62 = and i64 %61, %60
  %63 = icmp eq i64 %62, 0
  br i1 %63, label %68, label %64

; <label>:64:                                     ; preds = %57
  %65 = sub nuw nsw i64 32, %58
  %66 = load i8*, i8** %56, align 8, !tbaa !21
  %67 = getelementptr inbounds i8, i8* %66, i64 %65
  store i8 %51, i8* %67, align 1, !tbaa !13
  br label %68

; <label>:68:                                     ; preds = %64, %57
  %69 = add nsw i64 %58, -2
  %70 = load i64, i64* %55, align 8, !tbaa !14
  %71 = shl i64 1, %69
  %72 = and i64 %71, %70
  %73 = icmp eq i64 %72, 0
  br i1 %73, label %105, label %101

; <label>:74:                                     ; preds = %105
  %75 = load i8*, i8** %56, align 8, !tbaa !21
  %76 = load i64, i64* %8, align 8, !tbaa !19
  %77 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %0, i8* %75, i64 %76)
          to label %78 unwind label %87

; <label>:78:                                     ; preds = %74
  %79 = load i8*, i8** %56, align 8, !tbaa !21
  %80 = icmp eq i8* %79, %9
  br i1 %80, label %82, label %81

; <label>:81:                                     ; preds = %78
  call void @_ZdlPv(i8* %79) #2
  br label %82

; <label>:82:                                     ; preds = %78, %81
  call void @llvm.lifetime.end(i64 32, i8* nonnull %5) #2
  ret %"class.std::basic_ostream"* %77

; <label>:83:                                     ; preds = %2
  %84 = landingpad { i8*, i32 }
          cleanup
  %85 = extractvalue { i8*, i32 } %84, 0
  %86 = extractvalue { i8*, i32 } %84, 1
  call void @_ZNSt6localeD1Ev(%"class.std::locale"* nonnull %4) #2
  call void @llvm.lifetime.end(i64 8, i8* nonnull %10) #2
  br label %91

; <label>:87:                                     ; preds = %74, %49, %43, %42, %29, %28
  %88 = landingpad { i8*, i32 }
          cleanup
  %89 = extractvalue { i8*, i32 } %88, 0
  %90 = extractvalue { i8*, i32 } %88, 1
  br label %91

; <label>:91:                                     ; preds = %87, %83
  %92 = phi i8* [ %89, %87 ], [ %85, %83 ]
  %93 = phi i32 [ %90, %87 ], [ %86, %83 ]
  %94 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 0, i32 0
  %95 = load i8*, i8** %94, align 8, !tbaa !21
  %96 = icmp eq i8* %95, %9
  br i1 %96, label %98, label %97

; <label>:97:                                     ; preds = %91
  call void @_ZdlPv(i8* %95) #2
  br label %98

; <label>:98:                                     ; preds = %91, %97
  call void @llvm.lifetime.end(i64 32, i8* nonnull %5) #2
  %99 = insertvalue { i8*, i32 } undef, i8* %92, 0
  %100 = insertvalue { i8*, i32 } %99, i32 %93, 1
  resume { i8*, i32 } %100

; <label>:101:                                    ; preds = %68
  %102 = sub i64 33, %58
  %103 = load i8*, i8** %56, align 8, !tbaa !21
  %104 = getelementptr inbounds i8, i8* %103, i64 %102
  store i8 %51, i8* %104, align 1, !tbaa !13
  br label %105

; <label>:105:                                    ; preds = %101, %68
  %106 = icmp eq i64 %69, 0
  br i1 %106, label %74, label %57
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #4

declare i32 @__gxx_personality_v0(...)

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* dereferenceable(272), i8*, i64) local_unnamed_addr #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"*, i8 signext) local_unnamed_addr #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"*) local_unnamed_addr #0

; Function Attrs: noreturn
declare void @_ZSt16__throw_bad_castv() local_unnamed_addr #7

declare void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"*) local_unnamed_addr #0

declare dereferenceable(576) %"class.std::ctype"* @_ZSt9use_facetISt5ctypeIcEERKT_RKSt6locale(%"class.std::locale"* dereferenceable(8)) local_unnamed_addr #0

; Function Attrs: nounwind
declare void @_ZNSt6localeD1Ev(%"class.std::locale"*) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt6localeC1ERKS_(%"class.std::locale"*, %"class.std::locale"* dereferenceable(8)) unnamed_addr #1

declare dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE14_M_replace_auxEmmmc(%"class.std::__cxx11::basic_string"*, i64, i64, i64, i8 signext) local_unnamed_addr #0

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #8

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_softspi_setup_example.cpp() #6 section ".text.startup" {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull @_ZStL8__ioinit)
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #2
  store <4 x i32> <i32 10, i32 0, i32 5, i32 0>, <4 x i32>* bitcast (%"struct.SoftSPI::ClockTimings"* @_ZL7timings to <4 x i32>*), align 16, !tbaa !1, !alias.scope !22
  store i32 5, i32* getelementptr inbounds (%"struct.SoftSPI::ClockTimings", %"struct.SoftSPI::ClockTimings"* @_ZL7timings, i64 0, i32 4), align 16, !tbaa !25, !alias.scope !22
  %2 = tail call {}* @llvm.invariant.start.p0i8(i64 20, i8* bitcast (%"struct.SoftSPI::ClockTimings"* @_ZL7timings to i8*))
  ret void
}

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.1-6 (tags/RELEASE_401/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"vtable pointer", !4, i64 0}
!7 = !{!8, !9, i64 240}
!8 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !9, i64 216, !3, i64 224, !10, i64 225, !9, i64 232, !9, i64 240, !9, i64 248, !9, i64 256}
!9 = !{!"any pointer", !3, i64 0}
!10 = !{!"bool", !3, i64 0}
!11 = !{!12, !3, i64 56}
!12 = !{!"_ZTSSt5ctypeIcE", !9, i64 16, !10, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !3, i64 56, !3, i64 57, !3, i64 313, !3, i64 569}
!13 = !{!3, !3, i64 0}
!14 = !{!15, !16, i64 0}
!15 = !{!"_ZTSSt12_Base_bitsetILm1EE", !16, i64 0}
!16 = !{!"long", !3, i64 0}
!17 = !{!18, !9, i64 0}
!18 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !9, i64 0}
!19 = !{!20, !16, i64 8}
!20 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !18, i64 0, !16, i64 8, !3, i64 16}
!21 = !{!20, !9, i64 0}
!22 = !{!23}
!23 = distinct !{!23, !24, !"_ZN7SoftSPI12ClockTimings29with_sck_cycle_and_pre_delaysEjjj: argument 0"}
!24 = distinct !{!24, !"_ZN7SoftSPI12ClockTimings29with_sck_cycle_and_pre_delaysEjjj"}
!25 = !{!26, !2, i64 16}
!26 = !{!"_ZTSN7SoftSPI12ClockTimingsE", !2, i64 0, !2, i64 4, !2, i64 8, !2, i64 12, !2, i64 16}
