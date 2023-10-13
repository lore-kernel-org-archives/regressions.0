Received: from mail.lichtvoll.de (luna.lichtvoll.de [194.150.191.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9549D613A
	for <regressions@lists.linux.dev>; Fri, 13 Oct 2023 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lichtvoll.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lichtvoll.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from 127.0.0.1 (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mail.lichtvoll.de (Postfix) with ESMTPSA id 2A6EF7DD41A;
	Fri, 13 Oct 2023 15:07:26 +0200 (CEST)
Authentication-Results: mail.lichtvoll.de;
	auth=pass smtp.auth=martin smtp.mailfrom=martin@lichtvoll.de
From: Martin Steigerwald <martin@lichtvoll.de>
To: linux-btrfs@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Tim Cuthbertson <ratcheer@gmail.com>
Subject: Re: Scrub of my nvme SSD has slowed by about 2/3
Date: Fri, 13 Oct 2023 15:07:25 +0200
Message-ID: <2727176.mvXUDI8C0e@lichtvoll.de>
In-Reply-To: <4f5fee23-2ccb-41a2-a64c-1675bc378ff5@gmx.com>
References:
 <CAAKzf7=yS9vnf5zNid1CyvN19wyAgPz5o9sJP0vBqN6LReqXVg@mail.gmail.com>
 <2169630.irdbgypaU6@lichtvoll.de>
 <4f5fee23-2ccb-41a2-a64c-1675bc378ff5@gmx.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello Qu, hello,

Qu Wenruo - 09.09.23, 00:03:38 CEST:
> > Scrubbing "/home" with 304.61GiB (interestingly both back then with
> > 6.4
> > and now with 6.5.2):
> > 
> > - 6.4: 966.84MiB/s
> > - 6.5.2:  748.02MiB/s
> > 
> > I expected an improvement.
> > 
> > Same Lenovo ThinkPad T14 AMD Gen 1 with AMD Ryzen 7 PRO 4750U, 32 GiB
> > RAM and 2TB Samsung 980 Pro NVME SSD as before.
> 
> The fixes didn't arrive until v6.6.

Thank you for making scrub fast again: /home with 1.88GiB/s ;) on 6.5.6.

Best,
-- 
Martin


