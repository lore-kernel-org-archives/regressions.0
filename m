Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06F33976B8
	for <regressions@lists.linux.dev>; Sat, 29 Aug 2026 01:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787965532; cv=none; b=gVbdAKzN5zc2AmeQ7l1gti+gWCwAedtAd/qVwuG8FpQbtLIImUM3e/V2Due5hxoAY27MyH5h4JhewWlnOfRO7HKnDULLKpIJWG9MLwvztSbcyLUKP9TbJO9DzqT7x+yTsOkpJOJZ/sSHFASw5X+Uwd3a5FjRNOvyRr1RXZkFH3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787965532; c=relaxed/simple;
	bh=FmvFQBzyHnAFK6uP90mZaFcbdD8qlhovGSeYZYah9VE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U7refQYoPP7khISLWqiRhWrixZZ83syiD4IcFFsQI14kzyUurRtxgc5kPNeh02yzSm+J2HUEbjkFJQE4E4PQEVGKFRsDKS3XYf7kgS9DUqsRxWSfHZIuM4BECI/n24phwZTaAOytiqnSdHEkxQJHqoolmSfYWSpz7TbUYxU8SVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjsQDqpu; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjsQDqpu"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2020421077so234471566b.3
        for <regressions@lists.linux.dev>; Fri, 28 Aug 2026 18:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787965529; x=1788570329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zA5kSADrAaVAB+/2hR/f9WTYy/x0O4VhWpKvkd8WRIQ=;
        b=pjsQDqpuZ7F/mHJzDc35lXdLIiK8bUkyWFxR7FKZXzJ1Uj/WdYAscd5XErPvVWJz9E
         jEOOO9YRxchmTXacMQhXNFicWbTzn3TOELrvtehr0A3rKGT7a8LtMTiSElsFvIlH+zkg
         /uhSSr5g4ZPKIXIs8lLwRK86zf15m42Fjw+Nt4aDTmGwPHXKmwUqiev4DpMiCpMTc154
         hSh/OsPfYPiSU9cTURf59qotLj5gPJdIil33GmGtderau/8TjghXXO4KHsDEvhnKJXiI
         I8p1Wo8OnLXzNPCudhZK1475pHRwD2i78wQJt7XvU+MIJOaUSlZx+wDZ/1BijO51RDBk
         7ZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787965529; x=1788570329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zA5kSADrAaVAB+/2hR/f9WTYy/x0O4VhWpKvkd8WRIQ=;
        b=nl0dZPcAJk5GJ+kTXnSfXNNkoP5XBOozYjyNnubKaoG+IO+CNxzYJ9Lu079Sk20mJV
         k5QTry/ixWc/7MxY0PkbQ089MRBG0pcLASqNUwBs7L1K6ZToTNwfCa90sgbImx5cyqfK
         oZNIwGA40VQE9Fe+5+/g1QGClTZEfFZ74JjrrVChnk/qq6Lxp8cutt6mj+pJPr4zLSyJ
         kqWmA5u4jPFQwhoWvzs3un/CnU/sUWPB9slBbYkCwHy5hg4scEn92yaOZQReiUOkShRy
         1eNcLUrkhGpnI4wG0NqF9k6MAPnfeCovEpKVWQ0H33jdVfrS66u0CKsENMT6tDm+Mfd1
         ztuA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/De3DpEBNMM3ajwDHPhitT2Jn3p3q8ch2Cj0KE4MB8SzBVtB4FHrzuX5zK/xixO1Sy5iWyqoENrz1WA==@lists.linux.dev
X-Gm-Message-State: AFuF++khi+DM+g/mzlygBLvjVwkaEy5scyAkXV9uZSEdHDDwiHUYEGQO
	LJBDXrcMADS92TQQeMG72iggLFRLZz+dpWw692MGuOWbu1hi4TzK+blR
