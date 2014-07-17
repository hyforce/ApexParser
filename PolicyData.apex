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

public class PolicyData{
    public String policyValue {get; set;}
    public String surrenderValue {get; set;}
    public String freeAvailableAmt {get; set;}
    public String surrenderCharge {get; set;}
    public String preTEFRA_InAmt {get; set;}
    public String preTEFRA_OutAmt {get; set;}
    public String postTEFRA_InAmt {get; set;}
    public String postTEFRA_OutAmt {get; set;}
    public String totalDepositITD {get; set;}
    public String rMDBasisValue {get; set;}
    public String riderCode {get; set;}
    public String marketingName {get; set;}
    public String totWDBaseAmount {get; set;}
    public String maxAnnualWDAmount {get; set;}
    public String guaranteedMinIncomeBenefit {get; set;}
    public String deathBenefitAmt {get; set;}
    
    public String toPrint(){
        return 'policyValue: ' + policyValue + '\n' +
               'surrenderValue: ' + surrenderValue + '\n' +
            'freeAvailableAmt: ' + freeAvailableAmt + '\n' +
            'surrenderCharge: ' + surrenderCharge + '\n' +
            'preTEFRA_InAmt: ' + preTEFRA_InAmt + '\n' +
            'preTEFRA_OutAmt: ' + preTEFRA_OutAmt + '\n' +
            'postTEFRA_InAmt: ' + postTEFRA_InAmt + '\n' +
            'postTEFRA_OutAmt: ' + postTEFRA_OutAmt + '\n' +
            'totalDepositITD: ' + totalDepositITD + '\n' +
            'rMDBasisValue: ' + rMDBasisValue + '\n' +
            'riderCode: ' + riderCode + '\n' +
            'marketingName: ' + marketingName + '\n' +
            'totWDBaseAmount: ' + totWDBaseAmount + '\n' +
            'maxAnnualWDAmount: ' + maxAnnualWDAmount + '\n' +
            'guaranteedMinIncomeBenefit: ' + guaranteedMinIncomeBenefit + '\n' +
            'deathBenefitAmt: ' + deathBenefitAmt + '\n' ;
            
        
    }
    
   
}