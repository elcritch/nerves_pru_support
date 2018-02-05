; ModuleID = 'softspi_setup_example.cpp'
source_filename = "softspi_setup_example.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
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
%"struct.SoftSPI::SpiMaster" = type <{ %"struct.SoftSPI::IOPins", %"struct.SoftSPI::SpiClockToggler", %"struct.SoftSPI::SpiXfer", %"struct.SoftSPI::SpiPack", [6 x i8], i64, i8, [7 x i8] }>
%"struct.SoftSPI::IOPins" = type { i32, i32, i32 }
%"struct.SoftSPI::SpiClockToggler" = type { %"struct.SoftSPI::SpiClock" }
%"struct.SoftSPI::SpiClock" = type { i32 }
%"struct.SoftSPI::SpiXfer" = type { i8 }
%"struct.SoftSPI::SpiPack" = type { i8 }
%"class.std::bitset" = type { %"struct.std::_Base_bitset" }
%"struct.std::_Base_bitset" = type { i64 }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" = type { i8* }
%union.anon = type { i64, [8 x i8] }

$_ZN7SoftSPI9SpiMasterIhLNS_8PolarityE0ELNS_8PollEdgeE0ELNS_8BitOrderE0ENS_15SpiClockTogglerENS_12ClockTimingsILj10ELj5ELj0ELj5ELj0EEEE8transferEjh = comdat any

$_ZStlsIcSt11char_traitsIcELm32EERSt13basic_ostreamIT_T0_ES6_RKSt6bitsetIXT1_EE = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@__R30 = global i32 0, align 4
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [19 x i8] c"\0ARunning... mode 0\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"\0ADone: cout: \00", align 1
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

; Function Attrs: norecurse uwtable
define i32 @main() local_unnamed_addr #4 personality i32 (...)* @__gxx_personality_v0 {
  %1 = alloca %"struct.SoftSPI::SpiMaster", align 8
  %2 = alloca %"class.std::bitset", align 8
  %3 = bitcast %"struct.SoftSPI::SpiMaster"* %1 to i8*
  call void @llvm.lifetime.start(i64 40, i8* nonnull %3) #2
  %4 = bitcast %"struct.SoftSPI::SpiMaster"* %1 to i64*
  store i64 47244640266, i64* %4, align 8
  %5 = getelementptr inbounds %"struct.SoftSPI::SpiMaster", %"struct.SoftSPI::SpiMaster"* %1, i64 0, i32 0, i32 2
  store i32 14, i32* %5, align 8
  %6 = getelementptr inbounds %"struct.SoftSPI::SpiMaster", %"struct.SoftSPI::SpiMaster"* %1, i64 0, i32 1, i32 0, i32 0
  store i32 14, i32* %6, align 4, !tbaa !5
  %7 = getelementptr inbounds %"struct.SoftSPI::SpiMaster", %"struct.SoftSPI::SpiMaster"* %1, i64 0, i32 5
  store i64 0, i64* %7, align 8, !tbaa !7
  %8 = getelementptr inbounds %"struct.SoftSPI::SpiMaster", %"struct.SoftSPI::SpiMaster"* %1, i64 0, i32 6
  store i8 8, i8* %8, align 8, !tbaa !14
  %9 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i64 18)
  %10 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !15
  %11 = getelementptr i8, i8* %10, i64 -24
  %12 = bitcast i8* %11 to i64*
  %13 = load i64, i64* %12, align 8
  %14 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %13
  %15 = getelementptr inbounds i8, i8* %14, i64 240
  %16 = bitcast i8* %15 to %"class.std::ctype"**
  %17 = load %"class.std::ctype"*, %"class.std::ctype"** %16, align 8, !tbaa !17
  %18 = icmp eq %"class.std::ctype"* %17, null
  br i1 %18, label %19, label %20

; <label>:19:                                     ; preds = %0
  tail call void @_ZSt16__throw_bad_castv() #9
  unreachable

; <label>:20:                                     ; preds = %0
  %21 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %17, i64 0, i32 8
  %22 = load i8, i8* %21, align 8, !tbaa !21
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %27, label %24

; <label>:24:                                     ; preds = %20
  %25 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %17, i64 0, i32 9, i64 10
  %26 = load i8, i8* %25, align 1, !tbaa !23
  br label %33

