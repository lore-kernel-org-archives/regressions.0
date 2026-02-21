Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C46F3EBF31
	for <regressions@lists.linux.dev>; Sat, 21 Feb 2026 15:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771686375; cv=none; b=a3aMw0nw+Ulv0rXcO4InUfsCNzr7XpGGC//u+T9X2GF00WcFoYOo/CRESgGv5kuHxBXqLOAo8han+VF9VzXarY5rUCKoH3jTiYRKXFAXNYUhBI1sA4gQsdATVER4mEt8kDFLSQnsADGguE9+ci1dIzM1lllvFE42sxc6mypE8wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771686375; c=relaxed/simple;
	bh=l8qR+hrpB4PvPYq3Ypso3qPSLmB4Te3SmIhkNNMiHXk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fcGcW87JBG1InDbQ046rqbGdH6BzhFKZSsxsF0z+n1XCkpvkHoEtE7zGO8WKEApufE3mOol9dB3CRU7RZe6Z4Q8W1DCs2XdgMEgDY9bdpcHYLKZDgjlgO8xQfS6+NSJgDd/QUlKNsVjaU3e7tmlEIZNgATwSgFZxpRECdeoefkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=online.de; spf=pass smtp.mailfrom=online.de; dkim=pass (2048-bit key) header.d=online.de header.i=dubito@online.de header.b=jEp6QxvW; arc=none smtp.client-ip=217.72.192.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=online.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=online.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=online.de header.i=dubito@online.de header.b="jEp6QxvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=online.de;
	s=s42582890; t=1771686343; x=1772291143; i=dubito@online.de;
	bh=l8qR+hrpB4PvPYq3Ypso3qPSLmB4Te3SmIhkNNMiHXk=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:Reply-To:To:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=jEp6QxvWChMG6Ud89DVe0Lx4KB9wzmgMyscvp2RWh6KMjHwX4/pX1cf0MyK7/V1H
	 CbCtl7bvhPEigK45gEySQegtbg8w3TPkgaBtjmuaLScnJ2jiXea/zlSWF+kcwstub
	 Hmg8Gymr0tOCLkbHqJqAeNZdS9iSSf6hK1i+xkUebUVFhUlE99gwsNwd1hYVooLgi
	 BuypNYtXhAU7K/6jbgw3IuQ1RxtA2h6L5TQUv6D0/hUZ6vsPaHyDjTGcuwDTuOjRW
	 MkCbY94NDW79UgpITozboN9VpDDCY31R1rf7jL+fYpOhyHLH9jqddrQHhIYLBsHiu
	 EIBsHrGXuGLdUDnHdA==
