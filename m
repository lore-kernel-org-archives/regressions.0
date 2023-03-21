Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7639447
	for <regressions@lists.linux.dev>; Tue, 21 Mar 2023 11:54:57 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1peaZk-0003yv-QP; Tue, 21 Mar 2023 12:54:48 +0100
Message-ID: <b5920311-abbe-1b00-5bb5-66a545f2d481@leemhuis.info>
Date: Tue, 21 Mar 2023 12:54:48 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [regression] Bug 217165 - NFS cache stops working if accessed
 from process with PPID of 1
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Chengen Du <chengen.du@canonical.com>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna@kernel.org>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <1ee77457-3345-0f7f-a0d0-fa8eced53b8f@leemhuis.info>
 <16171331-8301-738e-8c1d-b48a11275ce9@leemhuis.info>
In-Reply-To: <16171331-8301-738e-8c1d-b48a11275ce9@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1679399697;f4d4e4a2;
X-HE-SMSGID: 1peaZk-0003yv-QP

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 20.03.23 13:40, Thorsten Leemhuis wrote:
> [adding the author of the culprit, the NFS maintainers & list and lkml
> to the list of recipients]

Chengen Du, thx for replying in bugzilla!

> On 10.03.23 10:42, Linux regression tracking #adding (Thorsten Leemhuis)
> wrote:
> 
> Seems I was wrong in this case or in general, as that bug report didn't
> get a single reply yet. Hence this mail to ensure the right people have
> it on their radar. Or was some progress to address this made and I just
> missed it?
> 
>> nevertheless I'd like to add
>> to the tracking to ensure it's doesn't fall through the cracks in the end:
>>
>> #regzbot introduced: 029085b8949f5d269ae
>> https://bugzilla.kernel.org/show_bug.cgi?id=217165
>> #regzbot title: nfs: cache stops working if accessed from process with
>> PPID of 1
>> #regzbot ignore-activity

#regzbot fix: 21fd9e8700de86d1169f6336e97d7a74916ed0
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
