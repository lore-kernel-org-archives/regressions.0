Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CCC1FC4
	for <regressions@lists.linux.dev>; Wed,  2 Aug 2023 08:45:36 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qR7U6-0005ov-52; Wed, 02 Aug 2023 10:45:34 +0200
Message-ID: <d838ecf5-82e2-044c-206d-cf57de7b4379@leemhuis.info>
Date: Wed, 2 Aug 2023 10:45:33 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: btrfs write-bandwidth performance regression of 6.5-rc4/rc3
Content-Language: en-US, de-DE
To: Wang Yugui <wangyugui@e16-tech.com>, linux-btrfs@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230731152223.4EFB.409509F4@e16-tech.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <20230731152223.4EFB.409509F4@e16-tech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1690965937;e2150ef3;
X-HE-SMSGID: 1qR7U6-0005ov-52

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 31.07.23 09:22, Wang Yugui wrote:
> 
> I noticed a btrfs write-bandwidth performance regression of 6.5-rc4/rc3
> with the compare to btrfs 6.4.0
> 
> test case:
>   disk: NVMe PCIe3 SSD *4 
>   btrfs: -m raid -d raid0
>   fio -name write-bandwidth -rw=write -bs=1024Ki -size=32Gi -runtime=30
>    -iodepth 1 -ioengine sync -zero_buffers=1 -direct=0 -end_fsync=1 -numjobs=4
>    -directory=/mnt/test
> 
> 6.5-rc4/rc3
> 	fio(-numjobs=4) WRITE: bw=1512MiB/s (1586MB/s)
> 	but ‘dd conv=fsync’ works well, 2.1 GiB/s.
> 
> 6.4.0
> 	fio(-numjobs=4) WRITE: bw=4147MiB/s (4349MB/s)
> 
> 'git bisect' between 6.4 and 6.5 is yet not done.
> 

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced da023618076
#regzbot title btrfs: write-bandwidth performance regression with NVMe raid0
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
