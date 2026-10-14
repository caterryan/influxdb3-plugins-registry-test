import humanize

CR_MARKER = "cr_request-1.0.0"

def process_request(influxdb3_local, query_parameters, request_headers, request_body, args=None):
    influxdb3_local.info(f"{CR_MARKER} process_request")
    return {"marker": CR_MARKER, "humanize": humanize.__version__, "query": query_parameters}
