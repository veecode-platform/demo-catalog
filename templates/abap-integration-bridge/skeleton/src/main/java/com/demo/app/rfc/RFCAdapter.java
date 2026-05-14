package com.demo.app.rfc;

import java.util.Map;

/**
 * Translates JSON parameter maps into RFC calls against an ABAP backend
 * and normalizes the response back into JSON-safe shapes.
 *
 * Implementations:
 *  - JCoRFCAdapter    — uses the licensed SAP JCo library (production).
 *  - StubRFCAdapter   — returns synthetic data for local development.
 *  - HttpRFCAdapter   — when JCo isn't an option, proxies through an HTTP gateway.
 */
public interface RFCAdapter {

  /**
   * Invoke a BAPI / function module on the connected ABAP system.
   *
   * @param functionModule the ABAP function module name (e.g. BAPI_USER_GET_DETAIL).
   * @param params         input parameters keyed by ABAP parameter name.
   * @return               flat map of output parameters and table rows.
   */
  Map<String, Object> call(String functionModule, Map<String, Object> params);
}
