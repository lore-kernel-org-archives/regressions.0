Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1821547F3
	for <regressions@lists.linux.dev>; Wed,  4 Sep 2024 22:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725488478; cv=none; b=KyFAuuwJ65eHNTUMXzLMKBra59jnsnvoXWGqxy3SP+XLw/ThSknK1sp9KB0L3soYitXzG0iwpOkezLFcGoVyOTO3toEOt+6RYyjYj9cBDZar6kYXyCyu9yeFAxIOr1Sw4WCWvPdq6tBiQXlaN/iZ9g62MPBMIXGk/gmwYb8ZPnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725488478; c=relaxed/simple;
	bh=dK7FaBFpLlAjSwnvL6RJhuBI+MPTM4PP/xh9xkzly3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdGgS3twZ5MP6a/Se3eJMS0mm6sdtdHe2rTDbYsFwTTUVjqnIzunUKdl8n/EZh3n/WJtTYWuRJ7b7H4oh6d0OXVReuNpb2aVxTtOvmOM4c/hp0t3R0dPkIC7+8Tx/iUI51KEF+6qorFwJaZc58Qwa+22ny4R7maA0wpzzGGXG6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4PTFFp3; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4PTFFp3"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6c352bcb569so733006d6.0
        for <regressions@lists.linux.dev>; Wed, 04 Sep 2024 15:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725488476; x=1726093276; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4BjDZksMUGjCuuM0wynyggvya2SNR5AumLLo86Iig0=;
        b=D4PTFFp3YX8AMdv6dZKg041QsCs5/R241F6SZWAoxK0KKPfpfM7esZEMyJ8lBtmfuY
         eMZm3IhyW5zXvwX2m8ijzA5YQmgjTSU5Pe6qwSyaaFcKOXZbrRUpqM11hivUZEim8vc+
         KtnmHywE4Al0OYqp8TtbLroblE9cllZoFbCxgHHD84XTUtXMnQPvIXjmmE8qCYWELp98
         YoIG/TkvbF3iWvqgETy9Y0VnnySQJCxPKKIelfv4GpTqd8F9PSd/cu38Vk+41cmJqoc2
         oy+Lo0ULYx7d3RSb6lr/dPmGZgY17PisrHIoSjuYnvnrXl1SSoYnJkHh+HBz/smk7fhb
         joZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725488476; x=1726093276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4BjDZksMUGjCuuM0wynyggvya2SNR5AumLLo86Iig0=;
        b=X4zXFhKbDTxRx8LcUR1QIPlIG0bfgTEYgFGSRhUpcUGGXDgACqC+nh23BFMSEZtVN3
         Aol9uic5FSFF1ngDZMoByjV8GnmgzYofRTGnnaFsGVnPPEQxAMNdjiBghenRa7E0u7QJ
         XUHGacmwEtlEn3YviC/5qiPHITXeWriSJlagMpVkn+LUG/pmRldsz7CRNw0tn2pcoXyJ
         3/CQY6FqtXcmXfKsq+BdYAGJ4cr64n02rLs0lGI8VCkHUdKkI2AoD1vSDFnD+kX116PE
         nsNAjZMcrlC4oFwizFkkNLheeGMW2lnlwWB2VBbN6ZV/DN2uVd02eSrA8Sm6b4/YYtS/
         kivw==
X-Forwarded-Encrypted: i=1; AJvYcCXRXw/s1i/Y4SG93tophOSbwtxrnlz2znnuUuTORfmjyQYFFokmkkHdY7Bp2LrA4WKdiUB5knZlhrBn0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZktYI5NBTTYUcCdDukWzdXAxR05tRpPtiFAjw1b0nZTMMQQn3
	VIS4D5Y8Nbm/p8a8S4Xf0IT4DsGPH3xghMusRt4WB3+VSghznFK7u1QVLjXQtcVa5gvw8UMpiee
	blWU/vv0Pt8e103zuuC4kSzkOXgd89R/SOlei+fmw
