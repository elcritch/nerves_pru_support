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
%"struct.SoftSPI::SpiMaster" = type { %"struct.SoftSPI::IOPins", %"struct.SoftSPI::ClockTimings", %"struct.SoftSPI::SpiClockToggler", i32 }
%"struct.SoftSPI::IOPins" = type { i32, i32, i32 }
%"struct.SoftSPI::ClockTimings" = type { i32, i32, i32, i32, i32 }
%"struct.SoftSPI::SpiClockToggler" = type { %"struct.SoftSPI::SpiClock" }
%"struct.SoftSPI::SpiClock" = type { i32, %"struct.SoftSPI::ClockTimings" }

$_ZN7SoftSPI9SpiMasterIhLNS_8PolarityE0ELNS_8PollEdgeE0ELNS_8BitOrderE0ENS_15SpiClockTogglerEE8transferEjh = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@__R30 = global i32 0, align 4
@__R31 = global i32 0, align 4
@_ZZN7SoftSPI7SpiPackILNS_8BitOrderE0EE4maskEhhE4mask = private unnamed_addr constant [8 x i8] c"\80@ \10\08\04\02\01", align 1
@_ZZN7SoftSPI7SpiPackILNS_8BitOrderE1EE4maskEhhE4mask = private unnamed_addr constant [8 x i8] c"\01\02\04\08\10 @\80", align 1
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [19 x i8] c"\0ARunning... mode 0\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"\0ADone: cout: \00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_softspi_setup_example.cpp, i8* null }]

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #0

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #2

; Function Attrs: norecurse nounwind readnone uwtable
define zeroext i8 @_ZN7SoftSPI7SpiPackILNS_8BitOrderE0EE4maskEhh(i8 zeroext, i8 zeroext) local_unnamed_addr #3 align 2 {
  %3 = zext i8 %1 to i64
  %4 = getelementptr inbounds [8 x i8], [8 x i8]* @_ZZN7SoftSPI7SpiPackILNS_8BitOrderE0EE4maskEhhE4mask, i64 0, i64 %3
  %5 = load i8, i8* %4, align 1, !tbaa !1
  %6 = and i8 %5, %0
  ret i8 %6
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #4

; Function Attrs: norecurse nounwind readnone uwtable
define zeroext i8 @_ZN7SoftSPI7SpiPackILNS_8BitOrderE1EE4maskEhh(i8 zeroext, i8 zeroext) local_unnamed_addr #3 align 2 {
  %3 = zext i8 %1 to i64
  %4 = getelementptr inbounds [8 x i8], [8 x i8]* @_ZZN7SoftSPI7SpiPackILNS_8BitOrderE1EE4maskEhhE4mask, i64 0, i64 %3
  %5 = load i8, i8* %4, align 1, !tbaa !1
  %6 = and i8 %5, %0
  ret i8 %6
}

; Function Attrs: norecurse nounwind readonly uwtable
define zeroext i8 @_ZN7SoftSPI7SpiPackILNS_8BitOrderE0EE4packEPh(i8* nocapture readonly) local_unnamed_addr #5 align 2 {
  %2 = load i8, i8* %0, align 1, !tbaa !1
  %3 = shl i8 %2, 7
  %4 = getelementptr inbounds i8, i8* %0, i64 1
  %5 = load i8, i8* %4, align 1, !tbaa !1
  %6 = shl i8 %5, 6
  %7 = or i8 %6, %3
  %8 = getelementptr inbounds i8, i8* %0, i64 2
  %9 = load i8, i8* %8, align 1, !tbaa !1
  %10 = shl i8 %9, 5
  %11 = or i8 %7, %10
  %12 = getelementptr inbounds i8, i8* %0, i64 3
  %13 = load i8, i8* %12, align 1, !tbaa !1
  %14 = shl i8 %13, 4
  %15 = or i8 %11, %14
  %16 = getelementptr inbounds i8, i8* %0, i64 4
  %17 = load i8, i8* %16, align 1, !tbaa !1
  %18 = shl i8 %17, 3
  %19 = or i8 %15, %18
  %20 = getelementptr inbounds i8, i8* %0, i64 5
  %21 = load i8, i8* %20, align 1, !tbaa !1
  %22 = shl i8 %21, 2
  %23 = or i8 %19, %22
  %24 = getelementptr inbounds i8, i8* %0, i64 6
  %25 = load i8, i8* %24, align 1, !tbaa !1
  %26 = shl i8 %25, 1
  %27 = or i8 %23, %26
  %28 = getelementptr inbounds i8, i8* %0, i64 7
  %29 = load i8, i8* %28, align 1, !tbaa !1
  %30 = or i8 %27, %29
  ret i8 %30
}

