Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34582E4EF
	for <regressions@lists.linux.dev>; Mon, 20 Mar 2023 12:40:38 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1peEoV-0005eR-6v; Mon, 20 Mar 2023 13:40:35 +0100
Message-ID: <16171331-8301-738e-8c1d-b48a11275ce9@leemhuis.info>
Date: Mon, 20 Mar 2023 13:40:33 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [regression] Bug 217165 - NFS cache stops working if accessed
 from process with PPID of 1
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Chengen Du <chengen.du@canonical.com>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
References: <1ee77457-3345-0f7f-a0d0-fa8eced53b8f@leemhuis.info>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna@kernel.org>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <1ee77457-3345-0f7f-a0d0-fa8eced53b8f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1679316038;0900a51d;
X-HE-SMSGID: 1peEoV-0005eR-6v

[adding the author of the culprit, the NFS maintainers & list and lkml
to the list of recipients]

On 10.03.23 10:42, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> [TLDR: Just adding a regression reported to bko to the tracking]
> 
> Hi, Thorsten here, the Linux kernel's regression tracker. I noticed a
> regression reported in bugzilla.kernel.org that likely will be handled
> there (normally the NFS developer do that),

Seems I was wrong in this case or in general, as that bug report didn't
get a single reply yet. Hence this mail to ensure the right people have
it on their radar. Or was some progress to address this made and I just
missed it?

> nevertheless I'd like to add
> to the tracking to ensure it's doesn't fall through the cracks in the end:
> 
> #regzbot introduced: 029085b8949f5d269ae
> https://bugzilla.kernel.org/show_bug.cgi?id=217165
> #regzbot title: nfs: cache stops working if accessed from process with
> PPID of 1
> #regzbot ignore-activity
> 
> See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke
