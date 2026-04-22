Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3642D5922
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 04:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776833576; cv=pass; b=jxNMxUHUMAdIMw/UwhaEUJHktzkhrlchxjBJin6pHHQdBrVkh2Da+YT7bY1Cb/eME5zYkWqeD+9QTbhbf2qNCc/1x6L7MUPAHrxhCBOClpbSXDrpprKknnXyxceY7ND7ZjLJ5rf2GmqiE59oTVE3CpKwZ1JsjZ73aPKNCxxoqcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776833576; c=relaxed/simple;
	bh=q0Y5z69t7EnwFRmoQuriHXgrdZschTXv+jqPXtob9f4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j25kKe2igaGdV6fYdb+ydaUXMQdMcSdCB7mrXEiTykUEmk0pQksCIzHAUEak5Mmv7C1i4K4wbUdXCcPLGyXriqOeZFa93SiFB4ZWGEIqsJlCO6r8ZKz3nCNere+jFmF8F6Xsroh+2SM6cX9JkHcc8rZOTjFCP1NoKIMTaZtPbL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzUrIRSz; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzUrIRSz"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ba9ad0fbc3aso198395266b.1
        for <regressions@lists.linux.dev>; Tue, 21 Apr 2026 21:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776833573; cv=none;
        d=google.com; s=arc-20240605;
        b=OmJJV9LmmsnVXXdL2XrI9CIAoSfMJO7a9npTdi3756FE3BFGx43lKL74lq8z+WAzCR
         bMG13BkRQIYrmnoqcPHflWV/Y3R2cR8QnDWRCsLe61bqRgSifQsR4RwIR3tDxSO0Zwln
         d7DUG9nNrSXN0MSJd4otRKhbB9Kr+Z5tEIuTfBBBeB5sXCAKeXIAH1pUpBz8ckjr8qpX
         AX2wGBFHfOITDp2/PEMg/rO/GwBQKdqVXEi9FvuMN7zNv5ypurDHqNdTszGa+/IHgr6W
         97X6fOUCyy002sOQOAahozY/GRHG9ThH5ZOELqVHsUp4VYzlT/V6sG1nhZi2S2+4jDDH
         4d4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Htvix0mRwzhVxf5R0Kf0KLjebkh+Pa0xXAtyZO4Zg+Y=;
        fh=6RuZjdF+LcCOCftCrwQ54623vL440Z0WhYMugFrAC+U=;
        b=CQgVnSYqGtrbavXbLITeeKjsJtuzpAfOb3MnxbhthGNjbZhTKnN/j6sgotDhHlIpxX
         JWmlNaBfq2N530zwKnwp1g+XYJJ+fBWqafNVRYltdGT1bTjX2Ha8sJpIEhBDr6OfbCQh
         c1TTyBbpQtulxifIMw9BNzHE2DkN4DDWyMiABs2E4auaCaIds1z2rLOROy8/6zUFymWv
         VL4E6ADww1qIz/ExijYUZoZ2Ca/krSWVyxNr2fWxqYcC72HRD1H3LbFlsVWiQI+pVp9E
         kxFgFOxWixTDxeMJFeVHwzbOpbroDULZLc14FV6ReQBeRiOhXLfbCT0piBvJBdABOT+j
         QlyQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776833573; x=1777438373; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Htvix0mRwzhVxf5R0Kf0KLjebkh+Pa0xXAtyZO4Zg+Y=;
        b=mzUrIRSz2ymLlxFdNX0QQ3I5g1I9vCmcZy5GaHQGKTjg4xCoNwS+VtNS0tEf1cjMSa
         5B/GoTdmHyko+8axBmEd2DHnFq18I+p/iP68unqTnqJXXTkKcN2PHc7wALbWv7foWy7g
         YrHee3xROE+fcrfqfPf5vJi2BUf54k5gJhrqqCNEZgyriBB9uTtgW/zFYQW8VBri69t9
         5cHVgskDcsDi+jANxt6+jzVIvg/5O9efeeJLWTRy88MQkp50hbm9OoXTzeFsqO8EPezL
         MhXPPT4m1cZc2tgY5FxCgpODUKG8M62EZiBE0gn5Y6PsXgmCZxCOOmAZOQRcCy1XkBsc
         HhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776833573; x=1777438373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Htvix0mRwzhVxf5R0Kf0KLjebkh+Pa0xXAtyZO4Zg+Y=;
        b=X5bJLE6bC/e3iWOPQ7r7eFRlPTXCddJ/czF2CwfSom9US3xHPFsXh8yWENPSYOdrC5
         AGii0hWw07gZGlXGP/nStW09jJmYImKga6eP2IYz++JHHWYfBm86fnTlZgG1F0Q0r5aq
         xDOJDlUT+fg2O8e/4sphisjneSR+xYi751nX6cwBeycOhn3pmG0E1/0mdsd+wx4Wnw39
         DTS1unlajtlLULQM+p+XOmLBBp65DtXaSggXf3tC6HeDNVigtZ+sjZpX0BjihTyZSQaH
         ltx9nUfreGSUCWMP3L4pl+xNuulG8EOLwjRaMPQi81PFwo0h4PD6lECH5Crw23WsnEiC
         2WZw==