X-Gm-Gg: AR+sD1210dJ3uJmtAEyzJe3Q+kIHeGKJaGRhy2qn0ROfrFv2l+AByq8RkX7zF44j9we
	oxHCcLTj5tzoL/DRD0dJjimPrOjnlNauvdrSSUb/W07HqAOtU82CCPEFt+Qcj3hMI5x0F0TJuC7
	aDODRhhv06/SQAvOcc6AU18G+P5vv/lqgUiPYN4C3wkQ6C+1EjuNM3UIlPxnAN4Y8wEwpdJ3scp
	QuI+rkVYj1FtS7BavbtiwBMT/jKgjFUwtkYi5iEBhK9wbFytXwAgJ72ox//nTNIWX+gD51DNQPU
	rem0rN/p4H8Eu4z1GEIowBjCPmrH19O++qn2vhAAIcKgHsDhSakWGVi8yQdNd3lHL0uwZ/94l3V
	FyLb6dPc8ucbkdCX0n+bfzGutFOXJpxvzUJgq+bgbibw24U8CudEUo3IGYdTswXdL9T1JckR5cp
	VMgun2keQmrAmHqn7zuVwNCebQPt40El2350yE4RC4fNjWjLlxv1eBNJoZrM7Rxq9cYhKDvgpgu
	OuhXtM+EVjfrDC1umSZ+XMYGsn/gTqOIk2vi+BBDhHENZGgf2zncfdoA7OS
X-Received: by 2002:a17:907:94c1:b0:c25:6230:dfcd with SMTP id a640c23a62f3a-c256230e4d2mr524252866b.15.1787965528961;
        Fri, 28 Aug 2026 18:05:28 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b28ebsm141649666b.29.2026.08.28.18.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 18:05:28 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	George Zhang <george.zhang@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION 7.3] drm/amd/display: single-frame scanout corruption on DCN32 at 120 Hz since a637a140ab86
Date: Sat, 29 Aug 2026 06:05:25 +0500
Message-ID: <20260829010525.29935-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Since the 7.3 merge window my desktop shows a band of pixel noise flashing
across the screen at random on a 3840x2160@120 display driven by an
RX 7900 XTX (Navi 31, DCN32).  Each occurrence lasts exactly one frame -
8.3 ms - which is why it reads as a flicker rather than as corruption.  It
is frequent enough to be painful to look at during ordinary work.

The band is not new.  It existed before, rarely enough to ignore, and back
then a modeset (switching to 60 Hz and back) cleared it for a while.  What
changed this merge window is that it became roughly two orders of magnitude
more frequent, and the modeset workaround stopped helping.

What I would like is help finding the underlying bug.  I am not asking for a
revert: reverting the commit below does not fix the artefact, it only takes
the rate back down to what it was before.  I could not work out how the
commit leads to the symptom, so most of this mail is measurements and a list
of mechanisms I was able to rule out.

A photo of the screen, taken with a phone because the artefact never appears
in a screenshot:

  https://gitlab.freedesktop.org/drm/amd/-/work_items/5714


Measuring it
------------

The artefact is invisible to screen capture but visible to the CRTC CRC
engine.  A frame in which it occurs has a CRC triple that differs from its
neighbours while the neighbours are byte-identical to each other: displayed
content did not change, but one scanned-out frame did.  A torn readback
cannot produce that, because inside such a window the adjacent frames are
identical and there is nothing to mix.

The colour band moves all three CRC registers.  Single-frame content
flicker in grey areas moves only CRC1 (Y), because on this YCbCr link the
chroma of an achromatic region is unchanged.  That gives a built-in control:
the CRC1-only population is content, not corruption, and its rate should not
depend on the kernel.

All figures below are per *eligible* frame - frames where the quiet window
existed - so runs against differently busy screens stay comparable.


The regression
--------------

I bisected the change in frequency to

  commit a637a140ab86 ("drm/amd/display: Allocate DCN32/1 dmub memory to GTT")

Each bisect step was judged by eye over a kernel build's worth of ordinary
desktop use at 120 Hz.  That is a weak criterion for a probabilistic bug, so
I re-tested the endpoints with the CRC detector instead.  Both runs were
ordinary desktop work, same machine, same display, no modeset before either
run:

                              a637a140ab86      a637a140ab86
                                reverted           present
  observation                    8.06 h            6.43 h
  eligible frames              1,621,663         1,382,934
  events, all three CRCs              12               924
    per 1000 eligible               0.0074            0.6681
  events, CRC1 only (control)         30                32
    per 1000 eligible               0.0185            0.0231

The artefact signature is 90x more frequent.  The content-flicker control is
flat at 1.25x, so the detector, the screen activity and the sensitivity were
comparable across the two runs.

The composition changes too: with the commit reverted, 24% of detected
events are all-three; with it present, 94% are.


