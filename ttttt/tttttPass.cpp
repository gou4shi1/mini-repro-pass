#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/SMTAPI.h"
using namespace llvm;

namespace {
struct ttttt : public PassInfoMixin<ttttt> {
  PreservedAnalyses run(Function &F,
                        FunctionAnalysisManager &FAM) {
    CreateZ3Solver();
    return PreservedAnalyses::all();
  }
};
} // end anonymous namespace

extern "C" ::llvm::PassPluginLibraryInfo LLVM_ATTRIBUTE_WEAK
llvmGetPassPluginInfo() {
  return {
    LLVM_PLUGIN_API_VERSION, "ttttt", "v0.1",
    [](PassBuilder &PB) {
      PB.registerPipelineParsingCallback(
        [](StringRef PassName, FunctionPassManager &FPM,
           ArrayRef<PassBuilder::PipelineElement>) {
          if(PassName == "ttttt"){
            FPM.addPass(ttttt());
            return true;
          }
          return false;
        }
      );
    }
  };
}

