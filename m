Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98443D9548
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 07:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334349; cv=none; b=dNngLsxICGkWArRcE5KpTWjOqJExoUS9VDuDLTF9dubFVuSNNOWOMVRHoKTmAT3ZF1AA5YO370eeIUR/tehDbXaJzqbPLz0/1ll76wPaa0WQiRMAP3w+EvF0BjOKJ6AO2Ru7A6qD7aT9Qba2k0Gx7VInB6Gj8VQSsQnQeaIe6/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334349; c=relaxed/simple;
	bh=EsFRe0/YCrGlhOuJkUDE0NMpgESaksOkFsLf5XDmJ/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZOZQvCrAkRnbfLeP098u6aSvlrN5Nex4fQtE+ouaJp/pTPBYk1CPbo0UezYaqIVmrjX+phZHIdUlGTKnx0K/X+JjpDDOrIOSwx9zKhpsq6yPKNI3aly+kyj6sEP5vpVqjsJQ1t0qiQCjF56SZmamYH+9WFNJrLgtaGyvBIkzbGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlPnri2E; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlPnri2E"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c250c6a6a9aso100151466b.1
        for <regressions@lists.linux.dev>; Wed, 02 Sep 2026 00:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334346; x=1788939146; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntYqCiUGvFKb34I7pd2sH6Ev2OxM+HRkEJ74Nxn2uc0=;
        b=RlPnri2ECvbfhjrbuI4nmTC2JH4GHtpKhe4FcQS3lGDvdezuOakoxIDTIvJvpwrNOK
         JdGpouq7KIkIq77IYr4JqvBl1PDTU3WvUkiHIxy8Y20skRVHhBZ+/nmwb2U33Q5Reh08
         8CkunhnYqAkpakBw1eqgEPPR3snIe1JMeGj7DoHkBUkAqgx6Rf6cOjqHg1j66BQzp3oV
         SC9dQ2oQX6dY1xmTyjHelvhFBAt3pREXAf/fdM0eadQA4qaIbKlKJCubFaeCwpacMSL1
         2SK8imuS3ir+B2ck3GHFN/7o9o2lYhS2jLlBTxa1/JZ+p92ECcLX5c1wb2guKF4l+dfX
         i7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334346; x=1788939146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ntYqCiUGvFKb34I7pd2sH6Ev2OxM+HRkEJ74Nxn2uc0=;
        b=dllz61ZUXHrc2OS9o1uY9/mixlX0kInSdTuw1ALiy7ODbrZqi2RRxEN2tCaD4dPngb
         AjFW2thBd7Vpu2l285f5OzOZBpPP51CXv5BEHhpV0O0ccklnVSC323lkETKJBwo4Btdv
         FU/WMYwXVzzBTp3YNxOKKBLYWOpRoCIcICFc0DrgUYQTE6ahilo5/cxxWx1VbCyUGILa
         xfRXdfMAI/k+PBBDxTdOXotwoFtNVjXR8SSloPSdMl+Sw7aippiwCdvrNsX+hJGbyCtA
         EjuLofbe0MbjPPKhxvsOC4Y/MYCqMqQcNxiRmdsKgmgGKsr31yvVNVW2Du65NBijxDR3
         P4iA==
X-Forwarded-Encrypted: i=1; AKwUvBz58kcsVqYe0i3D8xo+emavE0zADiqGQB5o+kkWTPWkBitOvG/SL8KFUFTIpu63W86WSVYflNwFxYKfKA==@lists.linux.dev
X-Gm-Message-State: AFuF++nG8TnKh3FXyipdE7P2FsXvsBUMie4q9yqs4QvXy7H/s+udB/PG
	M4L6563NcYI1sTQ+Q945JSmiXqd9nVbSNPYTsfLgAj72/IBP45uVnm4j
X-Gm-Gg: AYBFou0ziem6g+Vxq52E+cahj5QUuBazt8joDUHVMIti04Nw0UpyiUPFzaghToNvio/
	kLAWZ1aN9FmNtQdUrCSL6PVyiVYj8qwbDCgTRBsx6IdpSVawXGCh+xRinps053Zxd6jiLtAk4Vw
	LXv3DL3SRZrPdWMnoXdapxI2Xs10vV52HIFBrQhNg1yS+KqdPYJ+DN6Aj+LuwVB90ub/PctsRkU
	G0R8THQGEKzEuv0zI+k8ity8Gv+v1fBkRijDZ6+C1cRd/dWFC/9VeSgpeztbbbjgNEeDop4ZbU5
	QKLCKcBLHY4nmkNQL7tqVdZfDA/JH40Egdet54ZHocHiGNIyfY52o2LDbe1Zms5l45wDFKnko6h
	AZauRwpPABHHjFQaXLvqmvYTvvavMHkApyfZVZ+6UlgbLnqitBOXpLY2gL8cBHH5M1U57ip6KyR
	TtQXEhn0hKMiquiv7tyYi78Ot5GyinHx2V1UbFWCSq/+h8a59g9zG4S4S5gS6VXnexHNua+fe/B
	DPB2P8XB73mGM1JLBPvOYj13/7UzFuqeuWYP+SlV3o6wP01FdDRtKil3tum
