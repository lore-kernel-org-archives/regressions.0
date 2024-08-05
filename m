Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F50166F2A
	for <regressions@lists.linux.dev>; Mon,  5 Aug 2024 18:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722881168; cv=none; b=FXQNbJSHIc+l6scGAlMtFq4bb2iMoIwcyJGNbB+g+kcrD3FMwcUKoWDeIaJN8MI1AOH+XBQnaXZrOywrgjFBHht0BlnxMuR3bQYwA8lPzqIdFu0IZ0/Q0xv096mNgQQIxJ1s0fy5r6R96ojnRPhm2uMK9ZQITIFVpqM9HrDrZv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722881168; c=relaxed/simple;
	bh=DA0IF92YfHjnqqJxGrNAM6BWKAVNT+Hl0w4R389/7P4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=A73fghyXo2+Bi+/UyPVtXL3uitMe20DLK73K7B3lzFJrSUnGSd51Ww3rIfVFJ6DGDuKvlsbIYwCKMnPbC6oDZu41tys2MhV2KbL0SxPpXS0LjEcvt5EuMOi9mPhfLlncQwQFzr4jl4M0lRrObLbClm5QcvIiUbTAiLyJo7XRYyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6UE8as8; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6UE8as8"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6b96a253c59so16576766d6.3
        for <regressions@lists.linux.dev>; Mon, 05 Aug 2024 11:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722881166; x=1723485966; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tuNc5ijq2sTTz1aoHY//bl29OA01mR9/Gm1Cm8jhEsw=;
        b=S6UE8as8KDNcpRq7w6gVpCnky0CCYpOAl5wYix+RN3L+vJy5inIKgqe0pGkrqQ8Od0
         o+Zi/4wjF1I6hvkdeIXC+vy+eeynGbmbJFFb24/GMF9yO5eiiCBtx0WqYOeFZXm5szXg
         9tJR7WEGmAOCH6+oUlwfa+0TndRifX/eYA/l/63X5rQsBGbdQlL/G7ZyfrBY22hukwKx
         3ybxv8tfIp41fEBluDcLD50qfee7wnEW8jmc3qgnzsxCMmB7UfE7Nqvo9ySQgcRzP/O7
         adBir4JnL3VMrZIoSRcx2+aOCUvpwR2xQLKSX2PYHRzSpGUR11UNJS1yTkWCTkMpCTHT
         qnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722881166; x=1723485966;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tuNc5ijq2sTTz1aoHY//bl29OA01mR9/Gm1Cm8jhEsw=;
        b=si2lLB7euNwxrxFeWgwmF6XrEb+j7RB+9a8kjNVNYg+rVU0t1IlIvlyEMvsRWaXdUZ
         zbC1PJ2n+S7KuAFxEbJiwHHU+XbPGR9W513o3KDNLCQCwwBF3HKZbEIQ2ChLS0acceqR
         vKiXoVgJ3fNKU3bnGN1OysirMmAzBFKrHIWjt/cpLNqK6DGsTm1Et76ZflovwkHaPrvf
         OQMBPYc+rL/Exgwm+mlzUHxFX65rQcipph0s1IJVYdq0Ly+z2YxDo/JI/++mPMnvZ1Ez
         xfKV3loDb6BuWiBiahHvQAb43ssS67hbluzAe8al4pvkwY3DFF7XpQ2a72gUwXHvgNxc
         jFZw==
X-Forwarded-Encrypted: i=1; AJvYcCUFJm2ElhoAoTdV4XPzIYRe4jbYqvjoEQfynr1KE99frnxUkseCjrvh0hud+acpy1DBIr5oMU8c52e4wg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLz1bKqIu05qaZDGNVWMdy3QdYHEW26aFyvTysLxiFS8LzK6YQ
	oMPrnAM/CKiw/+69ML+OPIglmA92sKGkc7WYBO7nrOh+Z/bvlq/dUcMuVIM2yvPFLstKg2H0es3
	V3GvkuQAhsD8JNwIQNfHgNINqh90=
X-Google-Smtp-Source: AGHT+IGtKXbr3WIUYML88AgClVnUEVd5wqOjwXLwGek75xH0mlYxuRzER9nHua9J6rDEejJ+C1ibj9q/0xMMTRAjZOQ=
X-Received: by 2002:a05:6214:e64:b0:6b0:8202:5c4e with SMTP id
 6a1803df08f44-6bb983f0fa6mr98122976d6.5.1722881165875; Mon, 05 Aug 2024
 11:06:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 5 Aug 2024 23:05:54 +0500
