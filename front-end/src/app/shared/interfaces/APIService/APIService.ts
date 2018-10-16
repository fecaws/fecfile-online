/**
 * Posts interface
 */
export interface Posts {
  body?: string,
  id?: number,
  title?: string,
  userid?: number
}

/**
 * Post interface
 */
 export interface Post {
  body?: string,
  id?: number,
  title?: string,
  userid?: number
 }

 export interface Auth {
   token?: string
 }

 export interface form99 {
  committeeid: string,
  committeename: string,
  street1: string,
  street2: string,
  city: string,
  state: string,
  zipcode: string,
  treasurerprefix: string,
  treasurerfirstname: string,
  reason: string,
  text: string,
  treasurermiddlename: string,
  treasurerlastname: string,
  treasurersuffix: string,
  created_at: string,
  is_submitted: boolean
 }
