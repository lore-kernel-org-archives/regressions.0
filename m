Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6173C26
	for <regressions@lists.linux.dev>; Thu, 22 Sep 2022 13:59:19 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id u19-20020a4a9e93000000b004757198549cso1433952ook.0
        for <regressions@lists.linux.dev>; Thu, 22 Sep 2022 06:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=f+r/iWWqg/HjBpXtLMIVbPF1H3Ic9euNYOnuSgUeQc0=;
        b=ppAdWbIiBCle0dSjFlmHIc2U1m0R4TG6e8vCeMVsy9uv1Qk00JQ9uMRj8r8yfZuOrh
         SgxBNhI/jLnPU2svJbB43SzQs6FLXyP3CAxIYnLh5mmAczjAVbDBywJepqW2SjXqOKig
         dVownBjvgif9imqMykIVnNNSAYqPbOGeBQM6hLqrTO1NC2iW+6MkzZEjSWnRJ8wqwrjz
         OmyFZkNaagQDBwHq+9LNr7s7T8+UqPoxjIipN3yspCnXmcmi1fZDauZPLKk3rG73+mQr
         khrRKPMhTO6nSiuxH5rbnwBzV98xr5bm3Bnwc0PHId/MGCB8qNkUG3Ht/j+/1q2BfFUw
         n6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=f+r/iWWqg/HjBpXtLMIVbPF1H3Ic9euNYOnuSgUeQc0=;
        b=FzOF3N3+cRhejQr2sKZ+YF0kHKCQln8pNApbVb2103Tm8Jt1Gd0rNcuwnggIFujmLY
         1HhMyztVH8l1XOM7UsU/ntmhH1fS3If73z+5aGgzsaAHkvZ4rEHnZjCaKaafJl8D1ZvA
         N3Z70xaaMm350XIchYW+RM6uW6GW6IhyNmjq6ud0GLhn/1tLPTfxDPh1zuFJ2PZUp0+W
         Pizom23WFlzF9fV1hqVAarweK6ZxHxNqs5bb7pNopCjzOblF6I6+MtQXE9/i+BgNIrhE
         8oTKfhsLP5umJvh1MN6abB+8CwRSOQSRLHKy8vNua2sN6kaF/eu7gBprZxfgRPfcOmgJ
         Zyaw==
X-Gm-Message-State: ACrzQf2ZPziAlzmK9SuyQau2khThgvDMOCAk/kD2VorOLGXzOO9mYP2E
	S4ySpxtJsRMVHxLukdurMw5zzqYJpDPnGa6VY7Y=
X-Google-Smtp-Source: AMsMyM7dvRWKL6FLuMMaN8yFT+BqKP2F96+nZ4YounII6s0tMygoeMsJno0WDUcPfTQWXHYEetWPo+JYOh5tK+XVtKE=
X-Received: by 2002:a05:6820:104a:b0:476:36d8:c7a6 with SMTP id
 x10-20020a056820104a00b0047636d8c7a6mr1425208oot.70.1663855158289; Thu, 22
 Sep 2022 06:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c1f8886a-5624-8f49-31b1-e42b6d20dcf5@augustwikerfors.se> <eee82fb8-0fc5-98cb-e630-f86891574f21@leemhuis.info>
In-Reply-To: <eee82fb8-0fc5-98cb-e630-f86891574f21@leemhuis.info>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Sep 2022 09:59:06 -0400
Message-ID: <CADnq5_PRP3ekHPLhdXALxt9GL3aHHZQUw5TNAwm4t+ggimUq7g@mail.gmail.com>
Subject: Re: [REGRESSION] Graphical issues on Lenovo Yoga 7 14ARB7 laptop
 since v6.0-rc1 (bisected)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: August Wikerfors <git@augustwikerfors.se>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 22, 2022 at 8:54 AM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi, this is your Linux kernel regression tracker. Top-posting for once,
> to make this easily accessible to everyone.
>
> @amdgpu developers, what up here? August afaics didn't even get a single
> reply for his report that even identifies the change that's causing the
> problem. We're already late in the development cycle, so it would be
> good if someone could take a closer look into this before it's too late
> for 6.0.

Been a busy week.  Haven't had a chance to look into this yet.  Does
the issue still happen with this patch:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=66f99628eb24409cb8feb5061f78283c8b65f820

Alex

