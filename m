Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch [185.70.41.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144F83FC8
	for <regressions@lists.linux.dev>; Sat, 25 Sep 2021 23:49:23 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4HH54Q06gsz4xV9Z
	for <regressions@lists.linux.dev>; Sat, 25 Sep 2021 23:40:37 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="n1l9yQ0l"
Date: Sat, 25 Sep 2021 23:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1632613221;
	bh=JU9d1XuEqHX+89EhnD/H5YuEA8AAXubY0+4+MTIBjPc=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=n1l9yQ0lLHwv+QJ7qbt9A6Jn4Dd9T5VC0d5XMr4IwsJlZDOrjzHBDscoHaylwJ+pn
	 TgP5f9zviZruN32KnCKyxaU3ca8VLov2ZJQNig8X2E5z1AOLPF+taf1FThiOVwV/5P
	 eMhPRCCUu6tjg39SGJKmWFpUYJWtAlqJHARDkYc8=
To: Keith Busch <kbusch@kernel.org>
From: Orlando Chamberlain <redecorating@protonmail.com>
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "gargaditya08@live.com" <gargaditya08@live.com>, "sagi@grimberg.me" <sagi@grimberg.me>, "hare@suse.de" <hare@suse.de>, "dwagner@suse.de" <dwagner@suse.de>, "hch@lst.de" <hch@lst.de>
Reply-To: Orlando Chamberlain <redecorating@protonmail.com>
Subject: Re: [REGRESSION] nvme: code command_id with a genctr for use-after-free validation crashes apple T2 SSD
Message-ID: <fa9de055-c3b8-20d3-41e0-12e43d0c336a@protonmail.com>
In-Reply-To: <20210925171618.GA116968@dhcp-10-100-145-180.wdc.com>
References: <cjJiSFV77WM51ciS8EuBcdeBcv9T83PUB-Kw3yi8PuC_LwrrUUnQ3w5RC1PbKvSYE72KryXp3wOJhv4Ov_WWIe2gKWOOo5uwuUjbbFA8HDM=@protonmail.com> <20210925171618.GA116968@dhcp-10-100-145-180.wdc.com>
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



On 26/9/21 03:16, Keith Busch wrote:
> On Sat, Sep 25, 2021 at 01:10:42PM +0000, Orlando Chamberlain wrote:
>> Commit e7006de6c238 causes the SSD controller on Apple T2 computers to c=
rash
>> and prevents linux from booting.
>>
>> This commit implemented a counter that is stored within the NVMe command=
_id,
>> however this counter makes the command_id higher than normal, causing a =
panic
>> on the T2 security chip that functions as the SSD controller, which then
>> causes the system to power off after a few seconds.
>=20
> Ah, yet another spec non-complainat quirk from these controllers.

Apple does like to think different.

>> This is the entry in lspci -nn for the ssd:
>>
>> 04:00.0 Mass storage controller [0180]: Apple Inc. ANS2 NVMe Controller =
[106b:2005] (rev 01)
>>
>> This commit was included in 5.14.6 and backported to 5.10.67, but does n=
ot
>> occur in 5.14.5 and 5.10.66. I am on a MacBookPro16,1, the crash has bee=
n
>> reproduced on a MacBookPro16,2 as well.
>=20
> Is the PCI VID:DID the same from in your lspci output for all affected
> macbooks?

Yes, they all have 106b:2005

>> I've tried to modify the genctr so that it is in the other side of the
>> command_id (which I thought might make the command_id's lower) with the =
patch
>> below, but it did not prevent the crash.
>=20
> That might mean the h/w is using the command id as an index into
> internal structures. That is not spec compliant, so it sounds like
> we'll need to introduce another quirk for the macs.
>=20

I've managed to get it to boot by commenting out the counter increment, whi=
ch might work
as a quirk:

--- a/drivers/nvme/host/core.c

+++ b/drivers/nvme/host/core.c

@@ -1027,7 +1027,7 @@ blk_status_t nvme_setup_cmd(struct nvme_ns *ns, struc=
t request *req)

                return BLK_STS_IOERR;

        }

=20

-       nvme_req(req)->genctr++;

+       //nvme_req(req)->genctr++;

        cmd->common.command_id =3D nvme_cid(req);

        trace_nvme_setup_cmd(req, cmd);

        return ret;