; <label>:27:                                     ; preds = %20
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %17)
  %28 = bitcast %"class.std::ctype"* %17 to i8 (%"class.std::ctype"*, i8)***
  %29 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %28, align 8, !tbaa !15
  %30 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %29, i64 6
  %31 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %30, align 8
  %32 = tail call signext i8 %31(%"class.std::ctype"* nonnull %17, i8 signext 10)
  br label %33

; <label>:33:                                     ; preds = %24, %27
  %34 = phi i8 [ %26, %24 ], [ %32, %27 ]
  %35 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %34)
  %36 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %35)
  %37 = call zeroext i8 @_ZN7SoftSPI9SpiMasterIhLNS_8PolarityE0ELNS_8PollEdgeE0ELNS_8BitOrderE0ENS_15SpiClockTogglerENS_12ClockTimingsILj10ELj5ELj0ELj5ELj0EEEE8transferEjh(%"struct.SoftSPI::SpiMaster"* nonnull %1, i32 7, i8 zeroext -86)
  %38 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i64 13)
  %39 = bitcast %"class.std::bitset"* %2 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %39) #2
  %40 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds %"class.std::bitset", %"class.std::bitset"* %2, i64 0, i32 0, i32 0
  store i64 %41, i64* %42, align 8, !tbaa !24
  %43 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsIcSt11char_traitsIcELm32EERSt13basic_ostreamIT_T0_ES6_RKSt6bitsetIXT1_EE(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, %"class.std::bitset"* nonnull dereferenceable(8) %2)
  %44 = bitcast %"class.std::basic_ostream"* %43 to i8**
  %45 = load i8*, i8** %44, align 8, !tbaa !15
  %46 = getelementptr i8, i8* %45, i64 -24
  %47 = bitcast i8* %46 to i64*
  %48 = load i64, i64* %47, align 8
  %49 = bitcast %"class.std::basic_ostream"* %43 to i8*
  %50 = getelementptr inbounds i8, i8* %49, i64 %48
  %51 = getelementptr inbounds i8, i8* %50, i64 240
  %52 = bitcast i8* %51 to %"class.std::ctype"**
  %53 = load %"class.std::ctype"*, %"class.std::ctype"** %52, align 8, !tbaa !17
  %54 = icmp eq %"class.std::ctype"* %53, null
  br i1 %54, label %55, label %56

; <label>:55:                                     ; preds = %33
  call void @_ZSt16__throw_bad_castv() #9
  unreachable

; <label>:56:                                     ; preds = %33
  %57 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %53, i64 0, i32 8
  %58 = load i8, i8* %57, align 8, !tbaa !21
  %59 = icmp eq i8 %58, 0
  br i1 %59, label %63, label %60

; <label>:60:                                     ; preds = %56
  %61 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %53, i64 0, i32 9, i64 10
  %62 = load i8, i8* %61, align 1, !tbaa !23
  br label %69

; <label>:63:                                     ; preds = %56
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %53)
  %64 = bitcast %"class.std::ctype"* %53 to i8 (%"class.std::ctype"*, i8)***
  %65 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %64, align 8, !tbaa !15
  %66 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %65, i64 6
  %67 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %66, align 8
  %68 = call signext i8 %67(%"class.std::ctype"* nonnull %53, i8 signext 10)
  br label %69

; <label>:69:                                     ; preds = %60, %63
  %70 = phi i8 [ %62, %60 ], [ %68, %63 ]
  %71 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %43, i8 signext %70)
  %72 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %71)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %39) #2
  call void @llvm.lifetime.end(i64 40, i8* nonnull %3) #2
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #5

; Function Attrs: norecurse uwtable
define linkonce_odr zeroext i8 @_ZN7SoftSPI9SpiMasterIhLNS_8PolarityE0ELNS_8PollEdgeE0ELNS_8BitOrderE0ENS_15SpiClockTogglerENS_12ClockTimingsILj10ELj5ELj0ELj5ELj0EEEE8transferEjh(%"struct.SoftSPI::SpiMaster"*, i32, i8 zeroext) local_unnamed_addr #4 comdat align 2 {
  %4 = getelementptr inbounds %"struct.SoftSPI::SpiMaster", %"struct.SoftSPI::SpiMaster"* %0, i64 0, i32 6
  %5 = load i8, i8* %4, align 8, !tbaa !14
  %6 = zext i8 %5 to i64
  %7 = alloca i8, i64 %6, align 16
  %8 = getelementptr inbounds %"struct.SoftSPI::SpiMaster", %"struct.SoftSPI::SpiMaster"* %0, i64 0, i32 5
  %9 = load i64, i64* %8, align 8, !tbaa !7
  %10 = add i64 %9, 1
  store i64 %10, i64* %8, align 8, !tbaa !7
  %11 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %12 = and i32 %11, %1
  %13 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %14 = xor i32 %12, %13
  store volatile i32 %14, i32* @__R30, align 4, !tbaa !1
  %15 = getelementptr inbounds %"struct.SoftSPI::SpiMaster", %"struct.SoftSPI::SpiMaster"* %0, i64 0, i32 1, i32 0, i32 0
  %16 = load i32, i32* %15, align 4, !tbaa !5
  %17 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %18 = xor i32 %17, %16
  store volatile i32 %18, i32* @__R30, align 4, !tbaa !1
  %19 = icmp eq i8 %5, 0
  br i1 %19, label %76, label %20

