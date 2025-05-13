Received: from sonic301-20.consmr.mail.gq1.yahoo.com (sonic301-20.consmr.mail.gq1.yahoo.com [98.137.64.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7038BE8
	for <regressions@lists.linux.dev>; Tue, 13 May 2025 05:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.64.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747112825; cv=none; b=ZVU/umScsy6Hd449EB7pV232ixOOzGp+QlEJeB3AT61TkI1dEKnVVWT4iyKkbSGfwECeI/zRl86s9zZjOHGhL37Y9AY08sXDrTMHpvzaHK81b7gTCuifxmQPMOOdkJQDyJdU8aD90pvz9KTL8mGyRA5wHgOb5SwwYig++lO2WcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747112825; c=relaxed/simple;
	bh=UTDc1wYpkWAfvifRTJF4VXiuszIW+r8dfq4jFbCbo4Q=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=HmpoWgIIxhodZEqacm4yz3pmEXcS4d8lOfuDuvcGZcKxsKSKnz1QZd+geYGvxzfA1zk2HkorHcEiXmRemBU1e1IWhFs8FLwgfubCRxE4UX2Q0Bh0zAihnRREzBzfl+5N4p/odk7YA2GHTcwaqCJP2uqlhfpeLhpXictiqIunsYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=lqjiGX3R; arc=none smtp.client-ip=98.137.64.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="lqjiGX3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747112823; bh=UTDc1wYpkWAfvifRTJF4VXiuszIW+r8dfq4jFbCbo4Q=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=lqjiGX3RwNZFdyygazrvIB60gbmq+d4Q3as5bsxuC5OxAqpstRn+2qAo56W8cCXAgz2bda7L8A4NuWgwtKr8mu5V2s6GIZrNLqDFZdi+oBWhAe4bNECNo+xNGC83IkCJL1fTG8ffFGxmA5jAAVF1sbEeLcjAo4BUqRvGQTMf6LytHucpFnbP6uK1878xDZCHTiMqPZetRD8vzATDH+kZ43PEAudV0ZnpXHSRlG+aHyT1ehovhCAOf7HstY+nuef/WM6/pS6nnnFn/B22uR1mLKFNbd2/C+SuyhTQ43cdykowu55/20FWEZ0NnEvmbuKT0drnUqI9XFwhWgy7aLL03A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747112823; bh=mIDfRoR8RowTnmrk2DCtc2gp+rfEPZC4RPmGqMAZV13=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=RUpR8uY/4H6dYUb73B9oUmEIrGWbK//W6xu8uGqaIuPVLyo4uPpPECEEPL1yB8JefxGf8O54AIhiA4Ni4NVk0a5bsXDuwt2U62mOUlZHyvxK0SonpUyNZVvcXMYDoH+IQBWxGr3fU5Uy32fJj5BFY0v2srmB6ocFbEf0Xf4atqsrOMA8q0BrO7iouY7lqrMQhpdUDFVn+HDJhP2t6MYIiqj8W0p4kL2V3J/2BY8gecgVRFfjhl+mPpvwwOduZ/0lRfL8GP50EHNJYNEVYg1TFCxpGdIILIc0hSwrfJm3eLI+ybECFwFPXOEeZfR1JAwtV/dh2o0kwGnqAvLYT6HmVg==
X-YMail-OSG: sgt22KUVM1mV_c3KD3Z9pM_fyklHybfS1nrMPuM_Epep_Sjthf4uwEg7QAAr.yQ
 7iSxxLanxR8doijrgyHsZnYEHkfMjJyfP1bkQ60c9km7rQXKbIHSo2ZCr6ABC2fa7upjeH2vtxRi
 WDZmp.etBz_JCh_sdaQzAhpfVsUOb01wHH3iyN5xxgCsQH9J5oU7kx9i9qRGNf3eCB5F7OO3Y7FC
 tJ.y5IBAna26cUsJRrftiE3Q51CllhMdFRzXPIF2uasswu4wna5v9jU7RekCAKMpzxKv7VeRGkVH
 DHnmsSaURxBWQnFgDxcZFuBhISrvh1LiSZ9U3S4R7vUH0M0HL85tRe1YU4juDCT1f6q604sU96ZN
 W2Xa.6MKrXQfkOzRsvxuS2o.kYcrjA92i25UkJdhUnByPm8qnVXAYpCZEcMYvUnR0JR0.VLKZcPZ
 U47FNUF1NNA_3dy6Yezo1ULXKWyzD0ckpIAKzPAmLgJ_LNUzC0GIsOzYGC91_rnXHv3uYTZohZGB
 XVttIsTIaISkHj4ynLwan4jiRpWnzEk8q1E7A8EIPfr884N1ZmlC4clcdtlBLx9f24LHRJUAPQhf
 IwA9OAI6VafabtfxMIoKfSoN0.TifTeSKUqDwReCH_oQbbaROXu2_wx8Ybx96KG1KICCOT9n89XW
 w4UkFsFRHHIQLlwi2fQfqvKVNwEfADmVrrGhj9hiA03o_A.rmc6fn0zV_hU7vOcRuQCJIQPBPdBb
 B5rXDr6bshlnMuGJ47LEeWY8Z5f7VCaDXugnnc3FMPu4lzKU.DLUg0J8hC1cWeyGJa9YF_qjooMn
 G3sT3j_H60rTV4c6k8oQHGSbFq0vdAYIVvJ4UWmx7I6Ej4Za8y3I_pqR3H1TFARCNPTD45ePnnMb
 zMiWDyUNtjBP10ADj2kzvJ22n.t30Q9r0QGH1SkIQpllvLS0IulL35Tr1jHSU.L7IZudCmNvqSIO
 vZaDAo_n.calG2IFv3.6cbAwDv73Ud1Q38DPMK7GgedlqQU8gOwbIjhQ8Vi5CeZHkENY0bpIUIKj
 gg7sB7Np3YENaFNVKvzELAFbTDqNtj.iKb_LVNjfqfNXRMFMDFvRagzt8yiHzVHrdAOdRmNzStaG
 Koz3liNWt9v5wMEzvGny_GlPBGU.jyW_IkXq1KqKFTo5lE6wrY7zKJVhv8FwYcGMvQocX857y9JU
 2i2p1vZJ_eCj1UHR2aKDSvgJt8NE8KFgnafwgP3TgZm.39ibwzLI3lTMrxNqu70HjOh13bjwKakr
 YkvwKAhBIElRh5_exzh26Y2LAhB5Z_Bz2puQ.CImT0ToyJZWy5D3_TLzrNvHcHsrI94y6xA..zlI
 j5.vPobQJYZ733.qhKMblLQGYJlHgKnbYWYBihbYxfgtH4EssCrJ6nWZOMGb_YoLMC.IVotY7hGu
 lfEfH6US5XQImGslLkVEfRNdNhSxipdlT63O86lZL9WcfO_V0Os43czqhtJqDvMmjNkiuoji011u
 _wxuD1_RMlS7iZTKehsxqZ3Cfdl.ROztzA7KM40AD73afX2x9GKw8JLI_PA9wHLfzxjAY2h1TSxr
 ni1V3tFz6znmskaQIjvMIUV2qDAygOzKBjTwgrxoEo8oaORS8QPJzTCzSOTFqSssX53qLgmtuaGN
 7Mwqqzxqhw9KOiGKw72t6ZH9rOIuuevAcfKTGqp8yCmfMjzAdAjLO5d12mGhboG0s51fCAWpNIyW
 JJ7laA1mFC52T7NrOmhsWtFQ02AJ1KCvHGoL8.w.5yf_3xI2qZjVKMVf_XD3dccL_PitVDuUBQAJ
 7f_WTbVf3rfKIfRbjya4rA49Fhtx3SBPzP45_WvItzwV8D_M8f_IHN.3cVKupSoq5DM0DgTniwjZ
 hFmOjvWho358C_C3jqcUQJ8L1G7PU7yG0kG0a.kYzpi50C_8brsDLoPjjAodSQ3b2oypEDXTyPQl
 eVsU.KFuilKutU0fzz0OdYxrwifuv1p7Rf0CjEepmEeanRx.jcHyrpD8Hor7zxd3yH0GnO31IBKS
 soQaEgE46y1Ke2q6zAz.M8HaL0acQDfIgIpULvwQ.LJTQ4.6xyI4vm3EMlWaozR7vZ7MmoQQkduY
 hLi7KMOdnRSdM2RUXgb1LLHYv6IgvVPDKlYKALuSaaT2jlPjn8EN04ZsrSCRtWnZ0mlScOICvh.A
 m9Uwptd0U1YpYcp9tyZ9T5zGRkV5GVzngmsnQlL0oqSgA71AuPuUE_jYqivtIkjUk8.l89zoi8aZ
 cfQsoP9dcHWpQ2Z0q5jTThuyh87R9O5cDOEk2mFsMLPUM0zCLjV_BQgq.bg--
X-Sonic-MF: <nruslan_devel@yahoo.com>
X-Sonic-ID: 6af3212a-1965-4ab4-8cb6-265fa604d21b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.gq1.yahoo.com with HTTP; Tue, 13 May 2025 05:07:03 +0000
Date: Tue, 13 May 2025 04:36:40 +0000 (UTC)
From: Ruslan Nikolaev <nruslan_devel@yahoo.com>
To: "kailang@realtek.com" <kailang@realtek.com>, 
	Takashi Iwai <tiwai@suse.de>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"tiwai@suse.com" <tiwai@suse.com>, 
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, 
	"sashal@kernel.org" <sashal@kernel.org>, 
	"perex@perex.cz" <perex@perex.cz>
Message-ID: <946767975.787038.1747111000631@mail.yahoo.com>
In-Reply-To: <87o6vxuauk.wl-tiwai@suse.de>
References: <1064773772.509063.1747061777318.ref@mail.yahoo.com> <1064773772.509063.1747061777318@mail.yahoo.com> <87o6vxuauk.wl-tiwai@suse.de>
Subject: Re: [Bug 220109] New: Audio disappears on HP 15-fc000 after warm
 boot again (ALC256 code path)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.23772 YMailNovation

Takashi and Kailang,

I did a few additional experiments. Here is what I found:

1. If I connect headphones and ALWAYS keep them connected, then sound does =
not disappear even after a warm reboot.

2. The moment I disconnect headphones and do a warm reboot, sound is not go=
ing to come back. At that point, connecting or disconnecting headphones, re=
booting is not going to change anything (i.e., recover the sound) until I f=
ully power off the computer.

3. After reverting the commit, the above problems disappear for speakers, a=
nd no additional issues with headphones are observed.

4. Whether I revert or do not revert the above-mentioned commit, the headph=
ones are sometime flaky if I already have an application running that uses =
sound. I have to close that application, disconnect and connect headphones =
again. Otherwise, the speaker does not get disconnected.
The headphones seem to be even more flaky when NOT reverting the above comm=
it - unless I booted the system with the headphones connected, the speaker =
will never get disconnected.

Sincerely,
Ruslan








On Monday, May 12, 2025 at 11:07:02 AM EDT, Takashi Iwai <tiwai@suse.de> wr=
ote:=20





On Mon, 12 May 2025 16:56:17 +0200,

Ruslan Nikolaev wrote:
>=20
> Hi,
>=20
> Forwarding my regression bug report for HP 15-fc000 / ALC236 (ALC256 code=
 path).
>=20
> #regzbot introduced: v6.12.2
> https://bugzilla.kernel.org/show_bug.cgi?id=3D220109
>=20
> Sincerely,
> Ruslan
>=20
> Forwarded Message (see logs in the bug report above):
>=20
> There was a similar bug in the past (Bug 217440), which was fixed for thi=
s laptop. (I believe the code path is for ALC256, see below.) The same issu=
e is occurring again as of kernel v.6.12.2. The symptoms are very similar -=
 initially audio works but after a warm reboot, the audio completely disapp=
ears until the computer is powered off (there is no audio output at all).
>=20
> The issue is caused by a different change now. By bisecting different ker=
nel versions, I found that reverting cc3d0b5dd989d3238d456f9fd385946379a9c1=
3d in patch_realtek.c ( see https://git.kernel.org/pub/scm/linux/kernel/git=
/stable/linux.git/commit/sound/pci/hda/patch_realtek.c?h=3Dv6.12.2&id=3D4ed=
7f16070a8475c088ff423b2eb11ba15eb89b6 ) restores the sound and it works fin=
e after the reboot.


It's the commit cc3d0b5dd989d3238d456f9fd385946379a9c13d
Author: Kailang Yang <kailang@realtek.com>
Date:=C2=A0 Thu Nov 14 15:21:09 2024 +0800

=C2=A0 =C2=A0 ALSA: hda/realtek: Update ALC256 depop procedure
=C2=A0 =C2=A0=20
=C2=A0 =C2=A0 Old procedure has a chance to meet Headphone no output.
=C2=A0 =C2=A0=20
=C2=A0 =C2=A0 Fixes: 4a219ef8f370 ("ALSA: hda/realtek - Add ALC256 HP depop=
 function")
=C2=A0 =C2=A0 Signed-off-by: Kailang Yang <kailang@realtek.com>
=C2=A0 =C2=A0 Link: https://lore.kernel.org/463c5f93715d4714967041a0a8cec28=
e@realtek.com
=C2=A0 =C2=A0 Signed-off-by: Takashi Iwai <tiwai@suse.de>

and it modified alc256_init() sequence.

Kailang, could you check this regression?


And, Ruslan, it's the case without the headphone, right?
Is the sound still lost when you connect the headphone and apply the
same procedure?


thanks,

Takashi