Refresh rate
------------

  4K120, YCbCr 4:2:0, 8 bpc, TMDS 594 MHz   artefact present
  4K100, YCbCr 4:2:0, 8 bpc, TMDS 495 MHz   artefact present
  4K60,  YCbCr 4:4:4, 8 bpc, TMDS 594 MHz   0 events in 70,691 eligible
  4K60,  YCbCr 4:2:0, 12 bpc (forced)       0 events in 1,290,588 eligible

The last row was measured with force_yuv_pixel_format=4 to separate refresh
rate from chroma subsampling, since the two change together on this display.
At 60 Hz with the same 4:2:0 encoding that shows the artefact at 120 Hz,
1.29 million eligible frames produced nothing.  Link bandwidth is not the
variable either: 594 MHz appears in a configuration that shows the artefact
and in one that does not.

So the dependency is on frame rate.


What I could rule out
---------------------

Twenty DTN snapshots taken within seconds of confirmed events, on the kernel
with the commit reverted:

  - HUBP underflow and OTG underflow read 0 in all twenty.
  - dcfclk, dispclk, dppclk and fclk are identical in all twenty; no clock
    transition happens near an event.
  - vmax = vmin = 2249 with both select bits set, in all twenty: DRR is armed
    but pinned to nominal, so no vblank stretching is available.
  - The watermark sets, including dram_clk_change, are identical throughout.

Caveat: the snapshots are taken seconds after the event, so a momentary
transition would be missed.  But vmax = vmin and the identical watermark
sets are configuration, not instantaneous state.

Reading the commit, the buffer is pinned by amdgpu_bo_create_kernel(), so
TTM eviction is not a factor either.  What the commit moves out of VRAM is
every DMUB FB window at once - instruction constants, stack, BSS data,
VBIOS, mailbox, trace buffer, firmware state, scratch, IB, shared state,
LSDMA buffer and cursor offload.  I do not know how that leads to a single
corrupted scanout frame; that is the part I am hoping someone from DC can
see.

Two details from the diff that I am not able to judge myself.

AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS is still set unconditionally in
amdgpu_bo_create_reserved(), and with the domain now GTT-only it no longer
does anything.

The commit immediately before this one in the same file is 5b69770e945c
("drm/amd/display: Generalize DMUB memory flushes from host"), which adds a
dmub_srv context parameter to the flush helper; the Linux implementation
still ignores it and remains the generic read-back loop. That helper is
called on scratch_mem_fb, on ib_mem_gart and on inst_fb during backdoor
load. Before a637a140ab86 the remaining windows sat in VRAM; now all twelve
are in system memory. Is that flush coverage still sufficient for the
windows that moved? I am asking, not claiming - I do not know the coherency
model for these buffers well enough to say.

The commit's own comment says the restriction to DCN32/321 is temporary and
that it will be made general to other dGPUs later, which is why I would
rather this were understood before it spreads.


Configuration
-------------

  GPU        : AMD Radeon RX 7900 XTX (Navi 31, DCN32), 1002:744c rev c8
  iGPU       : Raphael 1002:164e, bound to amdgpu, drives no display
  Board      : ASUS ROG STRIX B650E-I GAMING WIFI, BIOS 3854 04/03/2026
  CPU        : AMD Ryzen 9 7950X
  Display    : LG OLED42C3 (42" OLED TV), HDMI, 3840x2160@120
  Timing     : 3840 4016 4104 4400  2160 2168 2178 2250, 1188000 kHz
  Encoding   : YCbCr 4:2:0 8 bpc at 120/100 Hz, YCbCr 4:4:4 8 bpc at 60 Hz
  FreeSync   : enabled, range 40-120, reported FIXED by the display
  DSC        : off
  Kernel     : 7.2.0-66498c75b4f8-with-fixes-v1-m62-quirk+
  Userspace  : Fedora Rawhide, GNOME on Wayland

The kernel is tainted W: opening the CRTC CRC debugfs file triggers a
WARN in dc_helper.c on DCN32.  That is a separate bug in the same merge
window, with a patch already posted:

  https://lore.kernel.org/all/20260829004608.25252-1-mikhail.v.gavrilov@gmail.com/

It does not affect CRC0, which is what the measurements above use.

Both the capture tool and the raw logs are available if they would help.

Thanks,
Mikhail Gavrilov

#regzbot introduced: a637a140ab86
#regzbot title: drm/amd/display: single-frame scanout corruption on DCN32 at 120 Hz
#regzbot link: https://gitlab.freedesktop.org/drm/amd/-/work_items/5714
