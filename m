Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CBA334C2C
	for <regressions@lists.linux.dev>; Wed, 18 Feb 2026 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447438; cv=none; b=TJ4d8XVl35g6hCa0ReiM+45jollIF6+oBZJhwTeIA8UZ8d+Zya0eUwM6i710znazN92IwODwDCwZB5dRcfFKcqtAXQMBJ/hn0dmi4w46vcAHv/hNdGXztJhK7pL6cuDZqqPGZf5nD8+s1j5L2lrAMFGE3gdQS0sCFW8n0mZ+fN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447438; c=relaxed/simple;
	bh=1afskavYau0tl+Bj5qe1Nzh8LAXyKnFoV2P5EHw4w5c=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UfTPMkZCL21Bw5SdonDgoJR5GW+OoB/7MQivao92Q0AKrfVEbp3He7Z6Y6Z5VU/z7mFeda0d24nHz3Fv2B1GBcD9IgNo8HtbpuuAetyVjdhyZK+jsFnbrfsX8BL0/Q9xXcdIr8NRfEfb23gP2wdRaAOOFXlaQR18kV7uGl0MugU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=online.de; spf=pass smtp.mailfrom=online.de; dkim=pass (2048-bit key) header.d=online.de header.i=dubito@online.de header.b=dsFiMleF; arc=none smtp.client-ip=217.72.192.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=online.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=online.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=online.de header.i=dubito@online.de header.b="dsFiMleF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=online.de;
	s=s42582890; t=1771447403; x=1772052203; i=dubito@online.de;
	bh=1afskavYau0tl+Bj5qe1Nzh8LAXyKnFoV2P5EHw4w5c=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:Reply-To:To:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=dsFiMleFXeEXQFg0w6XZfHpl38d8y3hl/NW0U/MH4rM0E4H9NVzSbG1rKo+FP9Ed
	 XcdqB1rhwvg6umAFKaNEgLaUNtiV/T5v7mgsAVVVkYzaN1pnGwHB3u+9hMO48PdoG
	 br+2asBQwkEq+etty3lu0XL4juNq+zSdYiJmeJq1Dpl/krqxqEmE4fuVZedvyH5J6
	 xND01F1EQo6KowY+4uPR8f8HiznXKv2iq9Jpi+usA5zCMglshr5CvUfc4ArTlvYdJ
	 8vpamKSryLhAm3nmABGM08OC7XXtyysXh9w8QtKV58vdbVjmXUlUsBFAMDuRoQbVW
	 WOvuAj8CpVY09M3MPg==
