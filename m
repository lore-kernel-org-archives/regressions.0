Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78D37C6D5
	for <regressions@lists.linux.dev>; Sat, 24 Aug 2024 21:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724533968; cv=none; b=A9GiA+pM9ZfBHdVdYyqt4aakMO89OK8bLI7zWXclLQqCSz2WGAzS9MjePydmz7GM2uFrMyqERfvQDUBZ8AvK5ZeXaPryRZETxI57o2viDktuUNHddqMsG48Pqx/6n7U3dCPrdv2J2mAic6F/QCLiL/pNwKmQWGPpCLKjlzx97v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724533968; c=relaxed/simple;
	bh=uDOl+vO9up4iiGA7FIV0nyAhQro4ErjFIQJ+ss6KQfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=T7kcITpnLfV/pw1HFGjk1oORxLALjhgJZ/olf0+kYbODLjc2aMbpAHcvDFwUjEJID285H7ylpm57F3pf6NMvBasUhATGkCIgGkALBkdEu5bRnAb9t/Qmbm0sWa0bT0+RcDPH+itaXupefXSvSgXqfMkPEGyRTMxagaVs1At9X58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLGehnMf; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLGehnMf"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6bf7ad1ec3aso17367396d6.0
        for <regressions@lists.linux.dev>; Sat, 24 Aug 2024 14:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724533966; x=1725138766; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CW+oTcHtdhOrYpDlaxzg5hOna1stESaCQpN5etmet0M=;
        b=XLGehnMfV6MqZneHz6Cj2ClzMuMkY/2LH952fSz6GXUK86aiPZDvfCtVrbczT+ZKbp
         PmS67YEsrqZcropqSkaiMZvSsi7z7mj5QYWzKdfDe1SoaeU/mzAxiBvHzMapE903n+LT
         XBiW625JmGC8O+A310UllcPLFG2PWhODHFEgktXVQrIRDKpOKS3ZBVnI6egA+G7foct6
         gJemgyUzwuG3VAqqkHNkG9gMWu0SRpYwko+yD03pHprJtHvfIOjEaizPHVg7KGsQMbLe
         hGtinm3xggZoTQ695PKZmrT6kh5zQGYit52ipXyelMOSxn91DflpWv6eSeNsIxojOiCZ
         OXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724533966; x=1725138766;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CW+oTcHtdhOrYpDlaxzg5hOna1stESaCQpN5etmet0M=;
        b=V1oITgzyTpqgW/q/JKeaVOkIZeaug8NgbR1P/74qezBvyIor1DanpbVVNtU5PtVrh1
         h4dwt1IrVh45IPcPAZSHO56N1K4Z1JJop2we/mfQ8sjKJRLvBqlxJsshHlS9vICXwcvR
         okw+IEGrSNpWWruX8L/g/epejDqNrDAP7pB2f2MO9/9yCflzLrbiE1WHkazSCAdqUnEh
         P8RwIPUwH1sYExHpV0IGU+TSn37yXG8fPaNEXIRNgd/jcMJ2KHHuq6/uv8igOjwIrv1f
         F641L6dC+kXEkzqF0X0PJOwgqTWqPxudxbbbxH1A7RLzd4CdJAt5tJLRTys5PhiVzrFB
         wx8g==
X-Forwarded-Encrypted: i=1; AJvYcCVxnD6vwRrV+FQuVbkaV1+RD0pg11duFH2AP4wBC+MBPvQabOE3+9nrwJSvYJR8G4eFeijJDbehLLChrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGMEFSmxmSLfH1KiP1ba2aoqFRTIzPuY3hvRqDeFzjILb+QBsy
	nttP1fUGcmc8VL1C6JguBS0OMKEUUE/vJKToEEkRGssZXIj3LZ3onOnZbC//6M7JlXeRfYtMDbQ
	1mydXoUBPozw0wGmN/TqTBXmRNFi31olWN/VSphKA
X-Google-Smtp-Source: AGHT+IEkJnk7rxvUDwmnjsxIVaIihkKiLZa/LqnZZoYebecyAUFl7ic/g/6xyKromkayJnX1wjUy1QQCrJbsURep7Xg=
X-Received: by 2002:a05:6214:418c:b0:6c1:6b5c:4a09 with SMTP id
 6a1803df08f44-6c16dc85988mr69222616d6.31.1724533965722; Sat, 24 Aug 2024
 14:12:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
In-Reply-To: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sun, 25 Aug 2024 02:12:34 +0500
Message-ID: <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
Subject: Re: 6.11/regression/bisected - after commit 1b04dcca4fb1, launching
 some RenPy games causes computer hang
To: Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>, zaeem.mohamed@amd.com, 
	pekka.paalanen@collabora.com, "Wheeler, Daniel" <daniel.wheeler@amd.com>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 11:05=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> Hi,