Message-ID: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
Subject: 6.11/regression/bisected - after commit 1b04dcca4fb1, launching some
 RenPy games causes computer hang
To: Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>, zaeem.mohamed@amd.com, 
	pekka.paalanen@collabora.com, "Wheeler, Daniel" <daniel.wheeler@amd.com>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi,
After commit 1b04dcca4fb1, launching some RenPy games causes computer hang.
After the hang, even Alt + sysrq + REISUB can't reboot the computer!
And no trace in the kernel log!
For demonstration, I'm going to use the game "Find the Orange Narwhal"
because it is free and has 100% reproducivity for this issue.
You can find it in the Steam Store:
https://store.steampowered.com/app/2946010/Find_the_Orange_Narwhal/
I uploaded demonstration video to youtube: https://youtu.be/yVW6rImRpXw

Unfortunately, I can't check the revert commit 1541d63c5fe2 because of
conflicts.

mikhail@primary-ws ~/p/g/linux (master)> git reset v6.11-rc1 --hard
HEAD is now at 8400291e289e Linux 6.11-rc1

mikhail@primary-ws ~/p/g/linux (master)> git revert -n 1b04dcca4fb1
Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
CONFLICT (content): Merge conflict in
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
CONFLICT (content): Merge conflict in
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
error: could not revert 1b04dcca4fb1... drm/amd/display: Introduce
overlay cursor mode
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' or 'git rm <paths>'
hint: Disable this message with "git config advice.mergeConflict false"

commit 1b04dcca4fb10dd3834893a60de74edd99f2bfaf
Author: Leo Li <sunpeng.li@amd.com>
Date:   Thu Jan 18 16:29:49 2024 -0500

    drm/amd/display: Introduce overlay cursor mode

    [Why]

    DCN is the display hardware for amdgpu. DRM planes are backed by DCN
    hardware pipes, which carry pixel data from one end (memory), to the
    other (output encoder).

    Each DCN pipe has the ability to blend in a cursor early on in the
    pipeline. In other words, there are no dedicated cursor planes in DCN,
    which makes cursor behavior somewhat unintuitive for compositors.

    For example, if the cursor is in RGB format, but the top-most DRM plane
    is in YUV format, DCN will not be able to blend them. Because of this,
    amdgpu_dm rejects all configurations where a cursor needs to be enabled
    on top of a YUV formatted plane.

    From a compositor's perspective, when computing an allocation for
    hardware plane offloading, this cursor-on-yuv configuration result in an
    atomic test failure. Since the failure reason is not obvious at all,
    compositors will likely fall back to full rendering, which is not ideal.

    Instead, amdgpu_dm can try to accommodate the cursor-on-yuv
    configuration by opportunistically reserving a separate DCN pipe just
    for the cursor. We can refer to this as "overlay cursor mode". It is
    contrasted with "native cursor mode", where the native DCN per-pipe
    cursor is used.

    [How]

    On each crtc, compute whether the cursor plane should be enabled in
    overlay mode. If it is, mark the CRTC as requesting overlay cursor mode.

    Overlay cursor should be enabled whenever there exists a underlying
    plane that has YUV format, or is scaled differently than the cursor. It
    should also be enabled if there is no underlying plane, or if underlying
    planes do not cover the entire CRTC.

    During DC validation, attempt to enable a separate DCN pipe for the
    cursor if it's in overlay mode. If that fails, or if no overlay mode is
    requested, then fallback to native mode.

    v2:
    * Update commit message for when overlay cursor should be enabled
    * Also consider scale and no-underlying-plane case (cursor on crtc bg)
    * Consider all underlying planes when determinig overlay/native, not
      just the plane immediately beneath the cursor, as it may not cover the
      entire CRTC.
    * Fix typo s/decending/descending/
    * Force native cursor on pre-DCN hardware

    Reviewed-by: Harry Wentland <harry.wentland@amd.com>
    Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
    Signed-off-by: Leo Li <sunpeng.li@amd.com>
    Acked-by: Harry Wentland <harry.wentland@amd.com>
    Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
    Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c       | 490
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h       |   7 +++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c  |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c |  13 ++++-
 4 files changed, 389 insertions(+), 122 deletions(-)


My hardware specs are: https://linux-hardware.org/?probe=61bd7390a9

Leo, can you look into it, please?

-- 
Best Regards,
Mike Gavrilov.
