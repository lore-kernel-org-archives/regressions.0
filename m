Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED50972
	for <regressions@lists.linux.dev>; Tue, 16 Nov 2021 09:27:43 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4Htg7Z3nQWz4x4s8
	for <regressions@lists.linux.dev>; Tue, 16 Nov 2021 09:02:50 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="NLIE/UAi"
Date: Tue, 16 Nov 2021 09:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1637053352;
	bh=vaDlCooLwyOAJMCtPaLlgqGcNpUI/2Bmi8kEjru79aI=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=NLIE/UAiwyoWULaUOezUpHR+yQkswtXTxvMtcWRsxm936qpy8QLQWCivv+zCpWzcG
	 +H1VLtHLhovJx4+HTSHjBd8furXUa6lghL0MCCUx2vajUUKOJwSGkD4EACyRK37L56
	 nul5toTu83/qSW7VDWQvA/GAvm3WKO3QEuaTHW08=
To: regressions@leemhuis.info
From: Orlando Chamberlain <redecorating@protonmail.com>
Cc: danielwinkler@google.com, gargaditya08@live.com, gregkh@linuxfoundation.org, johan.hedberg@intel.com, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, marcel@holtmann.org, redecorating@protonmail.com, regressions@lists.linux.dev, sonnysasaka@chromium.org
Reply-To: Orlando Chamberlain <redecorating@protonmail.com>
Subject: Re: [PATCHv2] Bluetooth: quirk disabling LE Read Transmit Power
Message-ID: <20211116090128.17546-1-redecorating@protonmail.com>
In-Reply-To: <70a875d0-7162-d149-dbc1-c2f5e1a8e701@leemhuis.info>
References: <4970a940-211b-25d6-edab-21a815313954@protonmail.com> <275acce4-9eab-9cba-7145-5a75a69ca530@protonmail.com> <20211001083412.3078-1-redecorating@protonmail.com> <CABBYNZLjSfcG_KqTEbL6NOSvHhA5-b1t_S=3FQP4=GwW21kuzg@mail.gmail.com> <972034A8-4B22-4FEE-9B37-C0A7C7ADD60C@live.com> <YYZr14zwHnd52rQ7@kroah.com> <829A2DF8-818E-4AF1-84F9-49B5822F9146@live.com> <YYePw07y2DzEPSBR@kroah.com> <70a875d0-7162-d149-dbc1-c2f5e1a8e701@leemhuis.info>
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

> Bluetooth maintainers, what's the status here? The proposed patch is
> fixing a regression. It's not a recent one (it afaics was introduced in
> v5.11-rc1). Nevertheless it would be good to get this finally resolved.
> But this thread seems inactive for more than a week now. Or was progress
> made, but is only visible somewhere else?

I think the best solution is getting broadcom to update their firmware,
I've just sent them a message through a form on their website, I couldn't
seem to get it to tell me "Your message has been sent", so it's possible
that it didn't submit (more likely I've sent the same message several times=
).

If I hear back from them I'll send something here.

