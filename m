Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D464C60
	for <regressions@lists.linux.dev>; Fri,  3 Feb 2023 12:39:42 +0000 (UTC)
Received: from [94.107.229.70] (helo=[192.168.31.91]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pNvLv-0008Jt-U5; Fri, 03 Feb 2023 13:39:39 +0100
Message-ID: <108fdc3a-58a1-c32a-efa6-aa0b5645e862@leemhuis.info>
Date: Fri, 3 Feb 2023 13:39:39 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: git regression failures with v6.2-rc NFS client
Content-Language: en-US, de-DE
To: Chuck Lever III <chuck.lever@oracle.com>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>
References: <9A4A5673-691D-47EC-BC44-C43BE7E50A48@oracle.com>
From: "Linux kernel regression tracking (#adding)" <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <9A4A5673-691D-47EC-BC44-C43BE7E50A48@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1675427982;136d2002;
X-HE-SMSGID: 1pNvLv-0008Jt-U5

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 31.01.23 22:15, Chuck Lever III wrote:
>
> I upgraded my test client's kernel to v6.2-rc5 and now I get
> failures during the git regression suite on all NFS versions.
> I bisected to:
> 
> 85aa8ddc3818 ("NFS: Trigger the "ls -l" readdir heuristic sooner")
> 
> The failure looks like:
> [...]

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 85aa8ddc3818
#regzbot title nfs: failures during the git regression suite on all NFS
versions
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
