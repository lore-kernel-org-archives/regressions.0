Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF77728E8
	for <regressions@lists.linux.dev>; Fri, 28 Oct 2022 15:12:34 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:50772)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <dominic@xmission.com>)
	id 1ooQjq-00BuE4-5d; Fri, 28 Oct 2022 08:53:38 -0600
Received: from 75-169-157-62.slkc.qwest.net ([75.169.157.62]:40194 helo=mail.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <dominic@xmission.com>)
	id 1ooQjp-00H7uo-AP; Fri, 28 Oct 2022 08:53:37 -0600
Date: Fri, 28 Oct 2022 14:51:43 +0000
Message-ID: <379d4e6478c763dec8baaa6009b379f1.dominic@xmission.com>
From: Dominic Jones <jonesd@xmission.com>
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain
X-XM-SPF: eid=1ooQjp-00H7uo-AP;;;mid=<379d4e6478c763dec8baaa6009b379f1.dominic@xmission.com>;;;hst=in02.mta.xmission.com;;;ip=75.169.157.62;;;frm=dominic@xmission.com;;;spf=softfail
X-XM-AID: U2FsdGVkX19jWLaTNXRZtjNgaosfCt5Q
X-SA-Exim-Connect-IP: 75.169.157.62
X-SA-Exim-Mail-From: dominic@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa02.xmission.com
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=8.0 tests=ALL_TRUSTED,BAYES_50,
	DCC_CHECK_NEGATIVE,TVD_RCVD_IP,XMSubLong,XM_SPF_SoftFail
	autolearn=disabled version=3.4.2
X-Spam-Virus: No
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5003]
	*  0.7 XMSubLong Long Subject
	*  0.0 TVD_RCVD_IP Message was received from an IP address
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa02 1397; Body=1 Fuz1=1 Fuz2=1]
	*  2.5 XM_SPF_SoftFail SPF-SoftFail
X-Spam-DCC: XMission; sa02 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ***;stable@vger.kernel.org
X-Spam-Relay-Country: 
X-Spam-Timing: total 359 ms - load_scoreonly_sql: 0.03 (0.0%),
	signal_user_changed: 4.0 (1.1%), b_tie_ro: 2.8 (0.8%), parse: 0.53
	(0.1%), extract_message_metadata: 8 (2.1%), get_uri_detail_list: 0.70
	(0.2%), tests_pri_-1000: 11 (3.1%), tests_pri_-950: 1.09 (0.3%),
	tests_pri_-900: 0.79 (0.2%), tests_pri_-90: 142 (39.5%), check_bayes:
	140 (39.1%), b_tokenize: 3.4 (1.0%), b_tok_get_all: 5 (1.5%),
	b_comp_prob: 1.39 (0.4%), b_tok_touch_all: 128 (35.5%), b_finish: 0.67
	(0.2%), tests_pri_0: 182 (50.7%), check_dkim_signature: 0.32 (0.1%),
	check_dkim_adsp: 2.4 (0.7%), poll_dns_idle: 0.94 (0.3%), tests_pri_10:
	1.70 (0.5%), tests_pri_500: 6 (1.7%), rewrite_mail: 0.00 (0.0%)
Subject: [REGRESSION] v6.0.x fails to boot after updating from v5.19.x
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>

Updating the machine's kernel from v5.19.x to v6.0.x causes the machine to not
successfully boot. The machine boots successfully (and exhibits stable operation)
with version v5.19.17 and multiple earlier releases in the 5.19 line. Multiple releases
from the 6.0 line (including 6.0.0, 6.0.3, and 6.0.5), with no other changes to the
software environment, do not boot. Instead, the machine hangs after loading services
but before presenting a display manager; the machine instead shows repetitive hard
drive activity at this point and then no apparent activity.

''uname'' output for the machine successfully running v5.19.17 is:

    Linux [MACHINE_NAME] 5.19.17 #1 SMP PREEMPT_DYNAMIC Mon Oct 24 13:32:29 2022 i686 Intel(R) Atom(TM) CPU N270 @ 1.60GHz GenuineIntel GNU/Linux

The machine is an OCZ Neutrino netbook, running a custom OS build largely similar to
LFS development. The kernel update uses ''make olddefconfig''.

#regzbot introduced: v5.19..v6.0


---
Dominic Jones
jonesd@xmission.com