; Function Attrs: norecurse nounwind readonly uwtable
define zeroext i8 @_ZN7SoftSPI7SpiPackILNS_8BitOrderE1EE4packEPh(i8* nocapture readonly) local_unnamed_addr #5 align 2 {
  %2 = load i8, i8* %0, align 1, !tbaa !1
  %3 = getelementptr inbounds i8, i8* %0, i64 1
  %4 = load i8, i8* %3, align 1, !tbaa !1
  %5 = shl i8 %4, 1
  %6 = or i8 %5, %2
  %7 = getelementptr inbounds i8, i8* %0, i64 2
  %8 = load i8, i8* %7, align 1, !tbaa !1
  %9 = shl i8 %8, 2
  %10 = or i8 %6, %9
  %11 = getelementptr inbounds i8, i8* %0, i64 3
  %12 = load i8, i8* %11, align 1, !tbaa !1
  %13 = shl i8 %12, 3
  %14 = or i8 %10, %13
  %15 = getelementptr inbounds i8, i8* %0, i64 4
  %16 = load i8, i8* %15, align 1, !tbaa !1
  %17 = shl i8 %16, 4
  %18 = or i8 %14, %17
  %19 = getelementptr inbounds i8, i8* %0, i64 5
  %20 = load i8, i8* %19, align 1, !tbaa !1
  %21 = shl i8 %20, 5
  %22 = or i8 %18, %21
  %23 = getelementptr inbounds i8, i8* %0, i64 6
  %24 = load i8, i8* %23, align 1, !tbaa !1
  %25 = shl i8 %24, 6
  %26 = or i8 %22, %25
  %27 = getelementptr inbounds i8, i8* %0, i64 7
  %28 = load i8, i8* %27, align 1, !tbaa !1
  %29 = shl i8 %28, 7
  %30 = or i8 %26, %29
  ret i8 %30
}

; Function Attrs: norecurse nounwind uwtable
define void @_Z12digitalWritejj(i32, i32) local_unnamed_addr #6 {
  %3 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %4 = xor i32 %3, %1
  %5 = and i32 %4, %0
  %6 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %7 = xor i32 %5, %6
  store volatile i32 %7, i32* @__R30, align 4, !tbaa !4
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define zeroext i1 @_Z11digitalReadj(i32) local_unnamed_addr #6 {
  %2 = load volatile i32, i32* @__R31, align 4, !tbaa !4
  %3 = and i32 %2, %0
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

; Function Attrs: norecurse nounwind uwtable
define void @_Z13digitalTogglej(i32) local_unnamed_addr #6 {
  %2 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %3 = xor i32 %2, %0
  store volatile i32 %3, i32* @__R30, align 4, !tbaa !4
  ret void
}

; Function Attrs: norecurse uwtable
define i32 @main() local_unnamed_addr #7 {
  %1 = alloca i8, align 1
  %2 = alloca %"struct.SoftSPI::SpiMaster", align 8
  %3 = bitcast %"struct.SoftSPI::SpiMaster"* %2 to i8*
  call void @llvm.lifetime.start(i64 60, i8* nonnull %3) #2
  %4 = bitcast %"struct.SoftSPI::SpiMaster"* %2 to i64*
  store i64 47244640266, i64* %4, align 8
  %5 = getelementptr inbounds %"struct.SoftSPI::SpiMaster", %"struct.SoftSPI::SpiMaster"* %2, i64 0, i32 0, i32 2
  %6 = bitcast i32* %5 to <4 x i32>*
  store <4 x i32> <i32 14, i32 10, i32 0, i32 5>, <4 x i32>* %6, align 8
  %7 = getelementptr inbounds %"struct.SoftSPI::SpiMaster", %"struct.SoftSPI::SpiMaster"* %2, i64 0, i32 1, i32 3
  %8 = bitcast i32* %7 to <4 x i32>*
  store <4 x i32> <i32 0, i32 5, i32 14, i32 10>, <4 x i32>* %8, align 4
  %9 = getelementptr inbounds %"struct.SoftSPI::SpiMaster", %"struct.SoftSPI::SpiMaster"* %2, i64 0, i32 2, i32 0, i32 1, i32 1
  %10 = bitcast i32* %9 to <4 x i32>*
  store <4 x i32> <i32 0, i32 5, i32 0, i32 5>, <4 x i32>* %10, align 4
  %11 = getelementptr inbounds %"struct.SoftSPI::SpiMaster", %"struct.SoftSPI::SpiMaster"* %2, i64 0, i32 3
  store i32 0, i32* %11, align 8, !tbaa !6
  %12 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i64 18)
  %13 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !11
  %14 = getelementptr i8, i8* %13, i64 -24
  %15 = bitcast i8* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %16
  %18 = getelementptr inbounds i8, i8* %17, i64 240
  %19 = bitcast i8* %18 to %"class.std::ctype"**
  %20 = load %"class.std::ctype"*, %"class.std::ctype"** %19, align 8, !tbaa !13
  %21 = icmp eq %"class.std::ctype"* %20, null
  br i1 %21, label %22, label %23

