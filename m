Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2A83B38AF
	for <regressions@lists.linux.dev>; Thu,  9 Jul 2026 07:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581036; cv=pass; b=cirBrS1wjw5PWb/9vKtHRAXVM3uxBaKaqsXpg2u+g43cfbuG1DUsTF/APl5Gl4FQXaP+805OXW/AbNLlZVZdAWv8q9BikXdBvIu9yleDn1gHPe7wEtJ9sxiIozD66P4reqpYox/mabomBbaWyoARq+0JjQ43lgCCOCh+JTYVxxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581036; c=relaxed/simple;
	bh=6SMCHuy00s9l0hfP90+AD8AyjGEzNImrpyQbKe/qJTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0lWyE7eLOO9dyxRyKvjIZ916ryVPunIpkzhVAUaq8J5QnRk+VvF5EOpk8Q54Bg7tIoiXf24cbIifw2Ij7pS3PV36kvi8I8UAcUg0QS5Id/UHdjtNowg/d1upljIn8qeHJOZK+4hyJZxAyMIw+HdwBimKSvYjKS7JlebXPCDhK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pUe5ChZ1; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pUe5ChZ1"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6a324d200c2so1028332eaf.3
        for <regressions@lists.linux.dev>; Thu, 09 Jul 2026 00:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783581033; cv=none;
        d=google.com; s=arc-20260327;
        b=QvrlTgD5x38WyE1mKb/hjO2sJdbK1/+yC7Qi9dLVi/ZFKVV1DNECXJ9FJ6OvAea4av
         23NndRl2xycaOsO3Poi4TCYM0oFw330gDJJLVm/PRQRPdLPn9PPSwQa/W61z2FjWQHjq
         DAb9BmBt5XBRjTVr5n9YYEgUxYIoxvfKJHLQIZhi6ZXebushJfyf3HYLFedKPq/2nMIH
         aVCsxKqoDz6gBu8rXJ4VwXrCEo2iDL7Mk+0reJlvprXvrhBVb53uZqWWX1owk1DqA7wK
         1//imUH/qfZqlsGkb1WEmz23tJIdLSVCI0ZZ7Oq5XzS1WifBHN9gPim2Etj4BkFXwmwe
         jL1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GRXeQ5qE6qZskG9oXPGJsVaA14ddyhrHMKes6w0dbtw=;
        fh=CFbT7EYFS1yWCsx10/8+qaVKd22ug4kTPRqlW1ibG+k=;
        b=ZQqpXAxX0B0VhlXMyfefxLw0mSkcVG99KtdAPRH9kqt0SOWBsZOw9dsi3PzEbXk38F
         RXBYo/CCcdUQ74rBQlei/732NIGOsbBogmVkLSrqE74pRPPwILAnDTB2k1e3lFBM2w4+
         +LUt1uxLNwlXHO2eDWEOCXME356sOkZXPuUYztd5eKmXvGomBpt8UO/UVgn7QLEM6efP
         QDdmX+4J83qZj8YwHze+Z9eRT1ENgVVeWlMqi3OS/Rp0iTz0y6oLWgbhVctLa9KCAGsx
         6e0x6OA2DHmPdagzmPArDqMla3sTxe6gWHrlacTOMxRnbY4dHwMBmTqd7oQrf/nicxr8
         y6nw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783581033; x=1784185833; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GRXeQ5qE6qZskG9oXPGJsVaA14ddyhrHMKes6w0dbtw=;
        b=pUe5ChZ1DAt6ugPL8JxCu1SoEWcvIg1P+ck+NReRFRXkCAqwTIRgAkid1BnGBJzP7h
         GR5HJvLha2q9MRj30ygYpwt0NSqnHkhPg5CqA1Bwpm+DFScaIW7nluEvtwrV2jrvtTbO
         zLHtFRkrKbL0U8IrXa5X1vG2JAbCA9BAu0oV/d5H7J9eezmW3Z3tO7a2OYSlDXKtNx5P
         L6/nD4CuYqDFYLyAH9B0G/bZfE+UIRoYrZ76yVCEmhvGIGISpiy4JtrEwZ7DUjYapf7W
         NLjTTPejKIe4jF42WcLzgYuPVNAxoM56ZvzU8CCRPSmMJiW9XCUEXLKM2328JVKBt1yN
         rumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581033; x=1784185833;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRXeQ5qE6qZskG9oXPGJsVaA14ddyhrHMKes6w0dbtw=;
        b=CTq1YR/Ulucxfb05PUYeGBuuAxjKXUtvqTD4e5jO7BIkwnIAJjWIm+aeJi+R0lSCf6
         LYpJTucx7r/LazoAvtS+2fMYcfANQFDbPjBF30yFhpxfI12ys1PR84qXFUw8Wr4RE5aT
         Y0DekMsATeo6hF55Cqdy3u7C+luQG9rMcjJ28mKDvxltAUcDM4npc5GDRoU5ilXw9G3o
         jRldiZJcG4erFBAzAU7pFCU8gxwi02x6mvQ1fykaYo5IK3f4BBFH6y2AcBlZ0RVXfICC
         QzYt2mL7D+rNMq1UNLQTNFIhiUP6aUJGSumNv9SbUzGdDYQ+ZeLS7i1QGGUXoWMG5XrP
         PQxA==