X-UI-Sender-Class: 6003b46c-3fee-4677-9b8b-2b628d989298
Received: from [192.168.0.208] ([91.66.193.45]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MKbXu-1wBaEB0VS8-00KRXO; Wed, 18 Feb 2026 21:43:23 +0100
Message-ID: <a3c3964e9e13c82d944fa1ee0acbb1a7806dd382.camel@online.de>
Subject: Re: [REGRESSION] HDMI monitor not working on Radxa Rock 5B after
 phy rockchip samsung hdptx HDMI 2.1 FRL patchset
From: 1und1 <dubito@online.de>
Reply-To: dubito@online.de
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Vinod Koul	
 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Heiko
 Stuebner	 <heiko@sntech.de>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Date: Wed, 18 Feb 2026 21:43:18 +0100
In-Reply-To: <03b5f3d1-6db4-4835-b2a5-c22c1aa63825@collabora.com>
References: <b32164001947ba922aefb6ca86a8dc59e9323d2b.camel@online.de>
	 <8e410a11-bd7b-4a12-a711-0514a59409c0@collabora.com>
	 <1859c940219a4dbfdf0497afbf333e627ab0ba25.camel@online.de>
	 <98e46dbb-c8e2-451f-accb-ea48f63f9408@collabora.com>
	 <4544ec4ccfa49cbdffee098878df7806223935a0.camel@online.de>
	 <08369c90-fbab-477d-9ac6-388deddfd3b1@collabora.com>
	 <26e31b3b-484f-433b-833f-c639ee437f63@collabora.com>
	 <03b5f3d1-6db4-4835-b2a5-c22c1aa63825@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Provags-ID: V03:K1:JMj2ed6H9IIYLIPXvd8SrffsvicDqBIhjEAHIteAk7Dz2GW8xam
 MHD2A8GOYDQtPVrUmFk7balTR4AdJsrIprV0SdPAfAqb86kqagLOcE4YEyGf63xJzfjENSN
 WM7iG2kgah0GtfhLMOffxdkA0/6hIzVWt0HjUYCKLc9iuX5AItt58A/yk/j/i6b1ekL/VHZ
 knELWnr9Bs36cWMQEgDkQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZIft8d4dnN8=;LoNduLw4rESE8Sqte/WndwUtxC1
 e+x6oQDHiwn85JeF9Qi/pDvviEg4nZWVouiVZ0oDYIXX9Ze2E9RHDulJf4+xWApogA13z0BL3
 FGjRuB05rZpZThu4bzFYlWl1eznAVX/FdiA2AHYosRZzkJZCSKJ+xgDAlpJ6HAx1jF0iVzN+t
 oXhii1jolnqROUJcvvrNWeZX6KQgGYsp/Lf4+o2Wwh2eXa+T4CzY+vwDTIG9U4Rx0jAUbPWlQ
 A8aSt8FG46yZIOjQg8wIJYtpYdF/uAPO/9u4gA2kSAZ/n7s37xxjQ8BSI8U6tKQzhQB3aGdLw
 9V5i3lT9PO2F4BgRKbAha9O0H8e+31BXIz/oDAzSPTNofC77SaIb0CkrQFa43FWTtcp9Fo03G
 mxLpjI4eA+PgmNHRhZhCXimZQEVRhFlEUxkWanUAbtE2d7+HrHntDMCz4kmGxRBT5vA4hs6lO
 jvliKangOLTSQl2/igvvpPG1cdCWty80P+Y7x0mt9767oYWKGvtzJ6VttkXaik8Tr5uncyF73
 T7wEv6mU5AHIRBRDn/hR0/J8E/uUrN6a1UltyN6rd+CcMYPsZMI7vSt0tAj8+HU0d5pUq3+El
 lyRdMDZiFR9k+aTJ/2BDGTXrhX4ZgEBEaMYrY1W+3Z0LLJGCPXfewN2mM4V6jvXA0UsvcG6SD
 tSY/NI/rvxAC4IEVpVcgReJjHoWkK96oxQw769tQGdEW0JFPoeNtgHwtG5W5QMSV04hNdK/Y6
 99KLnEa4TZBaIGFUkLfP60iWHrMTWkkfkk7FIuq9lDlWdlaWgHOojkS+KU3MtTCGpVuaCpmJ4
 pHGjediehHO0bhcbGKPUCB9iVJaq4wgzeK6lvg1TzSRLSCH8GgpoSQOZZkka+JjX6d+n5W/11
 YagakHkWnypgSGOqXjD4MSJlrGrXWeZq8CyRQ/ckqsp8ozuOhcFT+D0eZ4t6PTaijIg2vzsUt
 HzqJMIQvCxbilzsK5Zft8+5QiiXtsdriu8+/tAOScZUQPpkF/WFeYJUVSnGEQ7KxPlgSM8d7B
 1rTJvqVZYhFe2e29MpfC1u9nNXZ3etA/3HOoUskfnoWlxey3El1ANyinv31egxvUA8CrKHAeu
 U1kpMtzmrXLFBA+kA65TBzot6pfkg6cy/eallzbEJzATh7ko2hTLJbHjLMpQtGSMeTehRhiUz
 NOibW97dWZq/b4XdrrO1mcksmQuIByrA3rYJKXtMlDmzE2IZ0EzU+oa6cgQVDDCvENbRrxZ6q
 uIWUxn5a2VmRKJcljZ3uYOg6msGtkpLgXkOiRq6dniPX0Ntqx+yb+HCsln2+qH4bR+onjmwQy
 WnIcjVEn6Or0lUogHgsLTEFMGSvGqLcJBTRteJq58NkRQSqf4P+MrzPBmmCTNPQB+zCzbp+FF
 5fIknEkuAM7/k/KjM1gKegVzaVHEyqecxwyok5acNKQdVrOnC+i7h5jWKX7iN7NGLbwYpEMQn
 3qDG+qKBWgkf/rcPdg+C04imV0KkpijphU+fvobNZRffI/XK0QYn+R0ddqCAIM6gqqr5TEBVw
 IpmONM25REfkWX5jSNDFKOYC/9peCvKosmQ+md44Ex6npxUsFVLhwAt6oeqBWnHmfS0S/tOjk
 oH7ak3tlQnjZZRaqCKoGkrP75r6RKdFFV/4Ds6BnizGjvjQuw5Yxc+EV+d53NsXn7Fnts7Utv
 qXU1/BXeEt5qra2Lsef8WLfZKpb7OcRfYkAHqM7ajQpjVagin9xMJZO69IkRWCvLmjFTSb1oD
 BHFasaRvAf+cbQsJlySOovyYjEyNsyjdwTdffFsjnAQHK5bbnUpfDJIo21lN3KL+MAMSBWRwm
 BUBF

Hi Cristian,


Am Mittwoch, dem 18.02.2026 um 22:15 +0200 schrieb Cristian Ciocaltea:
> On 2/18/26 3:22 AM, Cristian Ciocaltea wrote:
> > On 2/18/26 2:52 AM, Cristian Ciocaltea wrote:
> > > Hi Thomas,
> > [...]
> >=20
> > >=20
> > > Sorry, I somehow missed the following warning message, though it has =
been
> > > already present in all the logs you've sent to me so far:
> > >=20
> > > =C2=A0 rockchip-hdptx-phy fed60000.phy: PLL locked by unknown consume=
r!
> > >=20
> > > That indicates the PHY has been preconfigured by an external componen=
t
> > > (e.g. the
> > > bootloader), which is actually a scenario that I didn't verify.
> > >=20
> > > However, this just another way to expose a limitation of the current
> > > approach
> > > for managing the TMDS character rate: done via the Common Clock Frame=
work
> > > API
> > > instead of the HDMI PHY configuration API.
> > >=20
> > > As a matter of fact, it was actually an item on my TODOs list for qui=
te a
> > > while,
> > > but blocked until recently due to several dependencies waiting to be
> > > merged
> > > upstream.
> > >=20
> > > Hence I took the opportunity to finalize this task - please give the
> > > following
> > > commits in my rk3588-hdmi-debug branch [2] a try:
> >=20
> > I've just realized I introduced a regression while doing some cleanup w=
ork,
> > hence
> > please ignore this until further notice.
>=20
> I think I got this working properly now, at least it passes all the tests=
 I
> could run.=C2=A0 The updated commits in [2] are:
>=20
> =C2=A0 fa7cd1e75aaa ("phy: rockchip: samsung-hdptx: Fix rate recalculatio=
n for high
> bpc")
> =C2=A0 8048db5544da ("phy: rockchip: samsung-hdptx: Exclusively use PHY c=
onfig API
> for PLL changes")
> =C2=A0 0085a382dfd0 ("[DEBUG] drm/rockchip: Add HDMI verbose logging")
>=20

applying these commits solves my problems. I tested 1920x1080@60, 1920x1080=
@50
and 1920x1080@30. All work now. Thanks for the quick fix! And the positive =
side
effect seems to be that you can now take one of your old todos from your li=
st.

Best regards,

Thomas