> After commit 1b04dcca4fb1, launching some RenPy games causes computer han=
g.
> After the hang, even Alt + sysrq + REISUB can't reboot the computer!
> And no trace in the kernel log!
> For demonstration, I'm going to use the game "Find the Orange Narwhal"
> because it is free and has 100% reproducivity for this issue.
> You can find it in the Steam Store:
> https://store.steampowered.com/app/2946010/Find_the_Orange_Narwhal/
> I uploaded demonstration video to youtube: https://youtu.be/yVW6rImRpXw
>
> Unfortunately, I can't check the revert commit 1541d63c5fe2 because of
> conflicts.
>
> mikhail@primary-ws ~/p/g/linux (master)> git reset v6.11-rc1 --hard
> HEAD is now at 8400291e289e Linux 6.11-rc1
>
> mikhail@primary-ws ~/p/g/linux (master)> git revert -n 1b04dcca4fb1
> Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> CONFLICT (content): Merge conflict in
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> CONFLICT (content): Merge conflict in
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> error: could not revert 1b04dcca4fb1... drm/amd/display: Introduce
> overlay cursor mode
> hint: after resolving the conflicts, mark the corrected paths
> hint: with 'git add <paths>' or 'git rm <paths>'
> hint: Disable this message with "git config advice.mergeConflict false"
>
> commit 1b04dcca4fb10dd3834893a60de74edd99f2bfaf
> Author: Leo Li <sunpeng.li@amd.com>
> Date:   Thu Jan 18 16:29:49 2024 -0500
>
>     drm/amd/display: Introduce overlay cursor mode
>
>     [Why]
>
>     DCN is the display hardware for amdgpu. DRM planes are backed by DCN
>     hardware pipes, which carry pixel data from one end (memory), to the
>     other (output encoder).
>
>     Each DCN pipe has the ability to blend in a cursor early on in the
>     pipeline. In other words, there are no dedicated cursor planes in DCN=
,
>     which makes cursor behavior somewhat unintuitive for compositors.
>
>     For example, if the cursor is in RGB format, but the top-most DRM pla=
ne
>     is in YUV format, DCN will not be able to blend them. Because of this=
,
>     amdgpu_dm rejects all configurations where a cursor needs to be enabl=
ed
>     on top of a YUV formatted plane.
>
>     From a compositor's perspective, when computing an allocation for
>     hardware plane offloading, this cursor-on-yuv configuration result in=
 an
>     atomic test failure. Since the failure reason is not obvious at all,
>     compositors will likely fall back to full rendering, which is not ide=
al.
>
>     Instead, amdgpu_dm can try to accommodate the cursor-on-yuv
>     configuration by opportunistically reserving a separate DCN pipe just
>     for the cursor. We can refer to this as "overlay cursor mode". It is
>     contrasted with "native cursor mode", where the native DCN per-pipe
>     cursor is used.
>
>     [How]
>
>     On each crtc, compute whether the cursor plane should be enabled in
>     overlay mode. If it is, mark the CRTC as requesting overlay cursor mo=
de.
>
>     Overlay cursor should be enabled whenever there exists a underlying
>     plane that has YUV format, or is scaled differently than the cursor. =
It
>     should also be enabled if there is no underlying plane, or if underly=
ing
>     planes do not cover the entire CRTC.
>
>     During DC validation, attempt to enable a separate DCN pipe for the
>     cursor if it's in overlay mode. If that fails, or if no overlay mode =
is
>     requested, then fallback to native mode.
>
>     v2:
>     * Update commit message for when overlay cursor should be enabled
>     * Also consider scale and no-underlying-plane case (cursor on crtc bg=
)
>     * Consider all underlying planes when determinig overlay/native, not
>       just the plane immediately beneath the cursor, as it may not cover =
the
>       entire CRTC.
>     * Fix typo s/decending/descending/
>     * Force native cursor on pre-DCN hardware
>
>     Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>     Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
>     Signed-off-by: Leo Li <sunpeng.li@amd.com>
>     Acked-by: Harry Wentland <harry.wentland@amd.com>
>     Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>     Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c       | 490
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------=
--------------------------
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h       |   7 +++
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c  |   1 +
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c |  13 ++++-
>  4 files changed, 389 insertions(+), 122 deletions(-)
>
>
> My hardware specs are: https://linux-hardware.org/?probe=3D61bd7390a9
>
> Leo, can you look into it, please?
>

Hi,
Is anyone trying to look into it?
I continue to reproduce this issue on fresh kernel builds 6.11-rc4+.
In addition to the RenPy engine, the problem also reproduces on games
from Ubisoft, such as Far Cry 4.
A very important note that I missed in the first message.
To reproduce the problem, you need to enable scaling in Gnome for
HiDPI monitors.
I am using 4K resolution with 200% of fractional scaling.

--=20
Best Regards,
Mike Gavrilov.