; <label>:22:                                     ; preds = %0
  tail call void @_ZSt16__throw_bad_castv() #10
  unreachable

; <label>:23:                                     ; preds = %0
  %24 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %20, i64 0, i32 8
  %25 = load i8, i8* %24, align 8, !tbaa !17
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %30, label %27

; <label>:27:                                     ; preds = %23
  %28 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %20, i64 0, i32 9, i64 10
  %29 = load i8, i8* %28, align 1, !tbaa !1
  br label %36

; <label>:30:                                     ; preds = %23
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %20)
  %31 = bitcast %"class.std::ctype"* %20 to i8 (%"class.std::ctype"*, i8)***
  %32 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %31, align 8, !tbaa !11
  %33 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %32, i64 6
  %34 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %33, align 8
  %35 = tail call signext i8 %34(%"class.std::ctype"* nonnull %20, i8 signext 10)
  br label %36

; <label>:36:                                     ; preds = %27, %30
  %37 = phi i8 [ %29, %27 ], [ %35, %30 ]
  %38 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %37)
  %39 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %38)
  %40 = call zeroext i8 @_ZN7SoftSPI9SpiMasterIhLNS_8PolarityE0ELNS_8PollEdgeE0ELNS_8BitOrderE0ENS_15SpiClockTogglerEE8transferEjh(%"struct.SoftSPI::SpiMaster"* nonnull %2, i32 7, i8 zeroext -86)
  %41 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i64 13)
  call void @llvm.lifetime.start(i64 1, i8* nonnull %1)
  store i8 %40, i8* %1, align 1, !tbaa !1
  %42 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull %1, i64 1)
  call void @llvm.lifetime.end(i64 1, i8* nonnull %1)
  %43 = bitcast %"class.std::basic_ostream"* %42 to i8**
  %44 = load i8*, i8** %43, align 8, !tbaa !11
  %45 = getelementptr i8, i8* %44, i64 -24
  %46 = bitcast i8* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = bitcast %"class.std::basic_ostream"* %42 to i8*
  %49 = getelementptr inbounds i8, i8* %48, i64 %47
  %50 = getelementptr inbounds i8, i8* %49, i64 240
  %51 = bitcast i8* %50 to %"class.std::ctype"**
  %52 = load %"class.std::ctype"*, %"class.std::ctype"** %51, align 8, !tbaa !13
  %53 = icmp eq %"class.std::ctype"* %52, null
  br i1 %53, label %54, label %55

; <label>:54:                                     ; preds = %36
  call void @_ZSt16__throw_bad_castv() #10
  unreachable

; <label>:55:                                     ; preds = %36
  %56 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %52, i64 0, i32 8
  %57 = load i8, i8* %56, align 8, !tbaa !17
  %58 = icmp eq i8 %57, 0
  br i1 %58, label %62, label %59

; <label>:59:                                     ; preds = %55
  %60 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %52, i64 0, i32 9, i64 10
  %61 = load i8, i8* %60, align 1, !tbaa !1
  br label %68

; <label>:62:                                     ; preds = %55
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %52)
  %63 = bitcast %"class.std::ctype"* %52 to i8 (%"class.std::ctype"*, i8)***
  %64 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %63, align 8, !tbaa !11
  %65 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %64, i64 6
  %66 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %65, align 8
  %67 = call signext i8 %66(%"class.std::ctype"* nonnull %52, i8 signext 10)
  br label %68

; <label>:68:                                     ; preds = %59, %62
  %69 = phi i8 [ %61, %59 ], [ %67, %62 ]
  %70 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %42, i8 signext %69)
  %71 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %70)
  call void @llvm.lifetime.end(i64 60, i8* nonnull %3) #2
  ret i32 0
}

