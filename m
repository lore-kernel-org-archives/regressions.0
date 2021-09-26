Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E2E72
	for <regressions@lists.linux.dev>; Sun, 26 Sep 2021 03:53:44 +0000 (UTC)
Date: Sun, 26 Sep 2021 03:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1632628413;
	bh=lgQ+HcUsV9Ns5rQFl+hCQzoLxtfLbJpUS4i09cACHFo=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=fqEhLWsrcrRvikWgcSd9dSgVn5aBm4XXGdjx8jiotL+PrjYoYBAviZWZK7wetpcfZ
	 ef/xyPI1z7jkwez3tHeRTFkiZ19EfIea5l4BxI6Z4PJTrDQmKkD6Q3LnzHLIArhtKU
	 yjavt6zJRbz/kvwFbsPxa5PpKfEEDCXT2QiRIHnI=
To: Keith Busch <kbusch@kernel.org>
From: Orlando Chamberlain <redecorating@protonmail.com>
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "gargaditya08@live.com" <gargaditya08@live.com>, "sagi@grimberg.me" <sagi@grimberg.me>, "hare@suse.de" <hare@suse.de>, "dwagner@suse.de" <dwagner@suse.de>, "hch@lst.de" <hch@lst.de>
Reply-To: Orlando Chamberlain <redecorating@protonmail.com>
Subject: Re: [REGRESSION] nvme: code command_id with a genctr for use-after-free validation crashes apple T2 SSD
Message-ID: <1a6f5030-27d9-d1ae-aff4-0ed2a10dce6b@protonmail.com>
In-Reply-To: <20210926020839.GA96176@C02WT3WMHTD6>
References: <cjJiSFV77WM51ciS8EuBcdeBcv9T83PUB-Kw3yi8PuC_LwrrUUnQ3w5RC1PbKvSYE72KryXp3wOJhv4Ov_WWIe2gKWOOo5uwuUjbbFA8HDM=@protonmail.com> <20210925171618.GA116968@dhcp-10-100-145-180.wdc.com> <fa9de055-c3b8-20d3-41e0-12e43d0c336a@protonmail.com> <20210926020839.GA96176@C02WT3WMHTD6>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

On 26/9/21 12:08, Keith Busch wrote:
> On Sat, Sep 25, 2021 at 11:40:19PM +0000, Orlando Chamberlain wrote:
>> I've managed to get it to boot by commenting out the counter increment, =
which might work
>> as a quirk:
>=20
> Great, that's essentially what I proposed in a different thread (sorry, I=
 see
> now you were not copied there):
>=20
>   http://lists.infradead.org/pipermail/linux-nvme/2021-September/027665.h=
tml
>=20
> The final patch may look a bit different, but it should be okay to test w=
ith
> the one in the link.
>=20
I've tried that patch, it doesn't crash, but /dev/nvme0, /dev/nvme0n1 etc d=
on't show up so
it doesn't progress past the initramfs. There weren't any errors other than=
 preexisting
acpi table ones.

(I sent this a few minutes ago but I forgot to reply all so here it is agai=
n)

