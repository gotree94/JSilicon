# 실행 절차 (Step-by-Step)

## CLOCK 설정
   * Fclk = 12 MHz
   * Baud = 9600 bps

## 버튼정의

| 역할                     | 입력 방법         |
| ---------------------- | ------------- |
| Reset                  | BTNC (Center) |
| Mode 전환 (Manual / CPU) | SW4 슬라이드 스위치  |
| Enable                 | SW3 슬라이드 스위치  |
| Operand A / B          | SW15~SW8      |
| Opcode                 | SW7~SW5       |

| 구분       | 보드 핀명     | Verilog 신호명        | Active 상태    | 기능 설명                                       |
| -------- | --------- | ------------------ | ------------ | ------------------------------------------- |
| **BTNC** | Center 버튼 | `rst_n`            | Low (눌림 시 0) | 시스템 리셋 (Active-Low). 눌렀다 떼면 리셋 해제 후 프로그램 시작 |
| **BTNU** | Up 버튼     | (옵션) `step_up`     | High         | CPU 수동 Step 실행 (옵션: ena=1일 때 1클럭 명령 수행)     |
| **BTND** | Down 버튼   | (옵션) `mode_toggle` | High         | Manual ↔ CPU 모드 전환 토글 (SW4 대신 사용 가능)        |
| **BTNL** | Left 버튼   | (옵션) `manual_prev` | High         | Manual 모드에서 이전 연산 결과 불러오기 (확장용)             |
| **BTNR** | Right 버튼  | (옵션) `manual_next` | High         | Manual 모드에서 다음 연산 수행 (확장용)                  |



## A. Manual 모드 (SW4=0)
1. SW3(ena)=1, BTNC 눌렀다 떼서 리셋 해제
2. 연산 선택:
  * SW[15:12] = A (0~15)
  * SW[11:8] = B (0~15)
  * SW[7:5] opcode:
     * 000=ADD, 001=SUB, 010=MUL, 011=DIV, 100=MOD, 101=EQ, 110=GT, 111=LT
3. 결과 확인:
   * LED 하위 영역: {busy, result[6:0]}
   * LED 상위 영역: result[15:9]
   * UART 터미널: 하위 8비트가 1바이트로 주기적 전송( FSM이 busy→idle 사이클)
예) A=15, B=10, opcode=000(ADD):
   * 예상 결과 = 25(0x19) → 터미널에 0x19 바이트 관측
   * LED 하위 7비트에 0x19의 LSBs가 보이고, busy LED(최상위 비트)가 TX 동안 켜졌다 꺼짐




## B. CPU 모드 (SW4=1)
1. SW3(ena)=1, BTNC 리셋
2. 내장 ROM 시퀀스가 자동 실행(ADD 3 → SUB 2 → MUL 5 → NOP → 루프)
3. 각 명령의 결과 하위 8비트가 UART로 전송, LED에 결과 비트 표시
4. SW4를 0/1 토글하며 Manual↔CPU 전환 시 UART busy가 0일 때 전환 추천(글리치 회피)





## C. Disable/Reset 동작 확인
   * SW3를 0으로 내리면 PC/FSM 정지(상태 유지) → 1로 올리면 재개
   * BTNC를 눌러 리셋: 내부 상태 초기화, PC=0부터 재시작

4) 검증 체크리스트

   * Manual 모드에서 각 opcode별 결과가 기대와 일치
   * DIV/MOD에서 B=0이면 결과 0 방어 로직 동작
   * CPU 모드에서 ROM 프로그램이 순환 실행
   * ena=0일 때 PC advance 정지, 재개 시 정상 진행
   * UART 터미널에서 1바이트 전송이 주기적으로 관측(115200bps)
   * busy LED가 전송 타이밍 동안만 켜짐
  
