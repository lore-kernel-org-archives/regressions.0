Received: from mail.sonarnerd.net (rankki.sonarnerd.net [213.186.235.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68BE2F3C19
	for <regressions@lists.linux.dev>; Wed,  8 Jul 2026 22:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.186.235.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550069; cv=none; b=XyG1ZFV36ukCcbxWvvZptlpYDekbCYEFEPzVdZiJTskp7PByxddtqFpe5//DT9BPQmHA6Kap2lxY/7wCks3jcVNXkYPwvvKMDrI8xly6Oopv3XQzAqX+l0cM0neGCW/E3avS3Lop99rJ99kxdT/3SFlLQrzawPt1RkAVU0m2L0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550069; c=relaxed/simple;
	bh=lJCMvKbuwbG0zzJV14C1oceEEjy0QBMc3S2SWO7tPa0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=daamsYrjh/P7Yd+z9stm6NqlEXEVzzEh+6lxPoe+sQ/eT+BWkAX8rwUy7Ky9BrwCMQfWX+bopFLUYzHAj/mrsyUfdxptfKa/YJx2hjHBiBEyXizN3tgNk4ckV1nL1P0Qu7Kf6yPKedhEvaK0dQ3nfRE5kwGCSV0pxaqkO5A37UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sonarnerd.net; spf=pass smtp.mailfrom=sonarnerd.net; dkim=pass (2048-bit key) header.d=sonarnerd.net header.i=@sonarnerd.net header.b=8YsOFpDo; arc=none smtp.client-ip=213.186.235.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sonarnerd.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sonarnerd.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sonarnerd.net header.i=@sonarnerd.net header.b="8YsOFpDo"
Received: from smtpclient.apple (unknown [213.186.235.123])
	by mail.sonarnerd.net (Postfix) with ESMTPSA id A8C2C231138;
	Thu, 09 Jul 2026 01:28:10 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.sonarnerd.net A8C2C231138
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonarnerd.net;
	s=dkim; t=1783549690;
	bh=FqjxE4xFrVtuCRKim3xbqoI/9Sz1SAg0SWh0CexH1C4=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=8YsOFpDoYrgEYhAfU6WAJ3Ts8RZIl4N9IUH+rG41r6IcEazN0IEs7OMAW5TJFLfSm
	 M5yD/xMBDV9Pp+I8Gwhl6QOXCK7du0F35n1F04lnbPY4COdEXCv+/dwgI48PIwUrHF
	 /9InkhGkb/QnPs4jPNwCJ/AnJOyO4/5yF//dz9At23sDqaqfAvQ1VQsS3EI/nK3Bj7
	 YVaaCSHtub/3nuCgqsaIv4hKEbAMr8UZzAQQYCmfeUap+xIN8moWOyQLMKg9FoGPJH
	 B012r77BMC5FNIjigePa6hPSW8g7r5Fq1V4omZm9MzO+GmBq8+wiGqAPNhn3HqTfes
	 mrP2YqJn9LJVQ==
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [REGRESSION] snd-usb-audio: commit da3a7efff64e ("ALSA:
 usb-audio: Update for native DSD support quirks") breaks DSD playback on
 Musical Fidelity M6s DAC (2772:0502), plays ~8.8% fast
From: Jussi Laako <jussi@sonarnerd.net>
In-Reply-To: <CAOdyq+qFaqCh=tK_wNnA64hv5pQuA1Y09ANxQ=xK8yR-t4mf9Q@mail.gmail.com>
Date: Thu, 9 Jul 2026 01:28:00 +0300
Cc: alsa-devel@alsa-project.org,
 tiwai@suse.de,
 regressions@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <4A4C8B42-D8BB-44D1-BE0B-CB5B4617F29E@sonarnerd.net>
References: <CAOdyq+qFaqCh=tK_wNnA64hv5pQuA1Y09ANxQ=xK8yR-t4mf9Q@mail.gmail.com>
To: Salvador Blaya <tiniebla6@gmail.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)

Hi,

I don=E2=80=99t think we currently have exclusion method for devices =
with buggy firmware, which claim to support native DSD, but do it =
incorrectly. And reverting with device specific white-listing is not a =
good approach for future maintenance. Having to device-specific =
white-list each new device appearing on the market from the manufacturer =
just because some old device is broken is not really a sustainable =
model.

So I would just suggest using PCM with the device if it=E2=80=99s DSD =
implementation is buggy/broken, while it claims to have such. Or =
alternatively update the firmware with a fixed one.

Newer MuFi devices work fine though, like for example the M3x DAC I have =
for testing this, and the M6x you mention.

Additional challenge is that many manufacturers use the same USB =
interface implementation with same VID:PID on multiple different =
products. So it is not even necessarily possible to distinguish a =
particular problematic product.


Best regards,

	- Jussi


> On 8. Jul 2026, at 19.33, Salvador Blaya <tiniebla6@gmail.com> wrote:
>=20
> To: alsa-devel@alsa-project.org
> Cc: tiwai@suse.de, jussi@sonarnerd.net, regressions@lists.linux.dev
> Subject: [REGRESSION] snd-usb-audio: commit da3a7ef ("ALSA: usb-audio:
> Update for native DSD support quirks") breaks DSD playback on Musical
> Fidelity M6s DAC (2772:0502), plays ~8.8% fast
>=20
> Hi,
>=20
> Commit da3a7efff64e ("ALSA: usb-audio: Update for native DSD support
> quirks") added VENDOR_FLG(0x2772) with QUIRK_FLAG_DSD_RAW for Musical
> Fidelity devices. This vendor-wide match also catches the (older,
> discontinued) Musical Fidelity M6s DAC, USB ID 2772:0502, which =
exposes
> a UAC2 altsetting with bmFormats 0x80000000 (RAW_DATA, 32-bit) but
> whose firmware cannot actually clock DSD playback correctly in any
> mode. As a result, since this commit, applications like MPD prefer the
> newly offered native DSD over DSD-to-PCM conversion and playback is
> audibly broken (runs ~8.8% fast, raised pitch), where kernels without
> the commit (e.g. 6.12.x) play correctly.
>=20
> Could 2772:0502 be excluded from the vendor flag (or the vendor flag
> be narrowed to the specific products that support native DSD, such as
> the newer M6x DAC)?
>=20
> Evidence gathered on Debian trixie, MPD, direct hw: access, no
> resampling:
>=20
> 1) Native DSD (observed on 7.0.7 through 7.0.12): host side is correct
>   - hw_params shows format DSD_U32_BE, rate 88200 (correct for DSD64)
>   - but playback runs ~8.8% fast with raised pitch. A 4:41 track
>   finishes in ~4:15, matching a 48 kHz-family clock (3.072 MHz)
>   applied to a 2.8224 MHz DSD64 stream (ratio 1.0884).
>=20
> 2) DoP (6.12.9, MPD dop=3Dyes): host side again correct - hw_params
>   shows S32_LE, rate 176400 - same ~8.8% fast playback. So the DAC's
>   internal DSD decoding path is misclocked regardless of transport.
>=20
> 3) Control test: the same DSD64 track converted to PCM FLAC at
>   176400 Hz plays at correct speed/pitch through the exact same path
>   (S32_LE @ 176400). The 44.1 kHz rate family is fine for PCM; only
>   DSD decoding inside the DAC is broken. This rules out any host-side
>   rate issue.
>=20
> 4) The same fault has long been reported for this DAC on Windows 10
>   with the official ASIO driver ("DSD via DoP plays noticeably
>   faster"):
>   =
https://community.roonlabs.com/t/musical-fidelity-m6-sdac-dsd-issues/39450=

>   including a follow-up for the successor model (M6sR). This is an
>   OS-independent firmware defect that the manufacturer never fixed,
>   which is presumably why this model was specified as DoP-only.
>=20
> Working configuration for reference (correct playback): MPD with
> dop "no", MPD's dsd2pcm conversion to 352800 Hz - i.e. the behaviour
> kernels without the commit provide by default for this device.
>=20
> Since these quirk updates tend to be backported to stable/LTS trees,
> please consider the fix for stable as well, so that currently working
> LTS kernels (e.g. 6.12.y) don't regress.
>=20
> Full lsusb -v output attached. Happy to test patches.
>=20
> #regzbot introduced: da3a7efff64ec0d63af4499eea3a46a2e13b5797
>=20
> Please CC me on replies, I'm not subscribed to the list.
>=20
> Best regards,
>=20
> S. Blaya
> <m6sdac-lsusb.txt>