; Function Attrs: uwtable
define linkonce_odr zeroext i8 @_ZN7SoftSPI9SpiMasterIhLNS_8PolarityE0ELNS_8PollEdgeE0ELNS_8BitOrderE0ENS_15SpiClockTogglerEE8transferEjh(%"struct.SoftSPI::SpiMaster"*, i32, i8 zeroext) local_unnamed_addr #8 comdat align 2 {
  %4 = getelementptr inbounds %"struct.SoftSPI::SpiMaster", %"struct.SoftSPI::SpiMaster"* %0, i64 0, i32 3
  %5 = load i32, i32* %4, align 4, !tbaa !6
  %6 = add i32 %5, 1
  store i32 %6, i32* %4, align 4, !tbaa !6
  %7 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %8 = and i32 %7, %1
  %9 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %10 = xor i32 %8, %9
  store volatile i32 %10, i32* @__R30, align 4, !tbaa !4
  %11 = getelementptr inbounds %"struct.SoftSPI::SpiMaster", %"struct.SoftSPI::SpiMaster"* %0, i64 0, i32 2, i32 0, i32 0
  %12 = load i32, i32* %11, align 4
  %13 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %14 = xor i32 %13, %12
  store volatile i32 %14, i32* @__R30, align 4, !tbaa !4
  %15 = bitcast %"struct.SoftSPI::SpiMaster"* %0 to i64*
  %16 = load i64, i64* %15, align 4
  %17 = lshr i64 %16, 32
  %18 = trunc i64 %17 to i32
  %19 = lshr i8 %2, 7
  %20 = zext i8 %19 to i32
  %21 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %22 = xor i32 %20, %21
  %23 = and i32 %22, %18
  %24 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %25 = xor i32 %23, %24
  store volatile i32 %25, i32* @__R30, align 4, !tbaa !4
  %26 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %27 = xor i32 %26, %12
  store volatile i32 %27, i32* @__R30, align 4, !tbaa !4
  %28 = load volatile i32, i32* @__R31, align 4, !tbaa !4
  %29 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %30 = xor i32 %29, %12
  store volatile i32 %30, i32* @__R30, align 4, !tbaa !4
  %31 = lshr i8 %2, 6
  %32 = and i8 %31, 1
  %33 = zext i8 %32 to i32
  %34 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %35 = xor i32 %33, %34
  %36 = and i32 %35, %18
  %37 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %38 = xor i32 %36, %37
  store volatile i32 %38, i32* @__R30, align 4, !tbaa !4
  %39 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %40 = xor i32 %39, %12
  store volatile i32 %40, i32* @__R30, align 4, !tbaa !4
  %41 = load volatile i32, i32* @__R31, align 4, !tbaa !4
  %42 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %43 = xor i32 %42, %12
  store volatile i32 %43, i32* @__R30, align 4, !tbaa !4
  %44 = lshr i8 %2, 5
  %45 = and i8 %44, 1
  %46 = zext i8 %45 to i32
  %47 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %48 = xor i32 %46, %47
  %49 = and i32 %48, %18
  %50 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %51 = xor i32 %49, %50
  store volatile i32 %51, i32* @__R30, align 4, !tbaa !4
  %52 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %53 = xor i32 %52, %12
  store volatile i32 %53, i32* @__R30, align 4, !tbaa !4
  %54 = load volatile i32, i32* @__R31, align 4, !tbaa !4
  %55 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %56 = xor i32 %55, %12
  store volatile i32 %56, i32* @__R30, align 4, !tbaa !4
  %57 = lshr i8 %2, 4
  %58 = and i8 %57, 1
  %59 = zext i8 %58 to i32
  %60 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %61 = xor i32 %59, %60
  %62 = and i32 %61, %18
  %63 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %64 = xor i32 %62, %63
  store volatile i32 %64, i32* @__R30, align 4, !tbaa !4
  %65 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %66 = xor i32 %65, %12
  store volatile i32 %66, i32* @__R30, align 4, !tbaa !4
  %67 = load volatile i32, i32* @__R31, align 4, !tbaa !4
  %68 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %69 = xor i32 %68, %12
  store volatile i32 %69, i32* @__R30, align 4, !tbaa !4
  %70 = lshr i8 %2, 3
  %71 = and i8 %70, 1
  %72 = zext i8 %71 to i32
  %73 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %74 = xor i32 %72, %73
  %75 = and i32 %74, %18
  %76 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %77 = xor i32 %75, %76
  store volatile i32 %77, i32* @__R30, align 4, !tbaa !4
  %78 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %79 = xor i32 %78, %12
  store volatile i32 %79, i32* @__R30, align 4, !tbaa !4
  %80 = load volatile i32, i32* @__R31, align 4, !tbaa !4
  %81 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %82 = xor i32 %81, %12
  store volatile i32 %82, i32* @__R30, align 4, !tbaa !4
  %83 = lshr i8 %2, 2
  %84 = and i8 %83, 1
  %85 = zext i8 %84 to i32
  %86 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %87 = xor i32 %85, %86
  %88 = and i32 %87, %18
  %89 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %90 = xor i32 %88, %89
  store volatile i32 %90, i32* @__R30, align 4, !tbaa !4
  %91 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %92 = xor i32 %91, %12
  store volatile i32 %92, i32* @__R30, align 4, !tbaa !4
  %93 = load volatile i32, i32* @__R31, align 4, !tbaa !4
  %94 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %95 = xor i32 %94, %12
  store volatile i32 %95, i32* @__R30, align 4, !tbaa !4
  %96 = load i32, i32* %11, align 4
  %97 = load i64, i64* %15, align 4
  %98 = lshr i64 %97, 32
  %99 = trunc i64 %98 to i32
  %100 = lshr i8 %2, 1
  %101 = and i8 %100, 1
  %102 = zext i8 %101 to i32
  %103 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %104 = xor i32 %102, %103
  %105 = and i32 %104, %99
  %106 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %107 = xor i32 %105, %106
  store volatile i32 %107, i32* @__R30, align 4, !tbaa !4
  %108 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %109 = xor i32 %108, %96
  store volatile i32 %109, i32* @__R30, align 4, !tbaa !4
  %110 = load volatile i32, i32* @__R31, align 4, !tbaa !4
  %111 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %112 = xor i32 %111, %96
  store volatile i32 %112, i32* @__R30, align 4, !tbaa !4
  %113 = and i8 %2, 1
  %114 = zext i8 %113 to i32
  %115 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %116 = xor i32 %114, %115
  %117 = and i32 %116, %99
  %118 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %119 = xor i32 %117, %118
  store volatile i32 %119, i32* @__R30, align 4, !tbaa !4
  %120 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %121 = xor i32 %120, %96
  store volatile i32 %121, i32* @__R30, align 4, !tbaa !4
  %122 = load volatile i32, i32* @__R31, align 4, !tbaa !4
  %123 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %124 = xor i32 %123, %96
  store volatile i32 %124, i32* @__R30, align 4, !tbaa !4
  %125 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %126 = xor i32 %125, -1
  %127 = and i32 %126, %1
  %128 = load volatile i32, i32* @__R30, align 4, !tbaa !4
  %129 = xor i32 %127, %128
  store volatile i32 %129, i32* @__R30, align 4, !tbaa !4
  ret i8 -1
}

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* dereferenceable(272), i8*, i64) local_unnamed_addr #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"*, i8 signext) local_unnamed_addr #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"*) local_unnamed_addr #0

