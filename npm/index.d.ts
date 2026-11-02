declare module '@apiverve/silverprice' {
  export interface silverpriceOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface silverpriceResponse {
    status: string;
    error: string | null;
    data: SilverPriceData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface SilverPriceData {
      currency:        null | string;
      gram:            number | null;
      kilogram:        number | null;
      ounce:           number | null;
      lastUpdated:     Date | null;
      change24H:       number | null;
      change24HPct:    number | null;
      changeDirection: null | string;
      high24H:         number | null;
      low24H:          number | null;
      change7D:        number | null;
      change7DPct:     number | null;
      change30D:       number | null;
      change30DPct:    number | null;
      high30D:         number | null;
      low30D:          number | null;
      average30D:      number | null;
      volatility30D:   number | null;
      daily:           Daily[];
      marketStatus:    null | string;
      formatted:       Formatted;
  }
  
  interface Daily {
      date:  Date | null;
      price: number | null;
  }
  
  interface Formatted {
      ounce:         null | string;
      gram:          null | string;
      kilogram:      null | string;
      ounceWords:    null | string;
      kilogramWords: null | string;
  }

  export default class silverpriceWrapper {
    constructor(options: silverpriceOptions);

    execute(callback: (error: any, data: silverpriceResponse | null) => void): Promise<silverpriceResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: silverpriceResponse | null) => void): Promise<silverpriceResponse>;
    execute(query?: Record<string, any>): Promise<silverpriceResponse>;
  }
}
