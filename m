Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DE711734
	for <regressions@lists.linux.dev>; Fri, 27 Oct 2023 08:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qwHt8-0004YH-EQ; Fri, 27 Oct 2023 10:08:14 +0200
Message-ID: <01c00d16-1441-4ef7-bf28-795b84d9de24@leemhuis.info>
Date: Fri, 27 Oct 2023 10:08:13 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: bbbf096ea227607cbb348155eeda7af71af1a35b results in "dirty"
 shutdown
Content-Language: en-US, de-DE
To: Damien Le Moal <dlemoal@kernel.org>, Bagas Sanjaya
 <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux IDE and libata <linux-ide@vger.kernel.org>
Cc: Hannes Reinecke <hare@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Tejun Heo
 <tj@kernel.org>, Totallyreal Name <kotversuchung@gmail.com>,
 loqs <kernel_bugzilla@entropy-collector.net>
References: <cd397c88-bf53-4768-9ab8-9d107df9e613@gmail.com>
 <a704bb1e-4be0-46f8-8118-a18b0547375f@kernel.org>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <a704bb1e-4be0-46f8-8118-a18b0547375f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698394103;0cfba280;
X-HE-SMSGID: 1qwHt8-0004YH-EQ

On 27.10.23 09:41, Damien Le Moal wrote:
> On 10/25/23 09:40, Bagas Sanjaya wrote:
>>
>> I notice a regression report on Bugzilla that seems to have been
>> handled already there [1]. Quoting from it:
> [...]
>>> [1]: https://bugs.archlinux.org/task/80064
>>> [2]: https://bugs.archlinux.org/task/80064#comment223100
>>> [3]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=bbbf096ea227607cbb348155eeda7af71af1a35b
>>> [4]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aa3998dbeb3abce63653b7f6d4542e7dcd022590
>>
>> See Bugzilla for the full thread.
>>
>> Anyway, I'm adding this regression to regzbot:
>>
>> #regzbot introduced: aa3998dbeb3abc https://bugzilla.kernel.org/show_bug.cgi?id=218038
>> #regzbot title: dirty shutdown due to disabling manage_system_start_stop on SCSI devices
>> #regzbot link: https://bugs.archlinux.org/task/80064

Damien, many thx for handling this regression so quickly.

FWIW, a quick remark, as it might save you (and others seeing this) some
work in the future:

> #regzbot fixed-by: 24eca2dce0f8d19db808c972b0281298d0bafe99

Telling regzbot about this is nice, but not really needed[1], as your
fix afaics contains links to the reports that are tracked by regzbot.
Hence regzbot would have noticed the fix automatically once it lands in
next or mainline[2], just like it noticed and tracked the patches you
posted for review earlier.

Ciao, Thorsten

[1] it just makes it a little more obvious that a fix is now incoming

[2] there is a bug there somewhere that make it fail sometimes, but I'll
sooner or later catch it
