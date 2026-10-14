
CR_MARKER = "cr_sched-1.2.0"

def process_scheduled_call(influxdb3_local, call_time, args=None):
    influxdb3_local.info(f"{CR_MARKER} process_scheduled_call at {call_time}")
    line = LineBuilder("cr_sched_out")
    line.tag("version", "1.2.0")
    line.string_field("marker", CR_MARKER)
    influxdb3_local.write(line)