; Function Attrs: noreturn
declare void @_ZSt16__throw_bad_castv() local_unnamed_addr #9

declare void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"*) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_softspi_setup_example.cpp() #8 section ".text.startup" {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull @_ZStL8__ioinit)
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #2
  ret void
}

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.1-6 (tags/RELEASE_401/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !2, i64 0}
!6 = !{!7, !5, i64 56}
!7 = !{!"_ZTSN7SoftSPI9SpiMasterIhLNS_8PolarityE0ELNS_8PollEdgeE0ELNS_8BitOrderE0ENS_15SpiClockTogglerEEE", !8, i64 0, !9, i64 12, !10, i64 32, !5, i64 56}
!8 = !{!"_ZTSN7SoftSPI6IOPinsE", !5, i64 0, !5, i64 4, !5, i64 8}
!9 = !{!"_ZTSN7SoftSPI12ClockTimingsE", !5, i64 0, !5, i64 4, !5, i64 8, !5, i64 12, !5, i64 16}
!10 = !{!"_ZTSN7SoftSPI15SpiClockTogglerILNS_8PolarityE0EEE"}
!11 = !{!12, !12, i64 0}
!12 = !{!"vtable pointer", !3, i64 0}
!13 = !{!14, !15, i64 240}
!14 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !15, i64 216, !2, i64 224, !16, i64 225, !15, i64 232, !15, i64 240, !15, i64 248, !15, i64 256}
!15 = !{!"any pointer", !2, i64 0}
!16 = !{!"bool", !2, i64 0}
!17 = !{!18, !2, i64 56}
!18 = !{!"_ZTSSt5ctypeIcE", !15, i64 16, !16, i64 24, !15, i64 32, !15, i64 40, !15, i64 48, !2, i64 56, !2, i64 57, !2, i64 313, !2, i64 569}
