Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB8E14011
	for <regressions@lists.linux.dev>; Fri, 13 Oct 2023 12:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qrGv4-0004ip-VD; Fri, 13 Oct 2023 14:05:31 +0200
Message-ID: <9787bd09-91b3-4a79-9ca9-e7199c925f36@leemhuis.info>
Date: Fri, 13 Oct 2023 14:05:29 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [regression] some Dell systems hang at shutdown due to "x86/smp: Put
 CPUs into INIT on shutdown if possible" (was Fwd: Kernel 6.5 hangs on
 shutdown)
Content-Language: en-US, de-DE
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Yanjun Yang <yangyj.ee@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Bagas Sanjaya <bagasdotme@gmail.com>, "Borislav Petkov (AMD)"
 <bp@alien8.de>, Ashok Raj <ashok.raj@intel.com>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 the arch/x86 maintainers <x86@kernel.org>
References: <e6d1dae8-e28a-455a-a851-661c825fbdcf@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <e6d1dae8-e28a-455a-a851-661c825fbdcf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1697198742;a983dc30;
X-HE-SMSGID: 1qrGv4-0004ip-VD

[CCing x86 maintainers]

Hi Thomas!

On 12.10.23 11:37, Bagas Sanjaya wrote:
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
>>> I use Dell OptiPlex 7050, and kernel hangs when shutting down the
computer.
>> Similar symptom has been reported on some forums, and all of them are using
>> Dell computers:
>> https://bbs.archlinux.org/viewtopic.php?pid=2124429
>> https://www.reddit.com/r/openSUSE/comments/16qq99b/tumbleweed_shutdown_did_not_finish_completely/
>> https://forum.artixlinux.org/index.php/topic,5997.0.html

Another report: https://bugzilla.redhat.com/show_bug.cgi?id=2241279

From all those links it seems quite a lot of users with Dell machines
are affected by this problem.

>> Tested with various kernel and this bug seems to be caused by commit: 88afbb21d4b36fee6acaa167641f9f0fc122f01b.

Thomas, turns out that bisection result was slightly wrong: a recheck
confirmed that the regression is actually caused by 45e34c8af58f23
("x86/smp: Put CPUs into INIT on shutdown if possible") [v6.5-rc1] of
yours. See https://bugzilla.kernel.org/show_bug.cgi?id=217995 for details.

Ciao, Thorsten

> Anyway, I'm adding this regression to be tracked by regzbot:
> [...]

#regzbot introduced: 45e34c8af58f
#regzbot link: https://bugzilla.redhat.com/show_bug.cgi?id=2241279
