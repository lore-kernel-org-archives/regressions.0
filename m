Received: from mail-4324.protonmail.ch (mail-4324.protonmail.ch [185.70.43.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FAA3FCB
	for <regressions@lists.linux.dev>; Sun, 26 Sep 2021 04:35:40 +0000 (UTC)
Date: Sun, 26 Sep 2021 04:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1632630937;
	bh=uyKFsLwtoH4+xjiAgqs5q5lalDBftqKXjyAvkyXZCQQ=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=D6D8wc0U8g/2laBhqWc22Jb32Cuv+ecXUkAP5Qm2gOGLJJ99OBPG8w0jSF8RfymZ4
	 b88cNI5GOstqy1VoN+HGBMgJnyKZUa8CCMtPErfG9KS6EETcB60cK4ngdCrAAT9QkY
	 6e0Kli2mR+Q++4EgREdU0VZ3KKwm8tQzs+9KrXAY=
To: Keith Busch <kbusch@kernel.org>
From: Orlando Chamberlain <redecorating@protonmail.com>
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "gargaditya08@live.com" <gargaditya08@live.com>, "sagi@grimberg.me" <sagi@grimberg.me>, "hare@suse.de" <hare@suse.de>, "dwagner@suse.de" <dwagner@suse.de>, "hch@lst.de" <hch@lst.de>
Reply-To: Orlando Chamberlain <redecorating@protonmail.com>
Subject: Re: [REGRESSION] nvme: code command_id with a genctr for use-after-free validation crashes apple T2 SSD
Message-ID: <1b5d6bef-db6f-073f-8d24-4963f0df82ab@protonmail.com>
In-Reply-To: <1a6f5030-27d9-d1ae-aff4-0ed2a10dce6b@protonmail.com>
References: <cjJiSFV77WM51ciS8EuBcdeBcv9T83PUB-Kw3yi8PuC_LwrrUUnQ3w5RC1PbKvSYE72KryXp3wOJhv4Ov_WWIe2gKWOOo5uwuUjbbFA8HDM=@protonmail.com> <20210925171618.GA116968@dhcp-10-100-145-180.wdc.com> <fa9de055-c3b8-20d3-41e0-12e43d0c336a@protonmail.com> <20210926020839.GA96176@C02WT3WMHTD6> <1a6f5030-27d9-d1ae-aff4-0ed2a10dce6b@protonmail.com>
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

On 26/9/21 13:53, Orlando Chamberlain wrote:
>> Great, that's essentially what I proposed in a different thread (sorry, =
I see
>> now you were not copied there):
>>
>>   http://lists.infradead.org/pipermail/linux-nvme/2021-September/027665.=
html
>>
>> The final patch may look a bit different, but it should be okay to test =
with
>> the one in the link.
>>
> I've tried that patch, it doesn't crash, but /dev/nvme0, /dev/nvme0n1 etc=
 don't show up so
> it doesn't progress past the initramfs. There weren't any errors other th=
an preexisting
> acpi table ones.
>=20

The issue was that there's a , instead of a | at the end of the second line=
 here. It works when that is replaced with a |.

-=09=09=09=09NVME_QUIRK_SHARED_TAGS },
+=09=09=09=09NVME_QUIRK_SHARED_TAGS ,
+=09=09=09=09NVME_QUIRK_SKIP_CID_GEN },

