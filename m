Received: from muru.com (muru.com [72.249.23.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCFF70
	for <regressions@lists.linux.dev>; Fri,  7 May 2021 09:23:28 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id C992681AC;
	Fri,  7 May 2021 09:23:27 +0000 (UTC)
Date: Fri, 7 May 2021 12:23:22 +0300
From: Tony Lindgren <tony@atomide.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	regressions@lists.linux.dev, Benoit Cousson <bcousson@baylibre.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: #regzb introduced: 98feab31ac49 ("ARM: OMAP2+: Drop legacy
 platform data for dra7 sata")
Message-ID: <YJUHCpjsAY7ZnHjJ@atomide.com>
References: <CA+G9fYtTN6ug3eBAW3wMcDeESUo+ebj7L5HBe5_fj4uqDExFQg@mail.gmail.com>
 <YJPYvsdkfx4JD4vT@atomide.com>
 <CA+G9fYv48aJ6tmSaf_HtRKHse4yN40hEYSPR5=A3W6HRoJ8p_g@mail.gmail.com>
 <YJTz+D9Sp8Eyp+iw@atomide.com>
 <e896704c-c13a-739d-0723-22fec35406ed@leemhuis.info>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e896704c-c13a-739d-0723-22fec35406ed@leemhuis.info>

Hi,

* Thorsten Leemhuis <linux@leemhuis.info> [210507 08:27]:
> Ohh, and Tony, if you want to do me a favour please include
> 
> Link:
> https://lore.kernel.org/regressions/CA+G9fYtTN6ug3eBAW3wMcDeESUo+ebj7L5HBe5_fj4uqDExFQg@mail.gmail.com/
> 
> in the commit message of the fix, then I have some real data already at
> hand to test regzbot in practice. :-D

OK sent with a fixes and link tag. As a test, I sent it to the lists I
usually send patches to for this driver. The subject line is different,
and I left out all the extra Cc including you and regzb mailing list as
those are easy to forget to add to the mail. Let's see if regzb finds
the fix based on the Link or Fixes tag :)

Regards,

Tony
