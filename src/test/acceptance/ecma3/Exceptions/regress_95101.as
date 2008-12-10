/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is mozilla.org code.
 *
 * The Initial Developer of the Original Code is
 * Netscape Communications Corporation.
 * Portions created by the Initial Developer are Copyright (C) 1998
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *   pschwartau@netscape.com
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** */
/*
 * Date: 13 August 2001
 *
 * SUMMARY: Invoking an undefined function should produce a ReferenceError
 * See http://bugzilla.mozilla.org/show_bug.cgi?id=95101
 */
//-----------------------------------------------------------------------------
    var SECTION = "regress_95101";
    var VERSION = "";
    var bug = 95101;
    var TITLE   = "Invoking an undefined function should produce a ReferenceError";
    var msgERR_REF_YES = 'ReferenceError';
    var msgERR_REF_NO = 'did NOT generate a ReferenceError';

    printBugNumber (bug);
    printStatus (TITLE);

    startTest();
    writeHeaderToLog( SECTION + " Number.prototype.valueOf()");
    var testcases = getTestCases();
    test();
    
function getTestCases() {
    var array = new Array();
    var item = 0;  
    var UBound = 0;
    var status = '';
    var statusitems = [];
    var actual = '';
    var actualvalues = [];
    var expect= '';
    var expectedvalues = [];


    try
    {
      xxxyyyzzz();
    }
    catch (e)
    {
      status = 'Section 1 of test';
      actual = e instanceof ReferenceError;
      expect = true;
      array[item++] = new TestCase(SECTION, status, expect, actual);
    
    
      /*
       * This test is more literal, and may one day be invalid.
       * Searching for literal string "ReferenceError" in e.toString()
       */
      status = 'Section 2 of test';
      var match = e.toString().search(/ReferenceError/);
      actual = (match > -1);
      expect = true;
      array[item++] = new TestCase(SECTION, status, expect, actual);
    }
    return array;
}


// converts a Boolean result into a textual result -
function isReferenceError(bResult)
{
  return bResult? msgERR_REF_YES : msgERR_REF_NO;
}
