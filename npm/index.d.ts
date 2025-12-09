declare module '@apiverve/silverprice' {
  export interface silverpriceOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface silverpriceResponse {
    status: string;
    error: string | null;
    data: SilverPriceData;
    code?: number;
  }


  interface SilverPriceData {
      currency:    string;
      gram:        number;
      kilogram:    number;
      ounce:       number;
      lastUpdated: number;
  }

  export default class silverpriceWrapper {
    constructor(options: silverpriceOptions);

    execute(callback: (error: any, data: silverpriceResponse | null) => void): Promise<silverpriceResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: silverpriceResponse | null) => void): Promise<silverpriceResponse>;
    execute(query?: Record<string, any>): Promise<silverpriceResponse>;
  }
}
