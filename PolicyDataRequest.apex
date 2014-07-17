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

public class PolicyDataRequest{

    public PolicyData getPolicyData(String policyNumber){
        Datetime Starttime;
        Starttime = system.now();
        String soapRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:acor="http://tcmservices.aegonusa.com/AcordServices" xmlns:oas="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" xmlns:ns="http://tcmservices.aegonusa.com/AcordServices/Acord203Service/1"><soapenv:Header><acor:MessageHeader> <acor:MessageName>?</acor:MessageName> <acor:LoginInfo> <acor:UserID>ggoodale</acor:UserID> <acor:UserSSN>?</acor:UserSSN> <acor:UserGUID>121341414141</acor:UserGUID> <acor:SessionID>f89df89sf</acor:SessionID> </acor:LoginInfo> </acor:MessageHeader> <oas:Security> <oas:UsernameToken> <oas:Username>svcesbsfd</oas:Username> <oas:Password>me7aswaCu7</oas:Password> </oas:UsernameToken> </oas:Security> </soapenv:Header> <soapenv:Body> <ns:PolicyInquiry> <TXLife xmlns="http://ACORD.org/Standards/Life/2"> <TXLifeRequest PrimaryObjectID="arun"> <TransRefGUID>GMG-203-12-6-1234</TransRefGUID> <TransType tc="203"/> <TransExeDate>2009-01-20</TransExeDate> <TransExeTime>02:25:99-06:00</TransExeTime> <InquiryLevel tc="3" /> <InquiryView> <InquiryViewCode>WebSiteView</InquiryViewCode> </InquiryView> <OLifE> <Holding id="Holding_1"> <HoldingTypeCode tc="2">Policy</HoldingTypeCode> <Policy id="Policy_1"> <PolNumber>'+policyNumber+'</PolNumber> </Policy> </Holding> </OLifE> </TXLifeRequest> </TXLife> </ns:PolicyInquiry> </soapenv:Body> </soapenv:Envelope>';
        Http h = new Http();
        System.debug('SOAP REQUEST !!!' + soapRequest);
// Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://tcmmuleesbsyst.transamerica.com/tcmgateway?service=Acord203Service&region=DEV6');
    req.setMethod('GET');
    req.setBody(soapRequest);

// Send the request, and return a response
    HttpResponse res = h.send(req);
    PolicyResponseReader policyReader = new PolicyResponseReader();
        String responseBody = res.getBody();
        System.debug(responseBody);
        

       TrackServiceMetrics TSM =new TrackServiceMetrics();
        TSM.SetEndTime('Mulesoft', StartTime);

    return policyReader.parsePolicy(responseBody);    
        
    }
}
