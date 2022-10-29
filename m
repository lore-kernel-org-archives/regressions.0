Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E057A8F40
	for <regressions@lists.linux.dev>; Sat, 29 Oct 2022 23:50:48 +0000 (UTC)
Received: from in01.mta.xmission.com ([166.70.13.51]:54288)
	by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <dominic@xmission.com>)
	id 1oouuB-004wqJ-HN; Sat, 29 Oct 2022 17:06:19 -0600
Received: from 75-169-157-62.slkc.qwest.net ([75.169.157.62]:37780 helo=mail.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <dominic@xmission.com>)
	id 1oouuA-000lwg-Hm; Sat, 29 Oct 2022 17:06:19 -0600
Date: Sat, 29 Oct 2022 23:04:20 +0000
Message-ID: <e70421fc67d06853c0aaf3d3507129b2.dominic@xmission.com>
From: Dominic Jones <jonesd@xmission.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain
X-XM-SPF: eid=1oouuA-000lwg-Hm;;;mid=<e70421fc67d06853c0aaf3d3507129b2.dominic@xmission.com>;;;hst=in01.mta.xmission.com;;;ip=75.169.157.62;;;frm=dominic@xmission.com;;;spf=softfail
X-XM-AID: U2FsdGVkX19ARMVLhTVrD154DOF9reOe
X-SA-Exim-Connect-IP: 75.169.157.62
X-SA-Exim-Mail-From: dominic@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa07.xmission.com
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=8.0 tests=ALL_TRUSTED,BAYES_50,
	DCC_CHECK_NEGATIVE,TVD_RCVD_IP,T_TM2_M_HEADER_IN_MSG,XMSubLong,
	XM_SPF_SoftFail autolearn=disabled version=3.4.2
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5190]
	*  0.7 XMSubLong Long Subject
	*  0.0 TVD_RCVD_IP Message was received from an IP address
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
	*  2.5 XM_SPF_SoftFail SPF-SoftFail
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ***;Greg KH <gregkh@linuxfoundation.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 470 ms - load_scoreonly_sql: 0.04 (0.0%),
	signal_user_changed: 9 (1.9%), b_tie_ro: 8 (1.7%), parse: 0.99 (0.2%),
	extract_message_metadata: 4.2 (0.9%), get_uri_detail_list: 1.56 (0.3%),
	 tests_pri_-1000: 6 (1.2%), tests_pri_-950: 1.73 (0.4%),
	tests_pri_-900: 1.39 (0.3%), tests_pri_-90: 234 (49.8%), check_bayes:
	231 (49.2%), b_tokenize: 8 (1.6%), b_tok_get_all: 7 (1.4%),
	b_comp_prob: 3.6 (0.8%), b_tok_touch_all: 210 (44.6%), b_finish: 0.98
	(0.2%), tests_pri_0: 192 (40.8%), check_dkim_signature: 0.64 (0.1%),
	check_dkim_adsp: 2.6 (0.6%), poll_dns_idle: 0.67 (0.1%), tests_pri_10:
	2.1 (0.4%), tests_pri_500: 6 (1.3%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [REGRESSION] v6.0.x fails to boot after updating from v5.19.x
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>

Greetings,

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

Thanks for the reply; I'll see if I can get up to speed on ''git bisect'' -- that'll
be new to me. (This is the first time I've run into a kernel issue.)


Dominic
