Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5852370
	for <regressions@lists.linux.dev>; Fri,  7 May 2021 09:39:42 +0000 (UTC)
Received: from ip4d14bd53.dynamic.kabel-deutschland.de ([77.20.189.83] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1lewxP-0008B1-6O; Fri, 07 May 2021 11:39:39 +0200
To: Tony Lindgren <tony@atomide.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>, regressions@lists.linux.dev,
 Benoit Cousson <bcousson@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
References: <CA+G9fYtTN6ug3eBAW3wMcDeESUo+ebj7L5HBe5_fj4uqDExFQg@mail.gmail.com>
 <YJPYvsdkfx4JD4vT@atomide.com>
 <CA+G9fYv48aJ6tmSaf_HtRKHse4yN40hEYSPR5=A3W6HRoJ8p_g@mail.gmail.com>
 <YJTz+D9Sp8Eyp+iw@atomide.com>
 <e896704c-c13a-739d-0723-22fec35406ed@leemhuis.info>
 <YJUJ0AMAWvNMaCRu@atomide.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: #regzb introduced: 98feab31ac49 ("ARM: OMAP2+: Drop legacy
 platform data for dra7 sata")
Message-ID: <fac6076d-5d2b-3165-b60a-b17a1ebbc506@leemhuis.info>
Date: Fri, 7 May 2021 11:39:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YJUJ0AMAWvNMaCRu@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-BZ
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1620380382;dc05ce18;
X-HE-SMSGID: 1lewxP-0008B1-6O

On 07.05.21 11:35, Tony Lindgren wrote:
> * Thorsten Leemhuis <linux@leemhuis.info> [210507 08:27]:
>> Great to see that this is about to be fixed. And Naresh, many thx for
>> giving the #regzb tag a try, even if regzbot (shameless plug for the
>> unaware: https://linux-regtracking.leemhuis.info/post/regzbot-approach/
>> ) is not up and running already, much appreciated!
>
> Hmm so the link above does not show where to git clone the regzb program
> from? Or is that not yet published? Just wondering.

The code is still very early WIP, so not yet published, but I'll publish
the first few bits in a week or two, even if they are not yet useful to
anyone besides myself. ;-)

Ciao, Thorsten
