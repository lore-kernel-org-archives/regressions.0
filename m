Received: from mail.lichtvoll.de (luna.lichtvoll.de [194.150.191.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CBA4C7B
	for <regressions@lists.linux.dev>; Fri,  8 Sep 2023 12:02:41 +0000 (UTC)
Received: from 127.0.0.1 (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mail.lichtvoll.de (Postfix) with ESMTPSA id 510DA7A0B17;
	Fri,  8 Sep 2023 13:54:48 +0200 (CEST)
Authentication-Results: mail.lichtvoll.de;
	auth=pass smtp.auth=martin smtp.mailfrom=martin@lichtvoll.de
From: Martin Steigerwald <martin@lichtvoll.de>
To: linux-btrfs@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Cc: Qu Wenruo <quwenruo.btrfs@gmx.com>, Tim Cuthbertson <ratcheer@gmail.com>
Subject: Re: Scrub of my nvme SSD has slowed by about 2/3
Date: Fri, 08 Sep 2023 13:54:47 +0200
Message-ID: <2169630.irdbgypaU6@lichtvoll.de>
In-Reply-To: <efbe13a5-1c6d-e6fe-25be-bd942823432c@leemhuis.info>
References:
 <CAAKzf7=yS9vnf5zNid1CyvN19wyAgPz5o9sJP0vBqN6LReqXVg@mail.gmail.com>
 <1d611dbb-8aee-9a6e-701c-6498f1b51c34@leemhuis.info>
 <efbe13a5-1c6d-e6fe-25be-bd942823432c@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Thorsten, Qu, Tim, everyone,

Linux regression tracking #update (Thorsten Leemhuis) - 29.08.23, 14:17:33 
CEST:
> On 12.07.23 13:02, Linux regression tracking #adding (Thorsten Leemhuis)
> wrote:
> > On 03.07.23 22:19, Tim Cuthbertson wrote:
> >> Yesterday, I noticed that a scrub of my main system filesystem has
> >> slowed from about 2.9 gb/sec to about 949 mb/sec. My scrub used to
> >> run
> >> in about 12 seconds, now it is taking 51 seconds. I had just
> >> installed
> >> Linux kernel 6.4.1 on Arch Linux, upgrading from 6.3.9. At first I
> >> suspected the new kernel, but now I am not so sure.
> > 
> > Thanks for the report. It seems it will take some work to address
> > this,
> > so to be sure the issue doesn't fall through the cracks unnoticed, I'm
> > adding it to regzbot, the Linux kernel regression tracking bot:
> > 
> > #regzbot ^introduced e02ee89baa66
> 
> #regzbot resolve: various changes merged for 6.6 improve things again;
> more planned; backporting is planned, too;
> #regzbot ignore-activity
> 
> (yes, that is not idea, but that's how it is sometimes)

ideal?

Scrubbing "/home" with 304.61GiB (interestingly both back then with 6.4 
and now with 6.5.2):

- 6.4: 966.84MiB/s
- 6.5.2:  748.02MiB/s

I expected an improvement.

Same Lenovo ThinkPad T14 AMD Gen 1 with AMD Ryzen 7 PRO 4750U, 32 GiB RAM 
and 2TB Samsung 980 Pro NVME SSD as before.

Ciao,
-- 
Martin


