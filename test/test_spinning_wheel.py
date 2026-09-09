import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles, with_timeout
import os

ASSERT = True
if "NOASSERT" in os.environ:
    ASSERT = False

@cocotb.test()
async def test_spinning_wheel(dut):

    clock = Clock(dut.clk, 100, units="ns")
    cocotb.start_soon(clock.start())

    # 2. Initialize the reset signal immediately (active-high example)
    dut.reset_n.value = 0

    # 3. Hold the reset for a few clock cycles
    await ClockCycles(dut.clk, 5)

    # 4. De-assert the reset signal
    dut.reset_n.value = 1

    dut.speed.value = 15
    await ClockCycles(dut.clk, 400)

    dut.speed.value = 7
    await ClockCycles(dut.clk, 400)

    dut.speed.value = 1
    await ClockCycles(dut.clk, 400)

    dut.speed.value=0
    await ClockCycles(dut.clk, 400)




