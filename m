Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6883126C6
	for <regressions@lists.linux.dev>; Wed, 15 Oct 2025 06:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760511021; cv=none; b=I0Wue5MW2gYN4faxbdZyGE2Qj9+OqF1DdcSSU7x8vnssvVGgSNvo9kfujmYPOd+yT75qzhibUMQZVY8eHKHC9qKKFt8K4OMBTKQ8tFb4fYhHW7BFAawZhCrD080cZuoWKJx39UQL9dVNAuqJ9N23Wc4MEr83i9vcuYnFXumkB/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760511021; c=relaxed/simple;
	bh=b/ZmBA9vQFyoE864lb9qBg9zWcvecKvXW/0DQggOaWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APdeBU/BU8q65gwm36tM4e4a1fazJMOLQj9F70gXM+KA3VBECtvWgCPuTbxhBrhtoGV1Uu2sxdi0h9FkO8c4q0bwZxcAFK/kn80vARcs3GMVqdnugx6rHEmI4QwzZ98/BnaSo6lqO8gNgZYNmT8A23ki1b7xXtFufUmzwzbmKMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAbo2B8s; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAbo2B8s"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7817c2d909cso445907b3.1
        for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 23:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760511018; x=1761115818; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/ZmBA9vQFyoE864lb9qBg9zWcvecKvXW/0DQggOaWU=;
        b=eAbo2B8sDfdGwiF5VcDsGkEvny/P6WXIGXS5MQEd3LYMd5mT/EaGdCm/NwP9U7Nwuk
         krZ5ymbID0mMQu0QnZTEyCf4kZDRekAatAM459kRMFrIvJoNBRPb2OlzETuAj25EYZ2V
         ieh8P3uswtm+Y67kS/WkPh5OwXh6YmQ54etVfRJCQW2n0Y17YeCizBCa6T/n481dvKkO
         qjauJxjvPIpr5VahztwFUHEbv8r9LZpdHrzPSOMbc1QMkONlH94nTjEiXYqcZQ7omLZV
         8BmpPOlKcht7JtX60PggROv7g+IHmQidVP/1bRwuUBX3bpQnCY3QuJVXtXLEbeshlLFt
         pksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760511018; x=1761115818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/ZmBA9vQFyoE864lb9qBg9zWcvecKvXW/0DQggOaWU=;
        b=uYX2CvI5C0ODgrif9SpKctc9RR4mkIOJNG81G56Rs0y4a45aa+neyjCJgm7e4qQKOL
         JHkCqFiQ1lzKVpRyAgW9p25k3HZd17bwzgI+xmMyuY9tG1c5rB3cSeZZW9kKlo92j/e+
         POpWSXMcUaaKZHgE+ITATKO/BzW6fK6+zuNceuPB/DA8RMeyqD1o8pBREceKyk1ORANN
         TfPzk6Xg6DmVOiGJJh7v1uyy6CFXio5JPSm3e1oVPUys6PoM+p4cJs4CDyBylK2iB+hG
         WWR2Q4jNJP8/yfLR3YJiNQuJA6UydtlAa4C0fjNwXRYL+9zv/xt47abGQCFB9g88qpM7
         0luQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFCbhIZ13kfuReLCOMo8T4DJS8MyDWxq3jU6MNqEtlC7R4CNBtLnkD+N/4ZP43CFd3nPnrfs0gF3m8mA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyndwK39X6ii0etI2LWaIJ6g9feCHNfOyNWZ85NodQXOM71W7Jp
	zFO56+DvmS/MzJFRv7zkm9K8Fv8htrYweW9P90qCkHWYDMCng1kGevPM0WWX+9SKvjU7v1sDLN7
	aVW5QhfnpQxbQSK7YFggP/jQY4btoBps=
X-Gm-Gg: ASbGncs/vWz/EgiMfz29BYjaQgcelCFQaFwstMSkG9G5Rp4XFWGBXrbe/UfHTBE+Vao
	U/TTJuTLgjrCbYY4niB7TC5Nk+Uz2UJl2vEnteah7EXKtdnTOKJWtmoKVa7OM3N9Fd4wlJPuUAE
	z+IhOgnD+m4rNgq3q5x7uWuh3nX1k+tbr7l8JsWB5N15ZsOEpZ7SyzqRTssF002NF/1HrFGZXMn
	ZPLL0j1kTur4hRWN1+GOq0DZGVRsg==
X-Google-Smtp-Source: AGHT+IFPNwQgBvG2Jym4k/B0G+KrQt6FSH28b6hKi+XVutdrZ3bbmlMfxAKAFdUkns70IdMazIhl2B+kzxk6tv2OQ8o=
X-Received: by 2002:a05:690c:48ca:b0:781:64f:2b1d with SMTP id
 00721157ae682-781064f3469mr309374147b3.63.1760511018436; Tue, 14 Oct 2025
 23:50:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709160434.1859-6-tiwai@suse.de> <20251014034156.4480-1-safinaskar@gmail.com>
 <875xci81dt.wl-tiwai@suse.de> <CAPnZJGDffiY-9sBTfdOYkkmjQqb79M3d8uLdyyb6eAxU8fqbuA@mail.gmail.com>
 <871pn47lw9.wl-tiwai@suse.de>
In-Reply-To: <871pn47lw9.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Wed, 15 Oct 2025 09:49:42 +0300
X-Gm-Features: AS18NWB4UG4JzkWf-LgevuOpXRWrqYaHmn-MyEZ2ITSOFdL1bmV2n62UlA1cib0
Message-ID: <CAPnZJGDeJsD9CHAmF1XkHctMAuXTkE3egEgyh-WWjHo6ctoygQ@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA:
 hda: Move controller drivers into sound/hda/controllers directory)
To: Takashi Iwai <tiwai@suse.de>
Cc: amadeuszx.slawinski@linux.intel.com, baojun.xu@ti.com, 
	bo.liu@senarytech.com, cezary.rojewski@intel.com, 
	kai.vehmanen@linux.intel.com, kailang@realtek.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	rf@opensource.cirrus.com, regressions@lists.linux.dev, 
	Dell.Client.Kernel@dell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 8:51=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
> You have to enable CONFIG_SND_HDA_CODEC_ALC* config, too.

I just did another experiment. I enabled everything in "audio hd" menu
in v6.18-rc1.
And still no sound.
Kernel version is v6.18-rc1. Config is here:
https://zerobin.net/?e345ae7df1223a43#h3Dm4HiKvM3GWbTl3f8ErMAS5cm8gd3MOM/IZ=
P0Ta6w=3D

As you can see, all CONFIG_SND_HDA_CODEC_ALC* options are enabled there.

> As already mentioned, those are the new config of each Realtek codec
> driver that now became selectable individually when CONFIG_EXPERT=3Dy
> (so you say you're an expert :)

CONFIG_EXPERT is indeed set to "y". This is because this config was
generated using "localmodconfig" from Debian's config, which has CONFIG_EXP=
ERT.

--=20
Askar Safin
