// Copyright 2014, Hyder Khan - Platform Sales Engineering, Salesforce.com Inc.
// All rights reserved.
// - Neither the name of the salesforce.com nor the names of its contributors
//   may be used to endorse or promote products derived from this software
//   without specific prior written permission. 
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

public class PolicyResponseReader{

    PolicyData policy ; 
    
    public PolicyResponseReader(){
       policy = new PolicyData(); 
    }

    
  public PolicyData parsePolicy(String xml){
  
        
        XMLStreamReader reader = new XMLStreamReader(xml);
      while(reader.hasNext()) {
          reader.next();
      
      if (reader.getEventType().equals(XmlTag.START_ELEMENT) && 'Policy'.equals(reader.getLocalName())) {
        while(reader.hasNext()) {
            reader.next();
           
            if (reader.getEventType().equals(XmlTag.START_ELEMENT)) {
                if ('PolicyValue'.equals(reader.getLocalName())) {
                    policy.policyValue = parseNode(reader);    
                }
               
                else if ('FreeAvailableAmt'.equals(reader.getLocalName())) {
                    policy.freeAvailableAmt = parseNode(reader);    
                }
                else if ('Annuity'.equals(reader.getLocalName())) {
                   
                    parseAnnuity(reader);    
                }
               
                
            }
            
          if (reader.getEventType().equals(XmlTag.END_ELEMENT) && 'Policy'.equals(reader.getLocalName())) {
                 break;
            }   
            
        }
          
        } 
        
      }
        return policy;
    }
    
   private String parseNode(XMLStreamReader reader){
        while(reader.hasNext()) {
                        if (reader.getEventType().equals(XmlTag.END_ELEMENT)) {
                           break;
                        } else if (reader.getEventType().equals(XmlTag.CHARACTERS)) {
                           
                            return reader.getText();
                        }
                        reader.next();
                    }
                   return null;
    }
    
    private void parseAnnuity(XMLStreamReader reader){
        while(reader.hasNext()) {
           
            reader.next();
            
             if (reader.getEventType().equals(XmlTag.START_ELEMENT)) {
                 //System.debug('Annuity Local Name: ' + reader.getLocalName());
                if ('SurrenderValue'.equals(reader.getLocalName())) {
                   
                    policy.surrenderValue = parseNode(reader);    
                }
                else if ('SurrenderCharge'.equals(reader.getLocalName())) {
                    policy.surrenderCharge = parseNode(reader);    
                }
                else if ('TotalDepositITD'.equals(reader.getLocalName())) {
                    policy.totalDepositITD = parseNode(reader);    
                }
                else if ('RMDBasisValue'.equals(reader.getLocalName())) {
                    policy.rMDBasisValue = parseNode(reader);    
                }
                else if ('DeathBenefitAmt'.equals(reader.getLocalName())) {
                    policy.deathBenefitAmt = parseNode(reader);    
                }
                else if ('OLifEExtension'.equals(reader.getLocalName())) {
                     //System.debug('Parsing OLifeEExtension !!');
                    parseOlifeExtention(reader);    
                } 
                else if ('Rider'.equals(reader.getLocalName())) {
                    //System.debug('Parsing RIDER !!');
                    parseRider(reader);    
                }   
             }
            if (reader.getEventType().equals(XmlTag.END_ELEMENT) && 'Annuity'.equals(reader.getLocalName())) {
                 break;
            } 
        }
    }
    
     private void parseOlifeExtention(XMLStreamReader reader)
     {
        while(reader.hasNext()) {
            reader.next();
            //System.debug('OLifEExtension!!!!!: ' + reader.getLocalName());
            if (reader.getEventType().equals(XmlTag.START_ELEMENT)) {
                if ('PreTEFRA_InAmt'.equals(reader.getLocalName())) {
                    policy.PreTEFRA_InAmt = parseNode(reader);    
                }
                else if ('PreTEFRA_OutAmt'.equals(reader.getLocalName())) {
                    policy.PreTEFRA_OutAmt = parseNode(reader);    
                }
                else if ('PostTEFRA_InAmt'.equals(reader.getLocalName())) {
                    policy.PostTEFRA_InAmt = parseNode(reader);    
                }
                else if ('PostTEFRA_OutAmt'.equals(reader.getLocalName())) {
                    policy.PostTEFRA_OutAmt = parseNode(reader);    
                }
                else if ('TotWDBaseAmount'.equals(reader.getLocalName())) {
                    policy.TotWDBaseAmount = parseNode(reader);    
                }
                else if ('MaxAnnualWDAmount'.equals(reader.getLocalName())) {
                    policy.MaxAnnualWDAmount = parseNode(reader);    
                }
                
                if (reader.getEventType().equals(XmlTag.END_ELEMENT) && 'OLifEExtension'.equals(reader.getLocalName())) {
                   break;
                } 
            } 
        }   
    }
    
    private void parseRider(XMLStreamReader reader){
        while(reader.hasNext()) {
            reader.next();
           
            if (reader.getEventType().equals(XmlTag.START_ELEMENT)) {
                 if ('RiderCode'.equals(reader.getLocalName())) {
                        policy.riderCode = parseNode(reader);    
                    } 
                 else if ('MarketingName'.equals(reader.getLocalName())) {
                    policy.marketingName = parseNode(reader);    
                }
                 else if ('OLifEExtension'.equals(reader.getLocalName())) {
                    while(reader.hasNext()) {
                    reader.next();
                    if ('GuaranteedMinIncomeBenefit'.equals(reader.getLocalName())) {
                        policy.GuaranteedMinIncomeBenefit = parseNode(reader);    
                    } 
                    if (reader.getEventType().equals(XmlTag.END_ELEMENT) && 'OLifEExtension'.equals(reader.getLocalName())) {
                      break;
                    } 
                   
                  }    
                } 
                 
            } 
             if (reader.getEventType().equals(XmlTag.END_ELEMENT) && 'Rider'.equals(reader.getLocalName())) {
                 break;
            } 
        }
    }
}