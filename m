Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2469C7498
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 13:30:24 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qlUcP-0007o8-2A; Wed, 27 Sep 2023 15:30:21 +0200
Message-ID: <ac51e942-7348-411d-8532-99fe0101df2b@leemhuis.info>
Date: Wed, 27 Sep 2023 15:30:20 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: Data corruption with 5.10.x client -> 6.5.x server
Content-Language: en-US, de-DE
To: =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>,
 linux-nfs@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <f1d0b234-e650-0f6e-0f5d-126b3d51d1eb@gmail.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <f1d0b234-e650-0f6e-0f5d-126b3d51d1eb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695821425;b5482b0a;
X-HE-SMSGID: 1qlUcP-0007o8-2A

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 24.09.23 15:07, Mantas Mikulėnas wrote:
> I've recently upgraded my home NFS server from 6.4.12 to 6.5.4 (running
> Arch Linux x86_64).
> 
> Now, when I'm accessing the server over NFSv4.2 from a client that's
> running 5.10.0 (32-bit x86, Debian 11), if the mount is using sec=krb5i
> or sec=krb5p, trying to read a file that's <= 4092 bytes in size will
> return all-zero data. (That is, `hexdump -C file` shows "00 00 00...")
> Files that are 4093 bytes or larger seem to be unaffected.
> 
> Only sec=krb5i/krb5p are affected by this – plain sec=krb5 (or sec=sys
> for that matter) seems to work without any problems.
> 
> Newer clients (like 6.1.x or 6.4.x) don't seem to have any issues, it's
> only 5.10.0 that does... though it might also be that the client is
> 32-bit, but the same client did work previously when the server was
> running older kernels, so I still suspect 6.5.x on the server being the
> problem.
> 
> Upgrading to 6.6.0-rc2 on the server hasn't changed anything.
> The server is using Btrfs but I've tested with tmpfs as well.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 703d7521555504b3a316b105b4806d641
#regzbot title nfs: Data corruption with 5.10.x client -> 6.5.x server
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
