Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F17F1C95F1
	for <regressions@lists.linux.dev>; Wed,  5 Jun 2024 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589078; cv=none; b=Nb1xxjHZtovnQ4e8UI+7XX+AiExAELTEvhNjKyhjdcZzJFZUNqk00H/t3vvYxY3rHDt2+ZNAHq7eTGAhUm6FJlIzZM5E0wL1kSPZf3hFK4vHXY3IDJKTBklm0UWHTz+ZFrKtDE5SwbScKzAExKNca/6AaOzpxv0H57Ozt13R59Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589078; c=relaxed/simple;
	bh=m84OVoVm5ii/jkR8JBTs1AiS6uReMQ5aalhNMwK9OII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=A+MZvRkZMrGQp2vxUaUXRt4frZbnK9ni67cPBJLIwMTOfgKni5XOYUw+zHCiyG0WJ1KPF8VZqejkZ9Ab+sJJqSexlQNXAzrsWxX3UP0RnTIk+Ys+2FUbjYZnTqNm8vN7oLlHXa3U8gOZf3YpUQK1xzw4WK00TKmiDN/e+075Gs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvRI8D3d; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvRI8D3d"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-43fb8cdb29eso2410591cf.3
        for <regressions@lists.linux.dev>; Wed, 05 Jun 2024 05:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717589075; x=1718193875; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPuTc08wjjwpO86SOuNZKeHCnjPvY6giUw1ze6bOSPo=;
        b=EvRI8D3dluS7vsvWAdOiv0+itfGAsowSj6aCU8P07O9hW7rsGRcH3Iq6L3mSuvcJ64
         3twvNfs4hPAQ3eLzOaB5zAIHAjvZ7dcB/K3jpYNKrV+K+vKqP16KN214GJVmZQem4vbJ
         Pn6pHCSiwa05uTheJoahm4oV5Qb/NdhHQldXjf3pZhH5Kl1F4zi9IZzKt8fw2uBGoaA4
         6fzDy3nS+YIZMVhkxNiuS3It2wp5BjH7+impc71bJlvXodJYJ4WC6dcxUo0t4mmzfUW6
         rpAJhtkADU0xNvQPWcLmWh4I0M7Q6ItKtxOk8hvCstX0nAO051Hxhgzr2Qph2uRI7bXs
         iKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717589075; x=1718193875;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPuTc08wjjwpO86SOuNZKeHCnjPvY6giUw1ze6bOSPo=;
        b=gCVF8gHTorqa2QGBHMxNih9GeqskiDp/JNmb35hPoozV82fkvDnKigkGVNWwEyj+cJ
         vnoey1whmSheF1pO7unqvuOOyRyCAGayweZ+zfOGzOiARMkS5D7NersWeEIFb8KmDNLw
         gnoNzL6jl5IbU9FmlsgfkRYgNoW5Q3lppDWHdie64lZ87oe5Nu42dm0oYcvmCyR0Ik/u
         gsLLrkwpWs45DQZyJlwO/bgijYQfUPePl+IydUCtvZwUAbsWpnD8twHg+DQqW0gxOioW
         BJ3+kkWv/JQ5TqsPQ3UdSwyVQFDMh66At0yD4aYbmLybVDu/bMQuQ1y+esw8phDaRoWO
         HNdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBZr+GhV0zbqXVfFGaM4SmQ3i/X0u/H2Pj4x5TOBTMS/HVEdTKIwTGuqV4nmx1+F23qI3OJbenMKmFKuygw6Zz5YcAOxlxO0vTJ7o=
X-Gm-Message-State: AOJu0YzCWsfkORwmKxyJbx3VLJoFTVYijdZXFqXkIKXbEOLXfm9FeeyZ
	4G4w2wvVu2jjei9BbQ/PmAI8V+xBDsysk2URu5/e94cKRAmcRmK2Byfv7tbfQ+Bx5sGZwTJ+tOS
	RlgBhzj6W/PnBsllUbNlDghr/fkY=
X-Google-Smtp-Source: AGHT+IH08DASZwWkloRJgaFzndX3ohxbVhpChXg8kKGgMmIS7uWE00LXdMQ3IF+ghEagWVLqDXyH4FitBoiNT2IQTPQ=
X-Received: by 2002:a05:6214:765:b0:6ad:7a58:4e01 with SMTP id
 6a1803df08f44-6b030a489d7mr23866326d6.3.1717589074779; Wed, 05 Jun 2024
 05:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
In-Reply-To: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 5 Jun 2024 17:04:23 +0500
Message-ID: <CABXGCsN=9UFvGgKztzkkAM1c8cVN-h=TKLLxWhKgTm11h+H-eg@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, Rodrigo.Siqueira@amd.com, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 26, 2024 at 7:06=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> Hi,
> Day before yesterday I replaced 7900XTX to 6900XT for got clear in
> which kernel first time appeared warning message "DMA-API: amdgpu
> 0000:0f:00.0: cacheline tracking EEXIST, overlapping mappings aren't
> supported".
> The kernel 6.3 and older won't boot on a computer with Radeon 7900XTX.
> When I booted the system with 6900XT I saw a green flashing bar on top
> of the screen when I typed commands in the gnome terminal which was
> maximized on full screen.
> Demonstration: https://youtu.be/tTvwQ_5pRkk
> For reproduction you need Radeon 6900XT GPU connected to 120Hz OLED TV by=
 HDMI.
>
> I bisected the issue and the first commit which I found was 6d4279cb99ac.
> commit 6d4279cb99ac4f51d10409501d29969f687ac8dc (HEAD)
> Author: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Date:   Tue Mar 26 10:42:05 2024 -0600
>
>     drm/amd/display: Drop legacy code
>
>     This commit removes code that are not used by display anymore.
>
>     Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>     Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
>  drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h         |  4 ----
>  drivers/gpu/drm/amd/display/dc/inc/resource.h                  |  7 ----=
---
>  drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c         | 10 ----=
------
>  drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c | 33
> +--------------------------------
>  4 files changed, 1 insertion(+), 53 deletions(-)
>
> Every time after bisecting I usually make sure that I found the right
> commit and build the kernel with revert of the bad commit.
> But this time I again observed an issue after running a kernel builded
> without commit 6d4279cb99ac.
> And I decided to find a second bad commit.
> The second bad commit has been bc87d666c05.
> commit bc87d666c05a13e6d4ae1ddce41fc43d2567b9a2 (HEAD)
> Author: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Date:   Tue Mar 26 11:55:19 2024 -0600
>
>     drm/amd/display: Add fallback configuration for set DRR in DCN10
>
>     Set OTG/OPTC parameters to 0 if something goes wrong on DCN10.
>
>     Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>     Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
>  drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c | 15 ++++++++++++=
---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> After reverting both these commits on top of 54f71b0369c9 the issue is go=
ne.
>
> I also attach the build config.
>
> My hardware specs: https://linux-hardware.org/?probe=3Df25a873c5e
>
> Rodrigo or anyone else from the AMD team can you look please.
>

Did anyone watch?

--=20
Best Regards,
Mike Gavrilov.