>
> Ciao, Thorsten
>
> #regzbot poke
>
> On 17.09.22 18:57, August Wikerfors wrote:
> > Hi,
> > with every kernel version since v6.0-rc1, including the latest git
> > master, there are constant graphical issues on this laptop, such as
> > heavy stuttering (this is especially noticeable while typing on the
> > keyboard), parts of the screen showing random noise, and the entire
> > desktop environment freezing.
> >
> > I bisected the issue which showed that this is the first bad commit:
> >
> >> commit 7cc191ee7621b7145c6cc9c18a4e1929bb5f136e
> >> Author: Leo Li <sunpeng.li@amd.com>
> >> Date:   Wed Mar 30 12:45:09 2022 -0400
> >>
> >>     drm/amd/display: Implement MPO PSR SU
> >>         [WHY]
> >>         For additional power savings, PSR SU (also referred to as
> >> PSR2) can be
> >>     enabled on eDP panels with PSR SU support.
> >>         PSR2 saves more power compared to PSR1 by allowing more
> >> opportunities
> >>     for the display hardware to be shut down. In comparison to PSR1, Shut
> >>     down can now occur in-between frames, as well as in display regions
> >>     where there is no visible update. In otherwords, it allows for some
> >>     display hw components to be enabled only for a **selectively
> >> updated**
> >>     region of the visible display. Hence PSR SU.
> >>         [HOW]
> >>         To define the SU region, support from the OS is required. OS
> >> needs to
> >>     inform driver of damaged regions that need to be flushed to the eDP
> >>     panel. Today, such support is lacking in most compositors.
> >>         Therefore, an in-between solution is to implement PSR SU for
> >> MPO and
> >>     cursor scenarios. The plane bounds can be used to define the damaged
> >>     region to be flushed to panel. This is achieved by:
> >>         * Leveraging dm_crtc_state->mpo_requested flag to identify
> >> when MPO is
> >>       enabled.
> >>     * If MPO is enabled, only add updated plane bounds to dirty region.
> >>       Determine plane update by either:
> >>         * Existence of drm damaged clips attached to the plane (added
> >> by a
> >>           damage-aware compositor)
> >>         * Change in fb id (flip)
> >>         * Change in plane bounds (position and dimensions)
> >>     * If cursor is enabled, the old_pos and new_pos of cursor plus cursor
> >>       size is used as damaged regions(*).
> >>         (*) Cursor updates follow a different code path through DC.
> >> PSR SU for
> >>     cursor is already implemented in DC, and the only thing required to
> >>     enable is to set DC_PSR_VERSION_SU_1 on the eDP link. See
> >>     dcn10_dmub_update_cursor_data().
> >>         Signed-off-by: Leo Li <sunpeng.li@amd.com>
> >>     Acked-by: Leo Li <sunpeng.li@amd.com>
> >>     Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> >>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > #regzbot introduced: 7cc191ee7621b7145c6cc9c18a4e1929bb5f136e
> >
> > Note that while bisecting I also needed to apply commit
> > 9946e39fe8d0a5da9eb947d8e40a7ef204ba016e as the keyboard doesn't work
> > without it.
> >
> > Laptop model: Lenovo Yoga 7 14ARB7
> > CPU: AMD Ryzen 5 6600U
> > Kernel config:
> > https://raw.githubusercontent.com/archlinux/svntogit-packages/aa564cf7088b1d834ef4cda9cb48ff0283fde5c5/trunk/config
> > Distribution: Arch Linux
> > Desktop environment: KDE Plasma 5.25.5
> >
> > lspci:
> >> $ lspci -nn
> >> 00:00.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:14b5] (rev 01)
> >> 00:00.2 IOMMU [0806]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:14b6]
> >> 00:01.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:14b7] (rev 01)
> >> 00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:14b7] (rev 01)
> >> 00:02.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:14ba]
> >> 00:02.4 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:14ba]
> >> 00:02.5 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:14ba]
> >> 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:14b7] (rev 01)
> >> 00:03.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:14cd]
> >> 00:04.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:14b7] (rev 01)
> >> 00:08.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:14b7] (rev 01)
> >> 00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:14b9] (rev 10)
> >> 00:08.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:14b9] (rev 10)
> >> 00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus
> >> Controller [1022:790b] (rev 71)
> >> 00:14.3 ISA bridge [0601]: Advanced Micro Devices, Inc. [AMD] FCH LPC
> >> Bridge [1022:790e] (rev 51)
> >> 00:18.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:1679]
> >> 00:18.1 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:167a]
> >> 00:18.2 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:167b]
> >> 00:18.3 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:167c]
> >> 00:18.4 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:167d]
> >> 00:18.5 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:167e]
> >> 00:18.6 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:167f]
> >> 00:18.7 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device
> >> [1022:1680]
> >> 01:00.0 Network controller [0280]: MEDIATEK Corp. MT7922 802.11ax PCI
> >> Express Wireless Network Adapter [14c3:0616]
> >> 02:00.0 Non-Volatile memory controller [0108]: Samsung Electronics Co
> >> Ltd Device [144d:a80b] (rev 02)
> >> 03:00.0 SD Host controller [0805]: O2 Micro, Inc. SD/MMC Card Reader
> >> Controller [1217:8621] (rev 01)
> >> 33:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
> >> [AMD/ATI] Rembrandt [Radeon 680M] [1002:1681] (rev c2)
> >> 33:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI]
> >> Rembrandt Radeon High Definition Audio Controller [1002:1640]
> >> 33:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc.
> >> [AMD] VanGogh PSP/CCP [1022:1649]
> >> 33:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
> >> Device [1022:161d]
> >> 33:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
> >> Device [1022:161e]
> >> 33:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc.
> >> [AMD] ACP/ACP3X/ACP6x Audio Coprocessor [1022:15e2] (rev 60)
> >> 33:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Family
> >> 17h/19h HD Audio Controller [1022:15e3]
> >> 34:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
> >> Device [1022:161f]
> >> 34:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
> >> Device [1022:15d6]
> >> 34:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
> >> Device [1022:15d7]
> >> 34:00.5 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
> >> Device [1022:162e]
> >
> >