; <label>:20:                                     ; preds = %3
  %21 = zext i8 %2 to i32
  %22 = bitcast %"struct.SoftSPI::SpiMaster"* %0 to i64*
  %23 = load i64, i64* %22, align 4
  %24 = zext i8 %5 to i32
  %25 = shl nuw nsw i32 %24, 4
  %26 = lshr i64 %23, 32
  %27 = trunc i64 %26 to i32
  %28 = trunc i64 %23 to i32
  br label %29

; <label>:29:                                     ; preds = %20, %29
  %30 = phi i8 [ 0, %20 ], [ %51, %29 ]
  %31 = zext i8 %30 to i32
  %32 = lshr i32 %25, %31
  %33 = and i32 %32, %21
  %34 = icmp ne i32 %33, 0
  %35 = zext i1 %34 to i32
  %36 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %37 = xor i32 %36, %35
  %38 = and i32 %37, %27
  %39 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %40 = xor i32 %38, %39
  store volatile i32 %40, i32* @__R30, align 4, !tbaa !1
  %41 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %42 = xor i32 %41, %16
  store volatile i32 %42, i32* @__R30, align 4, !tbaa !1
  %43 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %44 = and i32 %43, %28
  %45 = icmp ne i32 %44, 0
  %46 = zext i1 %45 to i8
  %47 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %48 = xor i32 %47, %16
  store volatile i32 %48, i32* @__R30, align 4, !tbaa !1
  %49 = zext i8 %30 to i64
  %50 = getelementptr inbounds i8, i8* %7, i64 %49
  store i8 %46, i8* %50, align 1, !tbaa !23
  %51 = add i8 %30, 1
  %52 = icmp ult i8 %51, %5
  br i1 %52, label %29, label %53

; <label>:53:                                     ; preds = %29
  %54 = load i8, i8* %7, align 16, !tbaa !23
  %55 = getelementptr inbounds i8, i8* %7, i64 1
  %56 = load i8, i8* %55, align 1, !tbaa !23
  %57 = getelementptr inbounds i8, i8* %7, i64 2
  %58 = load i8, i8* %57, align 2, !tbaa !23
  %59 = getelementptr inbounds i8, i8* %7, i64 3
  %60 = load i8, i8* %59, align 1, !tbaa !23
  %61 = getelementptr inbounds i8, i8* %7, i64 4
  %62 = load i8, i8* %61, align 4, !tbaa !23
  %63 = getelementptr inbounds i8, i8* %7, i64 5
  %64 = load i8, i8* %63, align 1, !tbaa !23
  %65 = getelementptr inbounds i8, i8* %7, i64 6
  %66 = load i8, i8* %65, align 2, !tbaa !23
  %67 = getelementptr inbounds i8, i8* %7, i64 7
  %68 = load i8, i8* %67, align 1, !tbaa !23
  %69 = shl i8 %54, 7
  %70 = shl i8 %56, 6
  %71 = shl i8 %58, 5
  %72 = shl i8 %60, 4
  %73 = shl i8 %62, 3
  %74 = shl i8 %64, 2
  %75 = shl i8 %66, 1
  br label %76

