Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C923D8E
	for <regressions@lists.linux.dev>; Thu,  3 Aug 2023 14:12:16 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qRZ3g-00060s-Kt; Thu, 03 Aug 2023 16:12:08 +0200
Message-ID: <75318e5a-2b84-5be5-6d4d-311d99dd6e54@leemhuis.info>
Date: Thu, 3 Aug 2023 16:12:08 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: YouTube Broken Since Last Update(s)
Content-Language: en-US, de-DE
To: Misty Plianca <thepalpatinelives@gmail.com>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, admin@linuxmint.com, root@linuxmint.com
References: <1ff785e1-479e-a822-73dc-cd713a2781c5@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <1ff785e1-479e-a822-73dc-cd713a2781c5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1691071938;2147b5d3;
X-HE-SMSGID: 1qRZ3g-00060s-Kt

On 03.08.23 15:47, Misty Plianca wrote:
> 
> Since installing the latest updates for Linux Mint yesterday or this
> morning, YouTube is acting super goofy via Brave Browser. I cannot
> search for anything at all. Nothing happens. Secondly, it is
> occasionally reporting that it is disconnected from the internet and to
> try again. Firefox works fine, however. I reported the issue to Brave,
> and have now communicated this with you to be certain everyone is aware.
> 
> I have some other stuff to discuss with you when you are available. I
> have information that you may find helpful and disturbing regarding
> Linux security. If you would like to discuss this, please reply.
> 
> My System:
> 
> Kernel: 5.4.0-155-generic x86_64 bits: 64 compiler: gcc v: 9.4.0
> Desktop: Cinnamon 5.2.7 wm: muffin dm: LightDM Distro: Linux Mint 20.3 Una
> base: Ubuntu 20.04 focal

Thx for your report. FWIW, as you might not know this: the developers of
the upstream Linux kernel are extremely unlikely to look into your
report, as you apparently use a heavily modified vendor kernel -- and
any of those changes might cause problems that are not present in the
upstream kernel, hence it's up to the vendor to take care of supporting
it, as explained here:
https://linux-regtracking.leemhuis.info/post/frequent-reasons-why-linux-kernel-bug-reports-are-ignored/

If you suspect this to be a regression that originates in the upstream
kernel, please validate with vanilla kernels: first check if the latest
version is also broken, then check if earlier ones worked; ideally
bisect to find the change causing it.

Ciao, Thorsten