X-Google-Smtp-Source: AGHT+IFUOq7qSUlT45ozs1TrcJSJs8d8rLTchRCNkpOywHMb8zMgW3uQ2l0Hzk1KL3FjPWZ5G4dl6rpuBhPseFk8n3A=
X-Received: by 2002:a05:6214:338a:b0:6b5:eba0:d0ab with SMTP id
 6a1803df08f44-6c355684df7mr145628906d6.15.1725488475868; Wed, 04 Sep 2024
 15:21:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
 <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
 <CABXGCsMdxHJ-MLkS0pm51Sk8g0PTghsuZxmowvj5t44bVN4ndA@mail.gmail.com> <ffd2c40c-1c2e-4465-b26f-88d5e08a80d9@amd.com>
In-Reply-To: <ffd2c40c-1c2e-4465-b26f-88d5e08a80d9@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 5 Sep 2024 03:21:04 +0500
Message-ID: <CABXGCsOoL5vD0+FRALFQFr3ZBpb2z5mpGKzAD5RHoW9_sb5yaQ@mail.gmail.com>
Subject: Re: 6.11/regression/bisected - after commit 1b04dcca4fb1, launching
 some RenPy games causes computer hang
To: Leo Li <sunpeng.li@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, zaeem.mohamed@amd.com, 
	pekka.paalanen@collabora.com, "Wheeler, Daniel" <daniel.wheeler@amd.com>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 4:15=E2=80=AFAM Leo Li <sunpeng.li@amd.com> wrote:
> Hi Mike,
>
> Super sorry for the ridiculous wait. Your first two emails slipped by my =
inbox,
> which is really silly, given I'm first in the to field...
>
> Thanks for bisecting and finding a free game to reproduce it on. I did no=
t have
> luck reproducing this today, but I am on sway and not gnome. While I get =
gnome
> set up, will you be able to test which one of these reverts fixes the han=
g for
> you? Whether just 1/2 is enough, or both 1/2 and 2/2 is required?
>
> I applied them on top of Linus's v6.11-rc6 tag, so hopefully they'll git =
am
> cleanly for you:
>
> 1/2:
> https://gist.github.com/leeonadoh/69147b5fa8d815b39c5f4c3e005cca28#file-0=
001-revert-drm-amd-display-move-primary-plane-zpos-highe-patch
> 2/2:
> https://gist.github.com/leeonadoh/69147b5fa8d815b39c5f4c3e005cca28#file-0=
002-revert-drm-amd-display-introduce-overlay-cursor-mode-patch
>

The first patch is not enough.
Yes, it fixes the system hang when I launch the game "Find the Orange Narwh=
al".
But it does not fix the issue completely.
Some RenPy games still can lead the system to hang.
For example "Innocence Or Money Season 1"
https://store.steampowered.com/app/1958390/Innocence_Or_Money_Season_1__Epi=
sodes_1_to_3/
on the language selection screen.

Unfortunately the kernel is not builded with both patches.
I have got compilation error after applying second patch:

  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chid.o
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In
function =E2=80=98amdgpu_dm_atomic_check=E2=80=99:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:11003:69:
error: unused variable =E2=80=98new_cursor_state=E2=80=99 [-Werror=3Dunused=
-variable]
11003 |         struct drm_plane_state *old_plane_state,
*new_plane_state, *new_cursor_state;
      |
     ^~~~~~~~~~~~~~~~
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/conversion.o
***
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.o
cc1: all warnings being treated as errors
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.=
o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ad102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv40.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_=
mgr.o
make[6]: *** [scripts/Makefile.build:244:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.o] Error 1
make[6]: *** Waiting for unfinished jobs....
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.o
***
make[5]: *** [scripts/Makefile.build:485: drivers/gpu/drm/amd/amdgpu] Error=
 2
make[4]: *** [scripts/Makefile.build:485: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:485: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:485: drivers] Error 2
make[1]: *** [/home/mikhail/packaging-work/git/linux-3/Makefile:1925: .] Er=
ror 2
make: *** [Makefile:224: __sub-make] Error 2

--=20
Best Regards,
Mike Gavrilov.