; <label>:76:                                     ; preds = %3, %53
  %77 = phi i8 [ %68, %53 ], [ undef, %3 ]
  %78 = phi i8 [ %75, %53 ], [ 0, %3 ]
  %79 = phi i8 [ %74, %53 ], [ 0, %3 ]
  %80 = phi i8 [ %73, %53 ], [ 0, %3 ]
  %81 = phi i8 [ %72, %53 ], [ 0, %3 ]
  %82 = phi i8 [ %71, %53 ], [ 0, %3 ]
  %83 = phi i8 [ %70, %53 ], [ 0, %3 ]
  %84 = phi i8 [ %69, %53 ], [ 0, %3 ]
  %85 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %86 = xor i32 %85, -1
  %87 = and i32 %86, %1
  %88 = load volatile i32, i32* @__R30, align 4, !tbaa !1
  %89 = xor i32 %87, %88
  store volatile i32 %89, i32* @__R30, align 4, !tbaa !1
  %90 = or i8 %83, %84
  %91 = or i8 %90, %82
  %92 = or i8 %91, %81
  %93 = or i8 %92, %80
  %94 = or i8 %93, %79
  %95 = or i8 %94, %78
  %96 = or i8 %95, %77
  ret i8 %96
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsIcSt11char_traitsIcELm32EERSt13basic_ostreamIT_T0_ES6_RKSt6bitsetIXT1_EE(%"class.std::basic_ostream"* dereferenceable(272), %"class.std::bitset"* dereferenceable(8)) local_unnamed_addr #6 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__cxx11::basic_string", align 8
  %4 = alloca %"class.std::locale", align 8
  %5 = bitcast %"class.std::__cxx11::basic_string"* %3 to i8*
  call void @llvm.lifetime.start(i64 32, i8* nonnull %5) #2
  %6 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 2
  %7 = bitcast %"class.std::__cxx11::basic_string"* %3 to %union.anon**
  store %union.anon* %6, %union.anon** %7, align 8, !tbaa !26
  %8 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 1
  store i64 0, i64* %8, align 8, !tbaa !28
  %9 = bitcast %union.anon* %6 to i8*
  store i8 0, i8* %9, align 8, !tbaa !23
  %10 = bitcast %"class.std::locale"* %4 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %10) #2
  %11 = bitcast %"class.std::basic_ostream"* %0 to i8**
  %12 = load i8*, i8** %11, align 8, !tbaa !15
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
  %23 = load i8, i8* %22, align 8, !tbaa !21
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %28, label %25

; <label>:25:                                     ; preds = %21
  %26 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %20, i64 0, i32 9, i64 48
  %27 = load i8, i8* %26, align 1, !tbaa !23
  br label %38

; <label>:28:                                     ; preds = %21
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %20)
          to label %29 unwind label %87

; <label>:29:                                     ; preds = %28
  %30 = bitcast %"class.std::ctype"* %20 to i8 (%"class.std::ctype"*, i8)***
  %31 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %30, align 8, !tbaa !15
  %32 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %31, i64 6
  %33 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %32, align 8
  %34 = invoke signext i8 %33(%"class.std::ctype"* nonnull %20, i8 signext 48)
          to label %35 unwind label %87

; <label>:35:                                     ; preds = %29
  %36 = load i8, i8* %22, align 8, !tbaa !21
  %37 = icmp eq i8 %36, 0
  br i1 %37, label %42, label %38

; <label>:38:                                     ; preds = %25, %35
  %39 = phi i8 [ %27, %25 ], [ %34, %35 ]
  %40 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %20, i64 0, i32 9, i64 49
  %41 = load i8, i8* %40, align 1, !tbaa !23
  br label %49

; <label>:42:                                     ; preds = %35
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %20)
          to label %43 unwind label %87

; <label>:43:                                     ; preds = %42
  %44 = bitcast %"class.std::ctype"* %20 to i8 (%"class.std::ctype"*, i8)***
  %45 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %44, align 8, !tbaa !15
  %46 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %45, i64 6
  %47 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %46, align 8
  %48 = invoke signext i8 %47(%"class.std::ctype"* nonnull %20, i8 signext 49)
          to label %49 unwind label %87

; <label>:49:                                     ; preds = %38, %43
  %50 = phi i8 [ %39, %38 ], [ %34, %43 ]
  %51 = phi i8 [ %41, %38 ], [ %48, %43 ]
  %52 = load i64, i64* %8, align 8, !tbaa !28
  %53 = invoke dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE14_M_replace_auxEmmmc(%"class.std::__cxx11::basic_string"* nonnull %3, i64 0, i64 %52, i64 32, i8 signext %50)
          to label %54 unwind label %87