X-Forwarded-Encrypted: i=1; AFNElJ+f9GBFKWHAx0+rafpyO7Urj5l7F+rtNKEsenrsTbRQMweZ7Ekd/to48bnzsreZ5m9VzrPSfv4kWZJNFA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7HXTqimO1PbPyj4ElfD6P29yj2G0x2EYVCsh0GEoYPD0bzO7E
	b5u2Y1H5MFj9jE2n9eUFiNSkenpS3WU6RrHqlFQE7Vpq9HyUudwyZ5m5ATWj30MCnPmWR9ZGiqF
	QtRrEHA1kgaFdotQip8m3Z19V1WNLddM=
X-Gm-Gg: AfdE7cm9mFymmhDbdVDq1+xxOvInIAaKzxWW7XzZ1cOMovXMLh2a7yH3QLTmXHeXK3m
	ffCD+u9FT5jcIzl79mGjyE0smXn7njUgQFxUOFHzS9wb9O/ODJbuHDTRjFfrcpOdZSwJFwQkWs6
	DchXPTmW2XFQlczFzwvo8Bee50FcRpXI+ZKu37X/h6IgBmMm4o0zauOOjb0aUkEmB3+rqxDBfm6
	aDf8vrsOwEMOz6o/RmDH/RizfNpTydjj6lz25tDYQFNWO+wravI/aQwRYPi+EVac5Yf2D03s2w=
X-Received: by 2002:a05:6820:2087:b0:6a3:1e40:6329 with SMTP id
 006d021491bc7-6a36d85fea1mr4429171eaf.13.1783581032902; Thu, 09 Jul 2026
 00:10:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOdyq+qFaqCh=tK_wNnA64hv5pQuA1Y09ANxQ=xK8yR-t4mf9Q@mail.gmail.com>
 <4A4C8B42-D8BB-44D1-BE0B-CB5B4617F29E@sonarnerd.net>
