using { sap.yash.productsupport as ps } from '../db/schema';

service SupportService {
  entity CustomerMessage as projection on ps.CustomerMessage;
}