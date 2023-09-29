Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5E01864
	for <regressions@lists.linux.dev>; Fri, 29 Sep 2023 11:49:28 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qmBzq-0005kV-8i; Fri, 29 Sep 2023 13:49:26 +0200
Message-ID: <9d6bb342-0a09-4ec5-99d7-81e095ff5cee@leemhuis.info>
Date: Fri, 29 Sep 2023 13:49:25 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Possible nvme regression in 6.4.11
Content-Language: en-US, de-DE
To: linux-kernel@vger.kernel.org
Cc: linux-nvme@lists.infradead.org,
 Linux Regressions <regressions@lists.linux.dev>
References: <5f968b95-6b1c-4d6f-aac7-5d54f66834a8@sapience.com>
 <ZN2NUIg3k5VgMg63@debian.me>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZN2NUIg3k5VgMg63@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695988168;ad31f888;
X-HE-SMSGID: 1qmBzq-0005kV-8i

On 17.08.23 05:00, Bagas Sanjaya wrote:
> On Wed, Aug 16, 2023 at 04:39:34PM -0400, Genes Lists wrote:

> Thanks for the regression report. I'm adding it to regzbot:
> 
> #regzbot ^introduced: 101bd907b4244a
> #regzbot title: can't change Samsung SSD power state due to ASPM mode checking
> #regzbot monitor: https://bugzilla.kernel.org/show_bug.cgi?id=217802

Fix is in Gregs tree and hopefully soon in mainline:

#regzbot fix: 0e4cac557531a4
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.



