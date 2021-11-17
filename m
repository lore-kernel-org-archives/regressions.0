Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2109F72
	for <regressions@lists.linux.dev>; Wed, 17 Nov 2021 12:49:17 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4HvN6F0MXyz4wyvY
	for <regressions@lists.linux.dev>; Wed, 17 Nov 2021 12:49:09 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="O8l2xGlD"
Date: Wed, 17 Nov 2021 12:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1637153332;
	bh=hKAEO8wqej3KZQNjrchrQxBV8gKMyvgjcZ5+i1Y8nTA=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=O8l2xGlDEwSDNbCu7+KxAu9dcztjHCCcPAAWzGzw+Mi5KwGYx/bsbAydrM3J0RE4E
	 3fMKWSeEow0hlCn8eoBwBv0K/9t89TzeFQB6XQ6e/rC6cYfisQDTk/Cxts/06k0Hfa
	 mRlTxOCwZPadWuYU5URhKGAQGJgJjAp7vcszIlcc=
To: regressions@leemhuis.info
From: Orlando Chamberlain <redecorating@protonmail.com>
Cc: danielwinkler@google.com, gargaditya08@live.com, gregkh@linuxfoundation.org, johan.hedberg@intel.com, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, marcel@holtmann.org, redecorating@protonmail.com, regressions@lists.linux.dev, sonnysasaka@chromium.org
Reply-To: Orlando Chamberlain <redecorating@protonmail.com>
Subject: Re: [PATCHv2] Bluetooth: quirk disabling LE Read Transmit Power
Message-ID: <20211117124717.12352-1-redecorating@protonmail.com>
In-Reply-To: <8919a36b-e485-500a-2722-529ffa0d2598@leemhuis.info>
References: <20211001083412.3078-1-redecorating@protonmail.com> <YYePw07y2DzEPSBR@kroah.com> <70a875d0-7162-d149-dbc1-c2f5e1a8e701@leemhuis.info> <20211116090128.17546-1-redecorating@protonmail.com> <e75bf933-9b93-89d2-d73f-f85af65093c8@leemhuis.info> <3B8E16FA-97BF-40E5-9149-BBC3E2A245FE@live.com> <YZSuWHB6YCtGclLs@kroah.com> <52DEDC31-EEB2-4F39-905F-D5E3F2BBD6C0@live.com> <8919a36b-e485-500a-2722-529ffa0d2598@leemhuis.info>
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

> So if this just affects two macs, why can't the fix be realized as a
> quirk that is only enabled on those two systems? Or are they impossible
> to detect clearly via DMI data or something like that?

I think we should be able to quirk based off the acpi _CID "apple-uart-blth=
"
or _HID "BCM2E7C". Marcel suggested quirking based of the acpi table here
https://lore.kernel.org/linux-bluetooth/1D2217A9-EA73-4D93-8D0B-5BC2718D478=
8@holtmann.org/

This would catch some unaffected Macs, but they don't support the LE Read
Transmit Power command anyway (the affected macs were released after it
was added to the Bluetooth spec, while the unaffected Macs were released
before it was added to the spec, and thus don't support it).

I'm not sure how to go about applying a quirk based off this, there are
quirks in drivers/bluetooth/hci_bcm.c (no_early_set_baudrate and
drive_rts_on_open), but they don't seem to be based off acpi ids.

It might be simpler to make it ignore the Unknown Command error, like
in this patch https://lore.kernel.org/linux-bluetooth/CABBYNZLjSfcG_KqTEbL6=
NOSvHhA5-b1t_S=3D3FQP4=3DGwW21kuzg@mail.gmail.com/
however that only applies on bluetooth-next and needed the status it
checks for to be -56, not 0x01.

--
Thanks,
Orlando

