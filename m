Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2732DC78C
	for <regressions@lists.linux.dev>; Sat, 18 Apr 2026 15:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776526804; cv=pass; b=GiQASarlGzXB4/2kFrn3+QE//Yb+uJkOCNd4mZDeOMWKAeC1HqF+G0p2ao+S7Qz2j4+u8kZ84BKLEAlbVTZBbjMR4yj21wsEQ8G+J200wVLYXLAMF4tbSEAZO5cPIPHxHW8wqyRo1G2YGbuS3UMjNHUcduqc1JM3OgFMk4jZlxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776526804; c=relaxed/simple;
	bh=cEvYDuFXuVic9scYpdvaU/f/zI61Ha5D07vebOF2hUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjeefHt4j/2aCWA8KGRMFqEY9QC4DaXvb0TMaC19Wk/sUuIIaXLJ2QgbPcb/GX02s5BVdRkoIjE3Gbw1x42TvFfFiY03Ai1KxyzkjKLQAuy7IvEZSpHorE5moBLLcXX7R2s5Wnkn/Sg61AO1RIKztL4KuChG+Fx22Xlwdi4LCaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DogPJcOJ; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DogPJcOJ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-671ff4b716cso2768659a12.1
        for <regressions@lists.linux.dev>; Sat, 18 Apr 2026 08:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776526801; cv=none;
        d=google.com; s=arc-20240605;
        b=crTfegR4pCm5Oueu7cM0JCyKGbl1/S+KYt0tpHRF+9V25oUGzWmd1VH/lS7CQ8u0mB
         OcO7xCIwDiQqTTDYjxClGG09XhXlQqG2hc7ZfouSFBuGjKNufngr/H8jIqgeps7QV+16
         Emed73XlEBSZcb08yCq5cU12yZXQiGHWNljrkb1gYCluBiQl2OMgDgjhl8hcGvvCJb1j
         Ey/8/z1ia/FF+9v970ZuZwf4evYLZFYWb3xlCWOAamqzoJO4uxzecNDQw2fLW+x4V8wm
         Kv1949DBPkXqk34IeTxe0wzr9AOVwqI8O2TI4OF8yAhuXiGQmLMMTLd77zZoQtozpSdt
         pRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cEvYDuFXuVic9scYpdvaU/f/zI61Ha5D07vebOF2hUA=;
        fh=nMJU1YcrX8UJ6oFQJFjaG261oagwy0+Ig0klY5WkYQU=;
        b=Ny8M3G260UDtvXk5GpOfWwUoirOQxSiu47hg7Dnn8krLei6HxpvkTwjPRj1yh+0wsY
         5uiiQ6nujPy58tBKzHHTi8iNcOm7W3YdEeKICQr+oWrBYY+TrZf3xcS7qDInVsd804oy
         v9qd69fki1/aXN0NNJV9P+F2DeTeKn8KBmrPsO/tb+D2ebSlgvDB6tMSukVLXi7Hp8wA
         VRMpGqxvy8oh/fUMo4Am3/LlibYtBGOv3IflInIewpXsAEXRbW/S6CARVLRPAVZwWbiH
         s5fgF4/nNYB/fYz9NJgqeeVJELzxzYC1dekTWRn3pPgt/QZPIyDrn64rOutI2T4inACT
         ZElg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776526801; x=1777131601; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEvYDuFXuVic9scYpdvaU/f/zI61Ha5D07vebOF2hUA=;
        b=DogPJcOJ4QZcQLN1eZb7QgaUul0tlhZzwzwV/wYRCYn0GgKmB9yRS3pRFlLM9r2RcH
         ORAj6wX9XdvCK8IwvBWm225I2oWNb6gTvGfmkqTnafixto+uHLf5UrxBjraDTJr9MwMq
         0dwR7rWwmr5STpy/6WMc5Hp2SG+EcWG81jAoRH0fJVI4TsXPIUwXOHU86igOm7Z8XCYe
         MY+hm3HRQHFbef89OhkZQh9lr7bB6oP1diPdyB/eKLy6ICCvVgP/ukTQ1Ax9/pjwMXTF
         fQpY0KfC1Nf2gxdcHgax1THH67jtXTbbyK+DvkBHedVberNrvOuyxL+TOcmsbCk0CJSx
         /WSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776526801; x=1777131601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cEvYDuFXuVic9scYpdvaU/f/zI61Ha5D07vebOF2hUA=;
        b=baEutvXDJcIktPRrjJIsIs2zRL7+2QpTa6ikGJ/9FT7x8sm+0GHhtMyPl9N0LK+qOo
         j/2fXJqb1T/ueO8+6bp0O1Dp6N9Qx45MCDbBdPHIzU47avth0wYLvG1OLFbqSumeSdhT
         3p64dAYiqf1tBhINkpo1AM7dIGHy0o7cgkOUZmLjHp8EnXUvoNZvIHTurcBpenoWI/Wa
         VW4TafFCirUwMFk7PzjXSJa/wm1B6lXSgsWe2fhAQZs984oZa8CPDHy6SRDMwVZierLk
         Pe+aunsWF/MuAC288WT4RqycM/F2ETbMrIAKnB00HKBEIwRmpNHMDohahSw7yWkGKFFH
         rjiQ==
