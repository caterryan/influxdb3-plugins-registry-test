
CR_MARKER = "cr_writes-1.0.0"

def process_writes(influxdb3_local, table_batches, args=None):
    influxdb3_local.info(f"{CR_MARKER} process_writes")
    for batch in table_batches:
        src = batch["table_name"]
        for _row in batch["rows"]:
            line = LineBuilder("cr_writes_out")
            line.tag("src_table", src)
            line.string_field("marker", CR_MARKER)
            influxdb3_local.write(line)