X-Received: by 2002:a17:906:6a03:b0:c24:d6f0:1223 with SMTP id a640c23a62f3a-c25d5474dfdmr140879566b.12.1788334345387;
        Wed, 02 Sep 2026 00:32:25 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d041d286sm78078466b.55.2026.09.02.00.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:32:24 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	George Zhang <george.zhang@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION 7.3] drm/amd/display: single-frame scanout corruption on DCN32 at 120 Hz since a637a140ab86
Date: Wed,  2 Sep 2026 12:32:22 +0500
Message-ID: <20260902073222.206801-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829010525.29935-1-mikhail.v.gavrilov@gmail.com>
References: <20260829010525.29935-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have to correct my own report.

The 90x figure I gave for a637a140ab86 does not hold up.  Since sending it
I have measured five more sessions, and the rate turns out to be controlled
by something other than the kernel.  Please do not spend time on the commit
on the strength of that number.

What the artefact actually does is sit in one of two states, and the state
changes during a session.  All figures are events per 1000 eligible frames,
where an eligible frame is one the detector could have judged - the method
is unchanged from my first mail.

  60 Hz                       0.0000   0.0045   0.0252
  120 Hz, quiet state         0.0308   0.0372   0.0400
  120 Hz, excited state       0.5208   0.5739   0.7115   1.3027   1.9153

The three groups are about a decade apart from each other, and the kernel
does not sort them.  0.0308 is the run on the kernel with a637a140ab86
reverted; 0.0372 and 0.0400 are runs on unreverted kernels in the quiet
state.  Those three are the same measurement.  My original pair simply
caught one kernel quiet and the other excited.

Worse, every kernel comparison I made began with a reboot, and a reboot
resets the state.  So the bisect was measuring how soon after boot I
happened to load the machine.  I no longer consider the attribution to
a637a140ab86 supported, and I cannot say from my data whether this is a
7.3 regression at all.


The two transitions
-------------------

I can now move the artefact in both directions, but only as bundles of
variables - I have not separated what inside each bundle does the work.

Excited by: a long session of a heavy 3D game (Dying Light: The Beast).
Measured twice on the same kernel and refresh rate: 0.0372 -> 1.3027 (35x)
and 0.0400 -> 0.5208 (13x).  The effect outlasts the game by hours and
decays gradually.  That bundle contains sustained shader load, large VRAM
allocation and eviction, GTT traffic, clock and power-state churn, heating,
and fullscreen presentation.

Calmed by: about three hours spent at 60 Hz, after which returning to
120 Hz gave 1.9153 -> 0.0400 (48x), on an unreverted kernel.  That bundle
contains two modesets, three hours of elapsed time, half the pixel clock,
a different pixel encoding (this display uses YCbCr 4:2:0 at 120 Hz and
4:4:4 at 60 Hz), different watermarks, and an idle GPU.

Also calmed by: a reboot.

Which single variable in each bundle matters, I do not know.  A short
120 -> 60 -> 120 toggle would separate "a modeset" from "time at 60 Hz",
and a compute-only load would separate "GPU busy" from "memory pressure".
I am happy to run whichever of those would be most useful.


What did survive
----------------

The dependency on frame rate is unchanged and now rests on four
independent sessions: 120 Hz and 100 Hz show the artefact, 60 Hz is at
least an order of magnitude below the quiet 120 Hz state.  Forcing YCbCr
4:2:0 at 60 Hz, so that the encoding matches 120 Hz, gave 0 events in
1,290,588 eligible frames, so this is frame rate and not chroma
subsampling or link bandwidth.

Swapping the HDMI cable made no difference.

And one negative result that may be the most useful thing in this mail:
DTN snapshots taken seconds after real events in the excited state are
byte-identical to snapshots taken in the quiet state - 195 lines against
195, differing only in the scanout buffer address.  Watermarks, dcfclk,
dispclk, dppclk, fclk, HUBP and OTG underflow, vtotal and the DRR select
bits, DSC, RQ, DLG and TTU are all the same in both states, at a fifty-fold
difference in artefact rate.

So whatever holds this state is not in anything DTN exposes.  Is there
something in DMCUB, in the memory path, or in link state that could persist
across a game, decay over hours, be cleared by a reboot, and leave every
register in the DTN dump identical?  That is the question I am stuck on.

Thorsten: the regzbot entry points at a637a140ab86 on the strength of the
bisect above, which I no longer trust.  I do not know yet whether there is
a regression here at all, so I would rather not close it as invalid; please
handle it however is appropriate for an entry whose attribution has fallen
apart.

The GitLab issue has been updated with the same correction:

  https://gitlab.freedesktop.org/drm/amd/-/work_items/5714

Sorry for the noise on the first pass.

-- 
Thanks,
Mikhail Gavrilov