; <label>:54:                                     ; preds = %49
  %55 = getelementptr inbounds %"class.std::bitset", %"class.std::bitset"* %1, i64 0, i32 0, i32 0
  %56 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 0, i32 0
  br label %57

; <label>:57:                                     ; preds = %105, %54
  %58 = phi i64 [ 32, %54 ], [ %69, %105 ]
  %59 = add nsw i64 %58, -1
  %60 = load i64, i64* %55, align 8, !tbaa !24
  %61 = shl i64 1, %59
  %62 = and i64 %61, %60
  %63 = icmp eq i64 %62, 0
  br i1 %63, label %68, label %64

; <label>:64:                                     ; preds = %57
  %65 = sub nuw nsw i64 32, %58
  %66 = load i8*, i8** %56, align 8, !tbaa !30
  %67 = getelementptr inbounds i8, i8* %66, i64 %65
  store i8 %51, i8* %67, align 1, !tbaa !23
  br label %68

; <label>:68:                                     ; preds = %64, %57
  %69 = add nsw i64 %58, -2
  %70 = load i64, i64* %55, align 8, !tbaa !24
  %71 = shl i64 1, %69
  %72 = and i64 %71, %70
  %73 = icmp eq i64 %72, 0
  br i1 %73, label %105, label %101

; <label>:74:                                     ; preds = %105
  %75 = load i8*, i8** %56, align 8, !tbaa !30
  %76 = load i64, i64* %8, align 8, !tbaa !28
  %77 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %0, i8* %75, i64 %76)
          to label %78 unwind label %87

; <label>:78:                                     ; preds = %74
  %79 = load i8*, i8** %56, align 8, !tbaa !30
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
  %95 = load i8*, i8** %94, align 8, !tbaa !30
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
  %103 = load i8*, i8** %56, align 8, !tbaa !30
  %104 = getelementptr inbounds i8, i8* %103, i64 %102
  store i8 %51, i8* %104, align 1, !tbaa !23
  br label %105

; <label>:105:                                    ; preds = %101, %68
  %106 = icmp eq i64 %69, 0
  br i1 %106, label %74, label %57
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #5

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
  ret void
}

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
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
!5 = !{!6, !2, i64 0}
!6 = !{!"_ZTSN7SoftSPI8SpiClockILNS_8PolarityE0EEE", !2, i64 0}
!7 = !{!8, !13, i64 24}
!8 = !{!"_ZTSN7SoftSPI9SpiMasterIhLNS_8PolarityE0ELNS_8PollEdgeE0ELNS_8BitOrderE0ENS_15SpiClockTogglerENS_12ClockTimingsILj10ELj5ELj0ELj5ELj0EEEEE", !9, i64 0, !10, i64 12, !11, i64 16, !12, i64 17, !13, i64 24, !3, i64 32}
!9 = !{!"_ZTSN7SoftSPI6IOPinsE", !2, i64 0, !2, i64 4, !2, i64 8}
!10 = !{!"_ZTSN7SoftSPI15SpiClockTogglerILNS_8PolarityE0EEE"}
!11 = !{!"_ZTSN7SoftSPI7SpiXferILNS_8PollEdgeE0EEE"}
!12 = !{!"_ZTSN7SoftSPI7SpiPackILNS_8BitOrderE0EEE"}
!13 = !{!"long", !3, i64 0}
!14 = !{!8, !3, i64 32}
!15 = !{!16, !16, i64 0}
!16 = !{!"vtable pointer", !4, i64 0}
!17 = !{!18, !19, i64 240}
!18 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !19, i64 216, !3, i64 224, !20, i64 225, !19, i64 232, !19, i64 240, !19, i64 248, !19, i64 256}
!19 = !{!"any pointer", !3, i64 0}
!20 = !{!"bool", !3, i64 0}
!21 = !{!22, !3, i64 56}
!22 = !{!"_ZTSSt5ctypeIcE", !19, i64 16, !20, i64 24, !19, i64 32, !19, i64 40, !19, i64 48, !3, i64 56, !3, i64 57, !3, i64 313, !3, i64 569}
!23 = !{!3, !3, i64 0}
!24 = !{!25, !13, i64 0}
!25 = !{!"_ZTSSt12_Base_bitsetILm1EE", !13, i64 0}
!26 = !{!27, !19, i64 0}
!27 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !19, i64 0}
!28 = !{!29, !13, i64 8}
!29 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !27, i64 0, !13, i64 8, !3, i64 16}
!30 = !{!29, !19, i64 0}
