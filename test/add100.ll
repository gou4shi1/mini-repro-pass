; ModuleID = 'add100.c'
source_filename = "add100.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo(i32 %a) #0 !dbg !7 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !11, metadata !DIExpression()), !dbg !12
  %0 = load i32, i32* %a.addr, align 4, !dbg !13
  %add = add nsw i32 %0, 100, !dbg !15
  %1 = load i32, i32* %a.addr, align 4, !dbg !16
  %cmp = icmp sgt i32 %add, %1, !dbg !17
  br i1 %cmp, label %if.end, label %if.then, !dbg !18

if.then:                                          ; preds = %entry
  call void @bar(), !dbg !19
  br label %if.end, !dbg !19

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %a.addr, align 4, !dbg !20
  ret i32 %2, !dbg !21
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @bar() #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 9.0.0 (https://github.com/llvm/llvm-project.git 93432be304a4f951ceb7d638ac865402cafcefe5)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "add100.c", directory: "/home/guangqing.chen/stack/test/testcases")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 9.0.0 (https://github.com/llvm/llvm-project.git 93432be304a4f951ceb7d638ac865402cafcefe5)"}
!7 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 7, type: !8, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 7, type: !10)
!12 = !DILocation(line: 7, column: 13, scope: !7)
!13 = !DILocation(line: 9, column: 8, scope: !14)
!14 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 6)
!15 = !DILocation(line: 9, column: 10, scope: !14)
!16 = !DILocation(line: 9, column: 18, scope: !14)
!17 = !DILocation(line: 9, column: 16, scope: !14)
!18 = !DILocation(line: 9, column: 6, scope: !7)
!19 = !DILocation(line: 10, column: 3, scope: !14)
!20 = !DILocation(line: 11, column: 9, scope: !7)
!21 = !DILocation(line: 11, column: 2, scope: !7)
