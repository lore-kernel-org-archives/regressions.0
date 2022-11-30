Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC1D79C0
	for <regressions@lists.linux.dev>; Wed, 30 Nov 2022 19:02:44 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:55652)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <dominic@xmission.com>)
	id 1p0Ryl-002tgK-QV; Wed, 30 Nov 2022 11:38:43 -0700
Received: from 75-169-132-183.slkc.qwest.net ([75.169.132.183]:58736 helo=mail.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <dominic@xmission.com>)
	id 1p0Ryk-00BPYx-DH; Wed, 30 Nov 2022 11:38:43 -0700
Date: Wed, 30 Nov 2022 18:38:18 +0000
Message-ID: <4e195b030b250e2e338bee0bb1873e38.dominic@xmission.com>
From: Dominic Jones <jonesd@xmission.com>
To: Greg KH <gregkh@linuxfoundation.org>, Thorsten Leemhuis <regressions@leemhuis.info>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain
X-XM-SPF: eid=1p0Ryk-00BPYx-DH;;;mid=<4e195b030b250e2e338bee0bb1873e38.dominic@xmission.com>;;;hst=in02.mta.xmission.com;;;ip=75.169.132.183;;;frm=dominic@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1953+92SV+K8Rk+AOT3unu/
X-SA-Exim-Connect-IP: 75.169.132.183
X-SA-Exim-Mail-From: dominic@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa05.xmission.com
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=8.0 tests=ALL_TRUSTED,BAYES_50,
	DCC_CHECK_NEGATIVE,TVD_RCVD_IP,T_TM2_M_HEADER_IN_MSG,TooManyTo_001,
	XMSubLong,XM_Multi_Part_URI shortcircuit=no autolearn=disabled
	version=3.4.2
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  0.7 XMSubLong Long Subject
	*  0.0 TVD_RCVD_IP Message was received from an IP address
	*  0.3 TooManyTo_001 Multiple "To" Header Recipients 2x (uncommon)
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	*  1.2 XM_Multi_Part_URI URI: Long-Multi-Part URIs
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa05 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa05 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Greg KH <gregkh@linuxfoundation.org>, Thorsten Leemhuis
	<regressions@leemhuis.info>
