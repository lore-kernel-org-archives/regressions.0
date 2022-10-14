Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4CC63A
	for <regressions@lists.linux.dev>; Fri, 14 Oct 2022 09:37:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 072865C00BA;
	Fri, 14 Oct 2022 05:37:42 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 14 Oct 2022 05:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1665740262; x=1665826662; bh=psRGotoCAz
	loqk1qZuGwB6mybx3HJ07mki+PNF3q/YQ=; b=F9sOVc/vcSeuRDFyhAG6ap5rJs
	gGKFd6STnjAnczslV9BWi4dcYPnj5MhDoPmVmUU9sQtwQ+6Q+65bIUwkMgt6lciZ
	4b++m8elA7yXphM+QbXG79bHPz+Tby3zz5lsBIuzcm46viciXa1Vc+AY0Rpkmbh+
	v+9E7hLi8GBl8XNlllQDjHoEOA+FSM7RzGTGeB8cMOaGjd1YAs2k/nWivVQbqDME
	U4Z1FyZj9XSS9yEtXuqQo+ZkzlHk/+vq+jlws/hyFDDz60lFFk8kTMTiWj/ryvFD
	1bIK04TtEwA0MNIZZzulpKrxr+kERu60ScFXt79EoQKf0etwFsaU6jg1SvVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1665740262; x=1665826662; bh=psRGotoCAzloqk1qZuGwB6mybx3H
	J07mki+PNF3q/YQ=; b=LtoSLpDYcaC2rGFCLZR1DEuzYafMUgca6L5zhEh3OUb+
	gPgXZWHFDG3StO2vUjLqeCSrEAAEqihFdxSR+rQoAB21KI7XfTUKaGshH5T6Ckv/
	OnF1brWCarPFSkuAgnsOEy0z4Mm8pmcXQsuTR0NLXtlBBGjZgP6k64+dWjGRiROn
	OQGGTQ5JrwnGjroffmRlZda1TIBRUz644Hxf5IeulXhbHHTVutGT3Z/MuASXKzb9
	4lIp8oe/nnLiaqbLnOJEjEmFIbtEixpe4kAoSd0VHYG9zuEwkvPsjRX/sy8CSOc2
	Er9Ddg1OrGEJTE1V4tYlqTO7eYBex+7vV/sWRfY+cQ==
X-ME-Sender: <xms:5C1JY9gX37tAScXt1Lt9-cg-gkNX8IAZQXOjbvNsoO4jI3PfduLBJQ>
    <xme:5C1JYyBTfwA3wWvZPBajd088FiUWrNXFO2-urP7TjkN7J-sv3IQbwvgkfzv064z_j
    -KsMku5esFGlxrteUo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekvddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:5C1JY9F8xfO-LxQBKlderIax65SewA1UTkn3kaiKZCyS8T_V73KvNA>
    <xmx:5C1JYyRXyczAqBxOUGbtFs7rqUEy6Q1nKrDhIbaUIfgubmj5zGR1Eg>
    <xmx:5C1JY6w2eN8CtNgRRGggFyou9bA-M-1n9GwRfhDoCkeTUvVdptf0wg>
    <xmx:5i1JY5k7gZY1cuDpWSKOreYZzXXTPpWLA017FsAOUhgn_U1vQbDs0g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DA3A9B60086; Fri, 14 Oct 2022 05:37:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <d087c831-1519-4b83-8cc1-5317659709be@app.fastmail.com>
In-Reply-To: 
 <CADYN=9JiX-=PcKMzAcSm=p7Dh6kYT7Kbv-8kcNF0MQ4=1hFS5g@mail.gmail.com>
References: 
 <CA+G9fYvRXkjeO+yDEQxwJ8+GjSmwhZ7XHHAaVWAsxAaSngj5gg@mail.gmail.com>
 <bf1b053d-ffa6-48ab-d2d2-d59ab21afc19@opensource.wdc.com>
 <CA+G9fYvUnn0cS+_DZm8hAfi=FnMB08+6Xnhud6yvi9Bxh=DU+Q@mail.gmail.com>
 <CADYN=9L8tt2T-8O+u5NSMSUOkZDvEggnvzxH6aMmd5Rn9yDeuw@mail.gmail.com>
 <ca8d3fff-0365-24d9-fd53-5799ac34f336@opensource.wdc.com>
 <7ee4a1bd-0674-42d8-8980-8b029ca09e71@app.fastmail.com>
 <75eaeab3-7781-d60a-ae61-ae837f5dcec9@opensource.wdc.com>
 <CADYN=9JiX-=PcKMzAcSm=p7Dh6kYT7Kbv-8kcNF0MQ4=1hFS5g@mail.gmail.com>
Date: Fri, 14 Oct 2022 11:37:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Anders Roxell" <anders.roxell@linaro.org>,
 "Damien Le Moal" <damien.lemoal@opensource.wdc.com>
Cc: "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 "Serge Semin" <Sergey.Semin@baikalelectronics.ru>,
 "open list" <linux-kernel@vger.kernel.org>,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
 regressions@lists.linux.dev,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
 lkft-triage@lists.linaro.org, "Lukas Bulwahn" <lukas.bulwahn@gmail.com>,
 "Niklas Cassel" <niklas.cassel@wdc.com>
Subject: Re: TI: X15 the connected SSD is not detected on Linux next 20221006 tag
Content-Type: text/plain

On Fri, Oct 14, 2022, at 11:22 AM, Anders Roxell wrote:
> On Fri, 14 Oct 2022 at 09:53, Damien Le Moal

> Tested this patch on todays linux-next tag: next-20221014 without enabling
> CONFIG_AHCI_DWC and it worked as expected when booting [1].
> On the other hand I also tried a build/boot with CONFIG_AHCI_DWC enabled
> and it worked as expected to boot [2].

Ok, great. Can you a patch to soc@kernel.org to enable the driver in the
relevant defconfigs?

> However, during building a warning [3] popped up:
>
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/2/build ARCH=arm
> CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
> arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'
> /builds/linux/drivers/ata/ahci_dwc.c:462:34: warning: 'ahci_dwc_plat'
> defined but not used [-Wunused-variable]
>   462 | static struct ahci_dwc_plat_data ahci_dwc_plat = {

Strange, I can't reproduce this, and the ahci_dwc_plat symbol
looks like it is clearly used in ahci_dwc_of_match[], at least
in next-20221014. Do you also see this on mainline?

      Arnd
