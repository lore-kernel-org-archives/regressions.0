Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48BC8824
	for <regressions@lists.linux.dev>; Thu,  6 Jul 2023 10:54:22 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qHMco-0005gy-HF; Thu, 06 Jul 2023 12:54:14 +0200
Message-ID: <7336b8ea-64bd-d08d-1d85-bf942d5660e2@leemhuis.info>
Date: Thu, 6 Jul 2023 12:54:13 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: vmalloc error: btrfs-delalloc btrfs_work_helper [btrfs] in
 kernel 6.3.x
To: Forza <forza@tnonline.net>, Uladzislau Rezki <urezki@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux btrfs <linux-btrfs@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Stable <stable@vger.kernel.org>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 a1bert@atlas.cz
References: <efa04d56-cd7f-6620-bca7-1df89f49bf4b@gmail.com>
 <fcf1d04.faed4a1a.18844d8e78f@tnonline.net> <ZGwcVTpQNBoJHBB+@debian.me>
 <ZGyVVQxnw6Tn7Xb8@pc636> <c9db92d.faed4a1c.1884c5550fb@tnonline.net>
 <20230524091357.GH32559@suse.cz> <ZHClGA9szxSqzDf8@pc636>
 <cf07f03.70397026.18918ef7f95@tnonline.net>
 <2063d59.8f9f4a3a.1892a3ec50f@tnonline.net>
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <2063d59.8f9f4a3a.1892a3ec50f@tnonline.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1688640862;567aa82e;
X-HE-SMSGID: 1qHMco-0005gy-HF

On 06.07.23 10:08, Forza wrote:
>>> On Wed, May 24, 2023 at 11:13:57AM +0200, David Sterba wrote:
> [...]
> A small update.

Thx for this.

> I have been able test 6.2.16, all 6.3.x and 6.4.1 and they all show
> the same issue.
> 
> I am now trying 6.1.37 since two days and have not been able to
> reproduce this issue on any of my virtual qemu/kvm machines. Perhaps
> this information is helpful in finding the root cause?

That means it's most likely a regression between v6.1..v6.2 (or
v6.1..v6.2.16 if we are unlucky) somewhere (from earlier in the thread
it sounds like it might not be Btrfs).

Which makes we wonder: how long do you usually need to reproduce the
issue? If it's not too long it might mean that a bisection is the best
way forward, unless some developer sits down and looks closely at the
logs. With a bit of luck some dev will do that; but if we are unlucky we
likely will need a bisection.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