X-Spam-Relay-Country: 
X-Spam-Timing: total 876 ms - load_scoreonly_sql: 0.06 (0.0%),
	signal_user_changed: 12 (1.4%), b_tie_ro: 10 (1.2%), parse: 0.89
	(0.1%), extract_message_metadata: 38 (4.3%), get_uri_detail_list: 4.1
	(0.5%), tests_pri_-1000: 66 (7.6%), tests_pri_-950: 1.32 (0.2%),
	tests_pri_-900: 0.97 (0.1%), tests_pri_-200: 0.80 (0.1%),
	tests_pri_-100: 14 (1.7%), tests_pri_-90: 150 (17.1%), check_bayes:
	122 (13.9%), b_tokenize: 10 (1.2%), b_tok_get_all: 12 (1.4%),
	b_comp_prob: 3.9 (0.4%), b_tok_touch_all: 91 (10.4%), b_finish: 1.19
	(0.1%), tests_pri_0: 364 (41.5%), check_dkim_signature: 0.63 (0.1%),
	check_dkim_adsp: 6 (0.6%), poll_dns_idle: 197 (22.5%), tests_pri_10:
	4.3 (0.5%), tests_pri_500: 221 (25.2%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [REGRESSION] v6.0.x fails to boot after updating from v5.19.x
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>

> 
> On Thu, Nov 24, 2022 at 01:08:57AM +0000, Dominic Jones wrote:
> > > On Fri, Oct 28, 2022 at 02:51:43PM +0000, Dominic Jones wrote:
> > > > Updating the machine's kernel from v5.19.x to v6.0.x causes the machine to not
> > > > successfully boot. The machine boots successfully (and exhibits stable operation)
> > > > with version v5.19.17 and multiple earlier releases in the 5.19 line. Multiple releases
> > > > from the 6.0 line (including 6.0.0, 6.0.3, and 6.0.5), with no other changes to the
> > > > software environment, do not boot. Instead, the machine hangs after loading services
> > > > but before presenting a display manager; the machine instead shows repetitive hard
> > > > drive activity at this point and then no apparent activity.
> > > > 
> > > > ''uname'' output for the machine successfully running v5.19.17 is:
> > > > 
> > > >     Linux [MACHINE_NAME] 5.19.17 #1 SMP PREEMPT_DYNAMIC Mon Oct 24 13:32:29 2022 i686 Intel(R) Atom(TM) CPU N270 @ 1.60GHz GenuineIntel GNU/Linux
> > > > 
> > > > The machine is an OCZ Neutrino netbook, running a custom OS build largely similar to
> > > > LFS development. The kernel update uses ''make olddefconfig''.
> > > 
> > > Can you use 'git bisect' to find the offending change that causes this
> > > to happen?
> > 
> > Bisection is complete. Here's what it returned.
> > 
> > ---
> > 
> > 3a194f3f8ad01bce00bd7174aaba1563bcc827eb is the first bad commit
> > commit 3a194f3f8ad01bce00bd7174aaba1563bcc827eb
> > Author: Naoya Horiguchi <naoya.horiguchi@nec.com>
> > Date:   Thu Jul 14 13:24:14 2022 +0900
> > 
> >     mm/hugetlb: make pud_huge() and follow_huge_pud() aware of non-present pud entry
> >     
> >     follow_pud_mask() does not support non-present pud entry now.  As long as
> >     I tested on x86_64 server, follow_pud_mask() still simply returns
> >     no_page_table() for non-present_pud_entry() due to pud_bad(), so no severe
> >     user-visible effect should happen.  But generally we should call
> >     follow_huge_pud() for non-present pud entry for 1GB hugetlb page.
> >     
> >     Update pud_huge() and follow_huge_pud() to handle non-present pud entries.
> >     The changes are similar to previous works for pud entries commit
> >     e66f17ff7177 ("mm/hugetlb: take page table lock in follow_huge_pmd()") and
> >     commit cbef8478bee5 ("mm/hugetlb: pmd_huge() returns true for non-present
> >     hugepage").
> >     
> >     Link: https://lkml.kernel.org/r/20220714042420.1847125-3-naoya.horiguchi@linux.dev
> >     Signed-off-by: Naoya Horiguchi <naoya.horiguchi@nec.com>
> >     Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
> >     Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
> >     Cc: David Hildenbrand <david@redhat.com>
> >     Cc: kernel test robot <lkp@intel.com>
> >     Cc: Liu Shixin <liushixin2@huawei.com>
> >     Cc: Muchun Song <songmuchun@bytedance.com>
> >     Cc: Oscar Salvador <osalvador@suse.de>
> >     Cc: Yang Shi <shy828301@gmail.com>
> >     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> > 
> >  arch/x86/mm/hugetlbpage.c |  8 +++++++-
> >  mm/hugetlb.c              | 32 ++++++++++++++++++++++++++++++--
> >  2 files changed, 37 insertions(+), 3 deletions(-)
> > 

I got two replies here, so I'm responding to both for visibility.

From Greg K H:
> Great!  Please work with those developers to figure out why this is
> causing a problem for your system.

From Thorsten L:
> Many thx for this. A fix for that particular commit for recently
> committed to 6.0.y:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.0.y&id=bccc10be65e365ba8a3215cb702e6f57177eea07
> 
> That thus bears the question: does your problem still happen with the
> latest 6.0.y version?

Version 6.0.9 appears to fix the issue, with no regression as of 6.0.10.
(The issue appeared in 6.0.7. I didn't test 6.0.8 since 6.0.9 had already
appeared by the time bisection was complete.)


Thanks!

Dominic Jones
jonesd@xmission.com
