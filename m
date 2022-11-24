Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9111C05
	for <regressions@lists.linux.dev>; Thu, 24 Nov 2022 01:30:58 +0000 (UTC)
Received: from in01.mta.xmission.com ([166.70.13.51]:34004)
	by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <dominic@xmission.com>)
	id 1oy0mk-007OyU-5M; Wed, 23 Nov 2022 18:12:14 -0700
Received: from 75-169-132-183.slkc.qwest.net ([75.169.132.183]:53660 helo=mail.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <dominic@xmission.com>)
	id 1oy0mh-00FDCX-4S; Wed, 23 Nov 2022 18:12:13 -0700
Date: Thu, 24 Nov 2022 01:08:57 +0000
Message-ID: <709b163021b2608789dab55eb3f9724c.dominic@xmission.com>
From: Dominic Jones <jonesd@xmission.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain
X-XM-SPF: eid=1oy0mh-00FDCX-4S;;;mid=<709b163021b2608789dab55eb3f9724c.dominic@xmission.com>;;;hst=in01.mta.xmission.com;;;ip=75.169.132.183;;;frm=dominic@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX19V0hpdjZAJ12wd0swbngZP
X-SA-Exim-Connect-IP: 75.169.132.183
X-SA-Exim-Mail-From: dominic@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa05.xmission.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=8.0 tests=ALL_TRUSTED,BAYES_50,
	DCC_CHECK_NEGATIVE,TVD_RCVD_IP,T_TM2_M_HEADER_IN_MSG,XMSubLong,
	XM_Multi_Part_URI shortcircuit=no autolearn=disabled version=3.4.2
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  0.0 TVD_RCVD_IP Message was received from an IP address
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	*  1.2 XM_Multi_Part_URI URI: Long-Multi-Part URIs
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa05 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa05 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;Greg KH <gregkh@linuxfoundation.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 2511 ms - load_scoreonly_sql: 0.07 (0.0%),
	signal_user_changed: 14 (0.5%), b_tie_ro: 11 (0.5%), parse: 1.18
	(0.0%), extract_message_metadata: 46 (1.8%), get_uri_detail_list: 4.6
	(0.2%), tests_pri_-1000: 44 (1.8%), tests_pri_-950: 1.41 (0.1%),
	tests_pri_-900: 1.08 (0.0%), tests_pri_-200: 0.90 (0.0%),
	tests_pri_-100: 12 (0.5%), tests_pri_-90: 154 (6.1%), check_bayes: 104
	(4.2%), b_tokenize: 8 (0.3%), b_tok_get_all: 10 (0.4%), b_comp_prob:
	3.3 (0.1%), b_tok_touch_all: 78 (3.1%), b_finish: 1.20 (0.0%),
	tests_pri_0: 283 (11.3%), check_dkim_signature: 0.57 (0.0%),
	check_dkim_adsp: 11 (0.4%), poll_dns_idle: 1899 (75.6%), tests_pri_10:
	4.4 (0.2%), tests_pri_500: 1944 (77.4%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [REGRESSION] v6.0.x fails to boot after updating from v5.19.x
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>

> On Fri, Oct 28, 2022 at 02:51:43PM +0000, Dominic Jones wrote:
> > Updating the machine's kernel from v5.19.x to v6.0.x causes the machine to not
> > successfully boot. The machine boots successfully (and exhibits stable operation)
> > with version v5.19.17 and multiple earlier releases in the 5.19 line. Multiple releases
> > from the 6.0 line (including 6.0.0, 6.0.3, and 6.0.5), with no other changes to the
> > software environment, do not boot. Instead, the machine hangs after loading services
> > but before presenting a display manager; the machine instead shows repetitive hard
> > drive activity at this point and then no apparent activity.
> > 
> > ''uname'' output for the machine successfully running v5.19.17 is:
> > 
> >     Linux [MACHINE_NAME] 5.19.17 #1 SMP PREEMPT_DYNAMIC Mon Oct 24 13:32:29 2022 i686 Intel(R) Atom(TM) CPU N270 @ 1.60GHz GenuineIntel GNU/Linux
> > 
> > The machine is an OCZ Neutrino netbook, running a custom OS build largely similar to
> > LFS development. The kernel update uses ''make olddefconfig''.
> 
> Can you use 'git bisect' to find the offending change that causes this
> to happen?

Bisection is complete. Here's what it returned.

---

3a194f3f8ad01bce00bd7174aaba1563bcc827eb is the first bad commit
commit 3a194f3f8ad01bce00bd7174aaba1563bcc827eb
Author: Naoya Horiguchi <naoya.horiguchi@nec.com>
Date:   Thu Jul 14 13:24:14 2022 +0900

    mm/hugetlb: make pud_huge() and follow_huge_pud() aware of non-present pud entry
    
    follow_pud_mask() does not support non-present pud entry now.  As long as
    I tested on x86_64 server, follow_pud_mask() still simply returns
    no_page_table() for non-present_pud_entry() due to pud_bad(), so no severe
    user-visible effect should happen.  But generally we should call
    follow_huge_pud() for non-present pud entry for 1GB hugetlb page.
    
    Update pud_huge() and follow_huge_pud() to handle non-present pud entries.
    The changes are similar to previous works for pud entries commit
    e66f17ff7177 ("mm/hugetlb: take page table lock in follow_huge_pmd()") and
    commit cbef8478bee5 ("mm/hugetlb: pmd_huge() returns true for non-present
    hugepage").
    
    Link: https://lkml.kernel.org/r/20220714042420.1847125-3-naoya.horiguchi@linux.dev
    Signed-off-by: Naoya Horiguchi <naoya.horiguchi@nec.com>
    Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
    Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
    Cc: David Hildenbrand <david@redhat.com>
    Cc: kernel test robot <lkp@intel.com>
    Cc: Liu Shixin <liushixin2@huawei.com>
    Cc: Muchun Song <songmuchun@bytedance.com>
    Cc: Oscar Salvador <osalvador@suse.de>
    Cc: Yang Shi <shy828301@gmail.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

 arch/x86/mm/hugetlbpage.c |  8 +++++++-
 mm/hugetlb.c              | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 37 insertions(+), 3 deletions(-)

---

Dominic