X-Forwarded-Encrypted: i=1; AFNElJ+fO1AepKH5oCoBI9KaMWAk96ngK4KduIDXgzlrcWF0wXHB+fSFMy3wARiioA8Axw10NApFvPBhLmbZLw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFvpwtM14r4+6cLsEmW0qgOLEpa6u0mPo526JB5VA3yoIca73+
	qDwfeLN3/22UObgoYIBEpKGueVfaReEavjRTO1UU03/3Z9V5PGsD1aPjp4ft7JCSE/e8GFuSCfo
	y29bGSEGozd2HL/qtJz+fb+ioP/ssgvw=
X-Gm-Gg: AeBDiesWM3c9eZajW34NHszBR8r//HsA7IaRtlAOnuF3hQdWVIVFQU5fGHDCNXz0oOO
	bpIL6p96azQh5eBR/8W/XvduQhljvt/KbTvBHLq4uz1OWLvwQNhwakwoXCugWk4Hb4db/JqxIck
	HYbKY1o66ocIcq+UQqz+L5BGakveaDtrq/fdUTjrhv65UlktFGqqswkOCbPSha2evvKmocPy4Zi
	kH9P5f3nv3DsLLYX3bRCmxWbmiy0Cz0G8pZnvP9wFz5BQs9WkqAZROBJC9j7m8ZkRxjAlugvLcX
	JwEcdx1oYLFFJnrdH+LbjiGa5+zngfW2PGV8oE4FB+oAgDtt1cpxIOtP1B4ohEU=
X-Received: by 2002:a17:907:1c27:b0:ba7:c8bf:dd94 with SMTP id
 a640c23a62f3a-ba7c8bfe835mr543875066b.33.1776833572885; Tue, 21 Apr 2026
 21:52:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHWLEDHfXZScF5jNDzgOxGXf-MBDcVNtqW0DbNz8Ra8rtcuL+w@mail.gmail.com>
 <CAOdxtTbwipkyAfDakLAB6aVp6YkPWtKpDdVDUTz88WDB-18HXQ@mail.gmail.com>
 <CAOQ4uxhUn6oCBuVJqZu+FcMx8XeAQHZbXFAGon4Xeg2SPLJW_A@mail.gmail.com>
 <CAOdxtTaWWu_7eJWu68zf28zHQP3Y--vXTfbGFsceO47BpN3qxA@mail.gmail.com>
 <CAOQ4uxhCNhGinePrnkSfT9Mtf4o5FmBX7mTA2m4miCMOt3mJqA@mail.gmail.com>
 <CAOdxtTZGFxaayJpqsiFQrWBqXvDn7oyxSL3_9TWP919k0FhWTg@mail.gmail.com> <CAE6nXrPes8T9Cn4ihTt43qmtgCCZvmMwYXo-yG_HJgNO7y+vVg@mail.gmail.com>
In-Reply-To: <CAE6nXrPes8T9Cn4ihTt43qmtgCCZvmMwYXo-yG_HJgNO7y+vVg@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 22 Apr 2026 06:52:41 +0200
X-Gm-Features: AQROBzA7_yt5-Xb5zZQao-gRyDtlaRD1k1RwPo-4_dBxDZOooY6wSqAWKd1j_dA
Message-ID: <CAOQ4uxhfwOU7O_vEQsAvRGV-v3_Dk1RcMnwGx-xOpx-FYjoKcg@mail.gmail.com>
Subject: Re: [REGRESSION] Return change in 6.12.80+ with volatile mounting
To: Samuel Karp <samuelkarp@google.com>
Cc: Chenglong Tang <chenglongtang@google.com>, Derek Taylor <ddtaylor@google.com>, 
	stable@vger.kernel.org, regressions@lists.linux.dev, 
	Kevin Berry <kpberry@google.com>, overlayfs <linux-unionfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 1:54=E2=80=AFAM Samuel Karp <samuelkarp@google.com>=
 wrote:
>
> We can fix the test case for the "volatile" option and expect either
> "volatile" or "fsync=3Dvolatile". Existing use within containerd beyond
> the test code involves us producing the "volatile" option and passing
> it to the mount syscall (or _not_ passing it, depending on the
> situation). This seems like it should still work if "fsync=3Dvolatile"
> is an alias rather than a replacement.  However, containerd is not in
> full control of the mount options; as part of snapshot (layer)
> management external snapshotter implementations can provide mount
> options to containerd which containerd then passes to the kernel.  The
> protection in RemoveVolatileOption will break if a newer snapshotter
> produces "fsync=3Dvolatile" and provides it to an unpatched version of
> containerd.  I think the breakage scenario then becomes new kernel +
> new snapshotter (producing the new option) + old containerd.
>

Even if kernel always shows "volatile" in show mount options
the scenario you described will break containerd but that would be
a snapshotter regression (w.r.t. containerd) not a kernel regression.

As I explained before, overlayfs could add a new mount option
fsync=3Doff which has similar "do not reuse this workdir" semantics.
I explained the correct fix to this situation.

Thanks,
Amir.