X-UI-Sender-Class: 6003b46c-3fee-4677-9b8b-2b628d989298
Received: from [192.168.0.209] ([91.66.193.45]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MacWq-1vIp2b3CA6-00cf5E; Sat, 21 Feb 2026 16:05:43 +0100
Message-ID: <e18fce6a3216427d26bd10ebd837e9152c0c8b60.camel@online.de>
Subject: Re: [REGRESSION] HDMI monitor not working on Radxa Rock 5B after
 phy rockchip samsung hdptx HDMI 2.1 FRL patchset
From: Thomas =?ISO-8859-1?Q?Niederpr=FCm?= <dubito@online.de>
Reply-To: dubito@online.de
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Vinod Koul	
 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Heiko
 Stuebner	 <heiko@sntech.de>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Date: Sat, 21 Feb 2026 16:05:42 +0100
In-Reply-To: <a662745a-1b2a-47b3-a66d-7c1c5c8af525@collabora.com>
References: <b32164001947ba922aefb6ca86a8dc59e9323d2b.camel@online.de>
	 <8e410a11-bd7b-4a12-a711-0514a59409c0@collabora.com>
	 <1859c940219a4dbfdf0497afbf333e627ab0ba25.camel@online.de>
	 <98e46dbb-c8e2-451f-accb-ea48f63f9408@collabora.com>
	 <4544ec4ccfa49cbdffee098878df7806223935a0.camel@online.de>
	 <08369c90-fbab-477d-9ac6-388deddfd3b1@collabora.com>
	 <26e31b3b-484f-433b-833f-c639ee437f63@collabora.com>
	 <03b5f3d1-6db4-4835-b2a5-c22c1aa63825@collabora.com>
	 <a3c3964e9e13c82d944fa1ee0acbb1a7806dd382.camel@online.de>
	 <a662745a-1b2a-47b3-a66d-7c1c5c8af525@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Provags-ID: V03:K1:A6DOSPbkG2a8W4AayFyZ/jjeSuVWCTyazX1+j+t31ZRKWxK/Pnc
 jLMRbuZsxFP7h8H8PF9hN8AVg7yCgLue0dTFe0hgTC4trdPFQ3MODOKKMZL3ebiQggmISvz
 hFNAR1T8gWd+byqq4g//CIgMDld7Xp0bNA+UFbCaVVMKh3I2iMKjtAiBlfI+lLYpQbKjE1K
 NBXvLCM6oJ/at7jC+v/uQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:J+JveUSkW8c=;Fm+X29IM1PZd1HVmkootEQNq8v5
 muHpXDJtmk4rr6WAr+yyr9f0j/zB4r3EW5upJeqF0mL0Y94RUPIwk5RbfXHeHfKRPIJC677Ta
 OjqvArzHWsR4aMrah5R/k95Z3mKB/JKp6pGkcu2LEFPvlkuQ5Qb5xJ4UZnXCkroe7pBddEnwP
 dCjnQeHPIX5CNrOUokkcctvWJo7iOoToNlCMs9hDiOpR11Y8HAouRyxiOyfbxjb1/x9W607/z
 byx8GRO/ByWOwkGnRIJxQ3vXXWtslf1SA3l1bRfLPN6D2Fvrrr1RvCljX94CeriCLyI0f2Fho
 hls5rLYmgY4DhLKdRMuZrk/fQEVpwwtoJiFk6M6nfTMGVABiRF/BVUD755vh6HNAfssPilHkW
 FiDLwp3dYIsjkhouIC1YSjdsp8aEoMgSWqVkY6ryDT5VB5OV0CFpi2AwT8A8yjnhs3U9uyyf8
 HnhNJZtzu9L4FtDKzGFnhUuBQqTUA9TS50Vi7mFex2hfep4zZ21zzr6hdlambw9nWOMmpj7+R
 cBobrK/FyiY7BBT2JMhABNDViHBxxbs6fR7tPV/YbO6U2efpIz6Q9UE+3lKimI0hh46+LoBct
 Aibf35j6/fUVwYrpPFjDnTajC2piOkkw/25ZRUQS93ed9B4ILzbw2rET3zNj6/3Sz9bNKA05k
 Bfow53WDJ7Mx9S98sgRU1hB4DqiVW+8Wk1bVul7KIQ1kz9WOCeD3Q8WWxMNHUJ4HoWSNBE/ya
 O3moInk05QwWdwpBUvXmIDPcqDbcs3gukIMMy7KATZFA2H6WsHUSoxxlWyHVqvl8GfnjUsHLH
 fCBEUmkNSFCjM30lJDfJM8Zer+plRkr8woxdwN5XFWe7UiTvWKyrijvMdwHr4BXQNQCLwpTJw
 e/JGsa4tZt6MSfTIFcib/Lz2/Pmclv2Clwhowj2Yggz4VDBa/JEa8HaAEVqySrNLqH7x0sTVC
 Jh5E6RrSi/oK7Af6mW4ZVdGf3wLIj0X2hroLPiypiQPvC2vPeCkQKFX824Nfbe1CJoYrxfFs7
 DOGz7NMesHagDdMe4gLBVFZnH5MbfEXmXFgMgvVxlTv3e7zHOpZRgkbSpnE5dhbyWPbm9dPXT
 aDjC9aaIIu1SiWl52nNFwPO/AFabpkwBKLlBdstjy+nKQEZu6GPRwtyCqHDvxB3VxAC2iiT4E
 vZsqBa4Lz78P59NoQm1uTqNk4EpRJ3g4tDVZftz12Zztj6oqx7mxN8KrSJlD6hMUHfyqvv9Do
 OaTTupZtx8LRbrluJVkTDdkRC3Rpj15if5A8cJgf6j/sbWhZPhFPwZGU4su2uPHTZoagKdxzj
 hnJwiu1Sesl5itpZ00vjd5hw/0f9NzQ3+2GXBBpy7qGPKyAt6KYUPFifUQR/XjGngBUtx9a2x
 ccSGfhUQKj6Yp20NGa/oWqRWvCDiP2cmuAS9KTsahXz42/d25kaadKXk4IBB0e7Y2izzc4yuL
 7sJ92E9xYGXpX9/3yjT7Em9qbmssyE1aqSz5nhu6N5qbTJdTY4BSudrozpg40KC7Zo0r/xICc
 RC0wFX2fyUoM5F22LGwxnu3DDgPGz00VdDciVNe8/xEoruYBv8FoMCkgXJr2jrz+0ttxVvNS0
 jZldS7DfsEi4wKAi9sRowMIG4HAs+1kRiofZ7Vc8V64dllBwMsaFTyRSy0xcE0H13EGJctOXV
 39NiBSaVQxEhyPhm991O8fMbkJQpy/OhamZnYll6DDyYRgOOqZe2FPTD/aCCbHQ4aM0pyGBrO
 IW/1iOEwwCf5PpLh7AVUjOsQZ5C/Kkrm3nx2kBnQUD41GTArtraTt/kuzGawM4h/kQdz86PLz
 e2wh

Hi Cristian,

Am Mittwoch, dem 18.02.2026 um 22:56 +0200 schrieb Cristian Ciocaltea:
> Hi Thomas,
>=20
> On 2/18/26 10:43 PM, 1und1 wrote:
> > Hi Cristian,
> >=20
> >=20
> > Am Mittwoch, dem 18.02.2026 um 22:15 +0200 schrieb Cristian Ciocaltea:
> > > On 2/18/26 3:22 AM, Cristian Ciocaltea wrote:
> > > > On 2/18/26 2:52 AM, Cristian Ciocaltea wrote:
> > > > > Hi Thomas,
> > > > [...]
> > > >=20
> > > > >=20
> > > > > Sorry, I somehow missed the following warning message, though it =
has
> > > > > been
> > > > > already present in all the logs you've sent to me so far:
> > > > >=20
> > > > > =C2=A0 rockchip-hdptx-phy fed60000.phy: PLL locked by unknown con=
sumer!
> > > > >=20
> > > > > That indicates the PHY has been preconfigured by an external comp=
onent
> > > > > (e.g. the
> > > > > bootloader), which is actually a scenario that I didn't verify.
> > > > >=20
> > > > > However, this just another way to expose a limitation of the curr=
ent
> > > > > approach
> > > > > for managing the TMDS character rate: done via the Common Clock
> > > > > Framework
> > > > > API
> > > > > instead of the HDMI PHY configuration API.
> > > > >=20
> > > > > As a matter of fact, it was actually an item on my TODOs list for
> > > > > quite a
> > > > > while,
> > > > > but blocked until recently due to several dependencies waiting to=
 be
> > > > > merged
> > > > > upstream.
> > > > >=20
> > > > > Hence I took the opportunity to finalize this task - please give =
the
> > > > > following
> > > > > commits in my rk3588-hdmi-debug branch [2] a try:
> > > >=20
> > > > I've just realized I introduced a regression while doing some clean=
up
> > > > work,
> > > > hence
> > > > please ignore this until further notice.
> > >=20
> > > I think I got this working properly now, at least it passes all the t=
ests
> > > I
> > > could run.=C2=A0 The updated commits in [2] are:
> > >=20
> > > =C2=A0 fa7cd1e75aaa ("phy: rockchip: samsung-hdptx: Fix rate recalcul=
ation for
> > > high
> > > bpc")
> > > =C2=A0 8048db5544da ("phy: rockchip: samsung-hdptx: Exclusively use P=
HY config
> > > API
> > > for PLL changes")
> > > =C2=A0 0085a382dfd0 ("[DEBUG] drm/rockchip: Add HDMI verbose logging"=
)
> > >=20
> >=20
> > applying these commits solves my problems. I tested 1920x1080@60,
> > 1920x1080@50
> > and 1920x1080@30. All work now. Thanks for the quick fix!=20
>=20
> Thanks for the quick test!
>=20
> I can add you to cc: when I submit the series, so that you may provide yo=
ur
> Tested-by tag if you'd like to.

sure, I would be happy to.

>=20
> > And the positive side> effect seems to be that you can now take one of =
your
> > old todos from your list.
>=20
> Indeed. :-)
>=20
> Regards,
> Cristian

Best regards,

Thomas
