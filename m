Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948DE7EE
	for <regressions@lists.linux.dev>; Sun, 27 Aug 2023 14:50:07 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qaH5Z-0000QF-8X; Sun, 27 Aug 2023 16:50:05 +0200
Message-ID: <6d1d13b2-321b-98d3-1a5e-b2c99d30675e@leemhuis.info>
Date: Sun, 27 Aug 2023 16:50:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Manual "post vacation" Linux regressions report for mainline
 [2023-08-27]
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693147807;0e744f1c;
X-HE-SMSGID: 1qaH5Z-0000QF-8X

Hi Linus! I got back from vacation ~24 hours ago; tried to briefly look
into the state of things for mainline and didn't notice anything
worrying. But well, it's quite possible that I missed something
important that was reported during the past two weeks. :-/

For completeness, there were two minor things I noticed where a fix is
within reach:

* The patch for a TPM change (which was a regression fix as well) that
breaks S3 on some Intel systems is still under discussion, but from what
I understand the issue occurs only rarely on production machines:
https://lore.kernel.org/lkml/20230822231510.2263255-1-jarkko@kernel.org/

  Reports were here:
https://lore.kernel.org/lkml/485e8740385239b56753ce01d8995f01f84a68e5.camel@linux.intel.com/
https://bugzilla.kernel.org/show_bug.cgi?id=217804

* Seems Herbert applied a fix for a s390x oops for a commit from this
cycle only to his for-next branch:
https://lore.kernel.org/all/97730.1690408399@warthog.procyon.org.uk/

  I only noticed this now. :-/ But this is likely rare as well. FWIW,
report and link to fix in next:
https://lore.kernel.org/r/CAAUqJDuRkHE8fPgZJGaKjUjd3QfGwzfumuJBmStPqBhubxyk_A@mail.gmail.com/
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=6a4b8aa0a916b39a39175584c07222434fa6c6ef

HTH, Ciao, Thorsten