In-Reply-To: <4A4C8B42-D8BB-44D1-BE0B-CB5B4617F29E@sonarnerd.net>
From: Salvador Blaya <tiniebla6@gmail.com>
Date: Thu, 9 Jul 2026 09:10:21 +0200
X-Gm-Features: AVVi8CdUsfr78jpgn-JwLl42qCQn9v_JWlL3kgayPW3yVSKfETZqdr_RJMRxS98
Message-ID: <CAOdyq+oMPFYnF4F=vkX26TiKydOX7DnZiTrRj8D2R7jK5VOPnw@mail.gmail.com>
Subject: Re: [REGRESSION] snd-usb-audio: commit da3a7efff64e ("ALSA:
 usb-audio: Update for native DSD support quirks") breaks DSD playback on
 Musical Fidelity M6s DAC (2772:0502), plays ~8.8% fast
To: Jussi Laako <jussi@sonarnerd.net>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jussi,

Thanks for the explanation - that's fair enough, understood. Since the
defect is in the device firmware and affects every OS, I agree the
right place to pursue a real fix is the manufacturer, which I'm doing
separately.

For the record, and for any other M6s DAC owner finding this thread:
the device plays DSD correctly only via DSD-to-PCM conversion. With
MPD this can be enforced regardless of kernel version by omitting dsd
entries from allowed_formats, e.g.:

audio_output {
    type            "alsa"
    device          "hw:CARD=3DM6sDAC,DEV=3D0"
    mixer_type      "none"
    dop             "no"
    allowed_formats "352800:32:2 176400:32:2 96000:32:2 88200:32:2
48000:32:2 44100:32:2"
}

This restores the pre-7.0.7 behaviour (dsd2pcm at 352.8 kHz), which
plays correctly.

Consider this report resolved as "device firmware defect, workaround
documented". Thanks again for your time.

#regzbot resolve: device firmware defect, not a kernel bug

Best regards

Salvador

El jue, 9 jul 2026 a las 0:28, Jussi Laako (<jussi@sonarnerd.net>) escribi=
=C3=B3:
>
> Hi,
>
> I don=E2=80=99t think we currently have exclusion method for devices with=
 buggy firmware, which claim to support native DSD, but do it incorrectly. =
And reverting with device specific white-listing is not a good approach for=
 future maintenance. Having to device-specific white-list each new device a=
ppearing on the market from the manufacturer just because some old device i=
s broken is not really a sustainable model.
>
> So I would just suggest using PCM with the device if it=E2=80=99s DSD imp=
lementation is buggy/broken, while it claims to have such. Or alternatively=
 update the firmware with a fixed one.
>
> Newer MuFi devices work fine though, like for example the M3x DAC I have =
for testing this, and the M6x you mention.
>
> Additional challenge is that many manufacturers use the same USB interfac=
e implementation with same VID:PID on multiple different products. So it is=
 not even necessarily possible to distinguish a particular problematic prod=
uct.
>
>
> Best regards,
>
>         - Jussi
>
>
> > On 8. Jul 2026, at 19.33, Salvador Blaya <tiniebla6@gmail.com> wrote:
> >
> > To: alsa-devel@alsa-project.org
> > Cc: tiwai@suse.de, jussi@sonarnerd.net, regressions@lists.linux.dev
> > Subject: [REGRESSION] snd-usb-audio: commit da3a7ef ("ALSA: usb-audio:
> > Update for native DSD support quirks") breaks DSD playback on Musical
> > Fidelity M6s DAC (2772:0502), plays ~8.8% fast
> >
> > Hi,
> >
> > Commit da3a7efff64e ("ALSA: usb-audio: Update for native DSD support
> > quirks") added VENDOR_FLG(0x2772) with QUIRK_FLAG_DSD_RAW for Musical
> > Fidelity devices. This vendor-wide match also catches the (older,
> > discontinued) Musical Fidelity M6s DAC, USB ID 2772:0502, which exposes
> > a UAC2 altsetting with bmFormats 0x80000000 (RAW_DATA, 32-bit) but
> > whose firmware cannot actually clock DSD playback correctly in any
> > mode. As a result, since this commit, applications like MPD prefer the
> > newly offered native DSD over DSD-to-PCM conversion and playback is
> > audibly broken (runs ~8.8% fast, raised pitch), where kernels without
> > the commit (e.g. 6.12.x) play correctly.
> >
> > Could 2772:0502 be excluded from the vendor flag (or the vendor flag
> > be narrowed to the specific products that support native DSD, such as
> > the newer M6x DAC)?
> >
> > Evidence gathered on Debian trixie, MPD, direct hw: access, no
> > resampling:
> >
> > 1) Native DSD (observed on 7.0.7 through 7.0.12): host side is correct
> >   - hw_params shows format DSD_U32_BE, rate 88200 (correct for DSD64)
> >   - but playback runs ~8.8% fast with raised pitch. A 4:41 track
> >   finishes in ~4:15, matching a 48 kHz-family clock (3.072 MHz)
> >   applied to a 2.8224 MHz DSD64 stream (ratio 1.0884).
> >
> > 2) DoP (6.12.9, MPD dop=3Dyes): host side again correct - hw_params
> >   shows S32_LE, rate 176400 - same ~8.8% fast playback. So the DAC's
> >   internal DSD decoding path is misclocked regardless of transport.
> >
> > 3) Control test: the same DSD64 track converted to PCM FLAC at
> >   176400 Hz plays at correct speed/pitch through the exact same path
> >   (S32_LE @ 176400). The 44.1 kHz rate family is fine for PCM; only
> >   DSD decoding inside the DAC is broken. This rules out any host-side
> >   rate issue.
> >
> > 4) The same fault has long been reported for this DAC on Windows 10
> >   with the official ASIO driver ("DSD via DoP plays noticeably
> >   faster"):
> >   https://community.roonlabs.com/t/musical-fidelity-m6-sdac-dsd-issues/=
39450
> >   including a follow-up for the successor model (M6sR). This is an
> >   OS-independent firmware defect that the manufacturer never fixed,
> >   which is presumably why this model was specified as DoP-only.
> >
> > Working configuration for reference (correct playback): MPD with
> > dop "no", MPD's dsd2pcm conversion to 352800 Hz - i.e. the behaviour
> > kernels without the commit provide by default for this device.
> >
> > Since these quirk updates tend to be backported to stable/LTS trees,
> > please consider the fix for stable as well, so that currently working
> > LTS kernels (e.g. 6.12.y) don't regress.
> >
> > Full lsusb -v output attached. Happy to test patches.
> >
> > #regzbot introduced: da3a7efff64ec0d63af4499eea3a46a2e13b5797
> >
> > Please CC me on replies, I'm not subscribed to the list.
> >
> > Best regards,
> >
> > S. Blaya
> > <m6sdac-lsusb.txt>
>
