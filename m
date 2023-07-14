Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BC5ECF
	for <regressions@lists.linux.dev>; Fri, 14 Jul 2023 03:32:01 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qK9X6-0004gn-Nf; Fri, 14 Jul 2023 05:31:52 +0200
Message-ID: <d644f048-970c-71fe-a556-a2c80444dae2@leemhuis.info>
Date: Fri, 14 Jul 2023 05:31:52 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH net] r8169: fix ASPM-related problem for chip version 42
 and 43
To: Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 joey.joey586@gmail.com
References: <82ea9e63-d8c8-0b86-cd88-913cc249fa9a@gmail.com>
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <82ea9e63-d8c8-0b86-cd88-913cc249fa9a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1689305521;ee7c8a24;
X-HE-SMSGID: 1qK9X6-0004gn-Nf

On 13.07.23 21:46, Heiner Kallweit wrote:
> Referenced commit missed that for chip versions 42 and 43 ASPM

Thanks again for taking care of this.

> [0] https://bugzilla.kernel.org/show_bug.cgi?id=217635

That line should be a proper Link: or Closes: tag, as explained by
Documentation/process/submitting-patches.rst
(http://docs.kernel.org/process/submitting-patches.html) and
Documentation/process/5.Posting.rst
(https://docs.kernel.org/process/5.Posting.html) and thus be in the
signed-off-by area, for example like this (without the space upfront):

> Fixes: 5fc3f6c90cca ("r8169: consolidate disabling ASPM before EPHY access")
 Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217635 # [0]

A "Cc: stable@vger.kernel.org" would be nice, too, to get this fixed in
6.4, where this surfaced (reminder: no, a Fixes: tag is not enough to
ensure the backport there).

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> […]

#regzbot ^backmonitor: https://bugzilla.kernel.org/show_bug.cgi?id=217635

Ciao, Thorsten
