Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EC43FCB
	for <regressions@lists.linux.dev>; Mon, 27 Sep 2021 04:22:23 +0000 (UTC)
Date: Mon, 27 Sep 2021 04:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1632716526;
	bh=0KQC3UH/Oil+fYCXtnSPv7zcDj9qxOzq5y5CNs7SIPw=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=a6+EivaBU0r1brTMGg+2pfMHxDa7GO9TS+5lvCTNM5L5g7Aglm2geqIjzK8UZN9Ho
	 Ptnp9UCUClZRZdCp2UgaT+1morD5xUggHVlrtI3B2PQvewq77zCpplKauHRBQNDEHi
	 lZYZmhBM/9wZRS4N8m29h3BWCepXuwI6vHpd47gc=
To: Sagi Grimberg <sagi@grimberg.me>, Aditya Garg <gargaditya08@live.com>, "kbusch@kernel.org" <kbusch@kernel.org>
From: Orlando Chamberlain <redecorating@protonmail.com>
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "hare@suse.de" <hare@suse.de>, "dwagner@suse.de" <dwagner@suse.de>, "hch@lst.de" <hch@lst.de>
Reply-To: Orlando Chamberlain <redecorating@protonmail.com>
Subject: Re: [REGRESSION] nvme: code command_id with a genctr for use-after-free validation crashes apple T2 SSD
Message-ID: <31c4dc69-5d10-cc6a-4295-e42bbc0993d0@protonmail.com>
In-Reply-To: <d65ecc69-35c9-4400-8fb0-95aa04360b03@grimberg.me>
References: <cjJiSFV77WM51ciS8EuBcdeBcv9T83PUB-Kw3yi8PuC_LwrrUUnQ3w5RC1PbKvSYE72KryXp3wOJhv4Ov_WWIe2gKWOOo5uwuUjbbFA8HDM=@protonmail.com> <20210925171618.GA116968@dhcp-10-100-145-180.wdc.com> <fa9de055-c3b8-20d3-41e0-12e43d0c336a@protonmail.com> <20210926020839.GA96176@C02WT3WMHTD6> <1a6f5030-27d9-d1ae-aff4-0ed2a10dce6b@protonmail.com> <1b5d6bef-db6f-073f-8d24-4963f0df82ab@protonmail.com> <PNZPR01MB4415801C6084E8CFD068A84AB8A69@PNZPR01MB4415.INDPRD01.PROD.OUTLOOK.COM> <d65ecc69-35c9-4400-8fb0-95aa04360b03@grimberg.me>
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

On 26/9/21 18:44, Sagi Grimberg wrote:
>=20
>> I checked out the proposal sent by Orlando Chamberlain to replace NVME_Q=
UIRK_SHARED_TAGS , by NVME_QUIRK_SHARED_TAGS | given in the patch on http:/=
/lists.infradead.org/pipermail/linux-nvme/2021-September/027665.html. The ,=
 still causes panics to the T2 as described before. In the case of |, the k=
ernel boots correctly without panicking the T2, but in case we are having L=
inux on an External Drive, which is my case, then the internal SSD doesn't =
seem to be recognised at all. I've tested the patch on 5.14.7.
>=20
> That sounds like a separate issue, because with this patch applied,
> all tags should be within the queue entry range (with generation
> set to 0 always).
>=20
> Is it possible that the io_queue_depth is being set to something
> that exceeds NVME_PCI_MAX_QUEUE_SIZE (4095) ? the default is 1024
>
I've been able to reproduce it by using the same kernel Aditya is using:
https://github.com/AdityaGarg8/T2-Big-Sur-Ubuntu-Kernel/actions/runs/127538=
3460

From the initramfs:

# dmesg | grep nvme
nvme nvme0: pci function 0000:04:00.0
nvme nvme0: 1/0/0 default/read/poll queues
nvme nvme0: Identify NS List failed (status=3D0xb)
nvme nvme0: LightNVM init failure

It might be because this is 5.14.7, while I've been using 5.15-rc2. Additio=
nally,
there are differences in kernel configs, I've put both configs in this gist
https://gist.github.com/Redecorating/c8cf574df969f9b4f626dfb9c6b2a758