X-Forwarded-Encrypted: i=1; AFNElJ97f68ajpoy2m6DFnTyrRwV/Rtu89hej8DFUXxp8JjTpwcneap/rZHWaU06cwWpD7vVnlARoOzq6HAJZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyii+wM2szTS0SkkhXHWT0S5ziGyVyVY59Lu46jnTJcz5/hIG3o
	IRdpFyFvo6/mHFQPGwhLlvCLYewvoB4CjT3kst/wg4JnRJA9CQL3qxph7pwgPPEDYppebv7p2hC
	/c6M1mqFpg42Oj4eBwAQYsSMyMr5Pg+s=
X-Gm-Gg: AeBDieuOTAZXDElI+KzXydVSR43dOBSzNZyW35kjkAk0wCkkW81glTclF++xEGSbj8Q
	lREAkBw+2/3710mpjTz1uwtIeSisPvtqNhC8zCTYfy+kjQx6LJGUFmI8ce54vUv5cYXEt0ZXclg
	i70DgOsh/MkHtx90DhL3L1CN3IhCzfPROSYeoQAfd2LzRlusS6wM7ghI5WXeD0vWp02GK9xBnpO
	DxplhT5bP3MWv0sUUSkU/MqAT2aUIHP0m03ZvkRnwYAk+/PswWCe2i7QzcKgGFyyEmGhxoQBUKn
	OOgx+mxrnx+rgvoqfxrZ5LyWrv/+bTKUUVTuiRvUciqemgSm
X-Received: by 2002:a17:906:fe45:b0:ba5:7cce:979f with SMTP id
 a640c23a62f3a-ba57cce99dbmr117469966b.40.1776526800916; Sat, 18 Apr 2026
 08:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHWLEDHfXZScF5jNDzgOxGXf-MBDcVNtqW0DbNz8Ra8rtcuL+w@mail.gmail.com>
 <CAOdxtTbwipkyAfDakLAB6aVp6YkPWtKpDdVDUTz88WDB-18HXQ@mail.gmail.com>
In-Reply-To: <CAOdxtTbwipkyAfDakLAB6aVp6YkPWtKpDdVDUTz88WDB-18HXQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 18 Apr 2026 17:39:49 +0200
X-Gm-Features: AQROBzCvSbGA03ROsg6cVMJlbAynfy2yIZAnavXEgKUY8bnKpwlWeH4xlKzfKLE
Message-ID: <CAOQ4uxhUn6oCBuVJqZu+FcMx8XeAQHZbXFAGon4Xeg2SPLJW_A@mail.gmail.com>
Subject: Re: [REGRESSION] Return change in 6.12.80+ with volatile mounting
To: Chenglong Tang <chenglongtang@google.com>
Cc: Derek Taylor <ddtaylor@google.com>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, Kevin Berry <kpberry@google.com>, 
	overlayfs <linux-unionfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 18, 2026 at 1:33=E2=80=AFAM Chenglong Tang <chenglongtang@googl=
e.com> wrote:
>
> CC Amir,
>
> For example, containerd 2.2.0 uses `volatile` instead of `fsync=3Dvolatil=
e`:
> https://github.com/containerd/containerd/blob/main/core/mount/temp.go#L91=
C1-L92C1
>
> On Fri, Apr 17, 2026 at 3:41=E2=80=AFPM Derek Taylor <ddtaylor@google.com=
> wrote:
> >
> > This change seems to have so far affected at least containerd in an
> > issue reported here
> > https://github.com/containerd/containerd/issues/13250.
> >
> > In stable versions 6.12.80+, commit
> > 6c0cfbe020c0fcd2a544fcd2931fbc366ee3cd12 with the specific change
> > being:
> > [*] The mount option "volatile" is an alias to "fsync=3Dvolatile".
> > In this scenario, code relying on checking "volatile" will now fail
> > due to the return being "fsync=3Dvolatile".
> >
> > #regzbot introduced:v6.12.80

Hi Chenglong,

Thanks for the report.

Is this problem in production containerd or in a test suite?
I did not understand the purpose of WithTempMount().

Is it possible to fix this function to use string.Contains() instead of
exact match to the "volatile" mount option?

If needed I can fix the kernel to show the legacy "volatile" option,
but I would like to first understand how bad the impact of this regression
is on real production workloads.

Thanks,
Amir.
