Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC4B1C287
	for <regressions@lists.linux.dev>; Fri, 13 Oct 2023 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qrKYV-0001X0-4m; Fri, 13 Oct 2023 17:58:27 +0200
Message-ID: <fba67ba1-884a-4462-98d2-5de285015dad@leemhuis.info>
Date: Fri, 13 Oct 2023 17:58:26 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: probable quota bug introduced in 6.6-rc1
Content-Language: en-US, de-DE
To: Linux ext4 <linux-ext4@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Filesystems Development <linux-fsdevel@vger.kernel.org>
References: <ZRytn6CxFK2oECUt@debian-BULLSEYE-live-builder-AMD64>
 <ZR0M-CFmh567Ogyg@debian.me>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZR0M-CFmh567Ogyg@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1697212709;b47a5862;
X-HE-SMSGID: 1qrKYV-0001X0-4m

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 04.10.23 08:58, Bagas Sanjaya wrote:
> On Tue, Oct 03, 2023 at 08:11:11PM -0400, Eric Whitney wrote:
>> When run on my test hardware, generic/270 triggers hung task timeouts when
>> run on a 6.6-rc1 (or -rc2, -rc3, -rc4) kernel with kvm-xfstests using the
>> nojournal test scenario.  The test always passes, but about 60% of the time
>> the running time of the test increases by an order of magnitude or more and
>> one or more of the hung task timeout warnings included below can be found in
>> the log.
>>
>> This does not reproduce on 6.5.  Bisection leads to this patch:
>>
>> dabc8b207566 ("quota: fix dqput() to follow the guarantees dquot_srcu should
>> provide")

#regzbot fix: 869b6ea1609f65
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

