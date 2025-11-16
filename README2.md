# ASIC Multicore Lab — JSilicon2 + RISC-V Full Flow

이 저장소는 다음 두 가지 디지털 설계를 FreePDK45 + Cadence 전체 플로우로 실습하기 위한 GitHub용 구조입니다.

1. **JSilicon2** — 교육용 8비트 CPU
2. **RiscV32** — RV32I 기반 RISC-V 코어, TinyTapeout 대응 옵션 포함

## 디렉토리 구조 개요

- `JSilicon2/` — JSilicon2 RTL, 시뮬레이션, 합성/PnR, 보고서
- `RiscV32/` — RISC-V RTL, SW(program.hex 생성), Full-flow 스크립트
- `common/` — FreePDK45, Cadence 환경 설정 공통 노트
- `docs/` — 6주차 커리큘럼, Lab 보고서 템플릿, PDF 템플릿

각 폴더의 README를 참고하여 실습을 진행하면 됩니다.
