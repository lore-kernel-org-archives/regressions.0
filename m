Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026313E3D89
	for <regressions@lists.linux.dev>; Fri, 14 Aug 2026 21:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786741972; cv=pass; b=aG+XeAiKBdIFP4qA0O55ecsZbUSM8ZhGpWgq6/6qyXVLAgbViCdHcBOJJjoiyX0L1OHOyDnklrt9yezvQc6fWKrxZt3BBirhhmEHkS9dDUiSFI9KNDDFopH7OKYyhE2yjbAYpfBpbo23see5dd4kSpJj4a5jz06Z5XbOmlYeOaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786741972; c=relaxed/simple;
	bh=DRei2+deSPVy+InZVMN1mkoYxthiUeHYLiILPMCQGwE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Zw/g/KArNNqYJtSyrbRE/EpwFeYiqNpNQQ9VaQrdVv1fTPaXk88SBeBfljGNEQMs23c7HiOKrYb/w0DX/8jyC9XDs+kAxDrFz0WhUr7L+WkPXt7q9I1Ps3eal1WtZ9kX+b4jWMb/PGuyKXstczjAaSkDnVBOVQCN3oc7+OXjykc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoQlMHtk; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoQlMHtk"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aea0fff535so1502863e87.3
        for <regressions@lists.linux.dev>; Fri, 14 Aug 2026 14:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786741968; cv=none;
        d=google.com; s=arc-20260327;
        b=kbA51EJxucuY09yVG7/ke9tUcMv2TTA5wXrfpoTXkirHG6SOHqq6dACSJZfjPPu1C5
         VCmu3vZ5yFIi6ozfnHS37aOfV5wpI7qKtozUxo3u6GclLHaH2BEuc1RUF3VX3yWHBOes
         Ly6jSkHyNivqqL/G9vHJFJlQ1gRJch4vIgnuLclhu+q18OHjLObVRUEiUumoZEzrZZXJ
         uPKABBAR9qN9c89cRuiGmYuXUjrreJWc/3W0md4wdiU4TZjBs8JsurVTjEdYt5MK9zmJ
         uhrwv49+1vtjbvunn/jzKV7E0utpSDQrzlcHhqTIaLwBNHyKpv8d+KGlXebOqz2tFes7
         HxBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=suChiBpI2zM7Kh/sweI6ufJ0V5/AtIy5NrlliylEVCA=;
        fh=viYctKh7PqkvwL46c21HadswgHaaI/YS2qiqCtqKAq0=;
        b=mME30xaXsUCEPkj0mHo2J2EZVtEFZ8OHH5K4N1ic1vcSYiklDxO+ZdDlLVNEeHn/0a
         rs+7m6GkCi5Ns+EBlc+N7NSIJOivB9gjMkN7zgpkcXW2yjm/Bg3Vu034hRhQ1lrjRrHz
         5FBQQxWGqeHrwxQ0ipaYuqvJn+kqYl1vJwCRUepkhPQu8zvltNT9ob507CjEHjxDcrZq
         iUDDzcxek7mXKUQWngW12c25oYfhVlAvZEYBZIaBideUeiZHCWPP1j6PyR3h8x5kBpMi
         ZcX+G7cgNMbVO5rxpjttlnEksY1wFHuw6Exb5PFWxynvSdx6NsolOidI0pbor9VbvZIB
         Qh1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786741968; x=1787346768; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=suChiBpI2zM7Kh/sweI6ufJ0V5/AtIy5NrlliylEVCA=;
        b=GoQlMHtkjX0v0xBOtbBm16rXky7YL0v/FOcOlGs+SDb8adOvweN44jgXjCUyb2f5If
         DIXYcWVWHgdN2Zf3Rf5e2kth8yZ04jqs8sJUH1tshKvPJtKh7WevqExFT1ZU+FkMtin0
         EWlNZqS+6Os0bQB9kOveTRUPetHhsyAIeW2fqD2MRoYgQzf9l3F6HYTw6GEkJqymIo21
         JaXQgu/u3Cf1Zo1vWarke9Zly+8uUmNdZlEDIqXqJqijjOwsCPzAzLTc//WGVAK/0qUl
         YwaAfSLDTSzAlerISj3XRsCt6P31LRDfZqZeA+t/hQoqSAO7fpPzqY2UTEaWoJsEZ0wi
         i/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786741968; x=1787346768;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=suChiBpI2zM7Kh/sweI6ufJ0V5/AtIy5NrlliylEVCA=;
        b=aLsz3fCa/XCFJpMaj8jzFbpp5IqezhnXkIEVzRNX0pdLEYd3VQBV/Si/67o5Kwe1cH
         EE1AIjynAQk183bTH+iOpHPGVOLJ+A6ULuAvczXcclKiqXxHC/FdUIv0mVeocRKf+pK1
         Xq12XpfEyTfiBh071RNV6O4AQtZaQCO/DBJUYH20wClY7OG408A9oj1A2uzu76MZ+anc
         Yz78CUq8jHWyZK/lPSlUpDrhzjfBhBsdnu3GEd6H0wJwuse/663xk/4SO3wOxNswOM/+
         2dQCaBP0L7/pNN6HbezdEO8j2uNXYRoTH8Yt33IVuau7I4P8FBtCUmZIWCsH9iS1brrk
         G4Ww==
X-Gm-Message-State: AOJu0YzFqqCGfeHZb5WTMwngRXanMHjWlwWjNNU4+cDJ7gQk2T2bTMXH
	EVJdbD7Bnh6E9hTCt1kP0tmtA6lFo4JXT1xsHYOtgnRLtsouuKBV1DbdNQn4TpnE/Li5x2IN6ah
	/y+bxuos2DEyKeSYJkFkoS2S8LCQWAXY=
X-Gm-Gg: AR+sD12mw1OMMl3xpTnXz8lM/C14v6ZqQKNAQyGcGGYqMoa/re24F+yMZ5rcxwTcArt
	JK/hbev9GBXTgAeG7jgzHNMtZPN3c7vx2lcM20X6i2zNNvtHXl8VwflNFsZCLshcv+lUi2dFPUI
	rLzgZaO9w4pQ75G2x8+mlMHb6sA1wcDBmR7ewfM4JaoJGa6Mk6dUKDpX0Qdy9wp2FdUuVFvyrCV
	IbNcnYkoqAUf+f1GQRXUh+xcDAo6qZYb+iYo13f+XKMDbvkkpZjmYTkgG/rgzGKSuH3D31fmm8O
	LK3erVhu1Wrksu111TikTjn95Z2JJhKTM1H0LXahlOfm
X-Received: by 2002:a05:6512:6681:20b0:5b3:f69:fef7 with SMTP id
 2adb3069b0e04-5b459154ac0mr885241e87.4.1786741967554; Fri, 14 Aug 2026
 14:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Martin King <martin3kx@gmail.com>
Date: Fri, 14 Aug 2026 16:12:35 -0500
X-Gm-Features: AUfX_mwPwIqgYkjCpI0inF8DAyhP-Non2hPQrAzUm6egGv1-qM_6abxz0-6x9l8
Message-ID: <CAEB5A_91hob8ddOhW=PrO1=O7GrFmSxY3r1-_Ard6x8KHHuJGA@mail.gmail.com>
Subject: [REGRESSION] sched/rt: NO_RT_PUSH_IPI causes multi-second PI-boost
 starvation in pro-audio workloads (dd29c017aed6)
To: Steven Rostedt <rostedt@goodmis.org>, Peter Zijlstra <peterz@infradead.org>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, linux-rt-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit dd29c017aed6 ("sched/rt: Have RT_PUSH_IPI be default off for non
PREEMPT_RT") causes reproducible multi-second audio dropouts on an ordinary
non-PREEMPT_RT desktop running a DAW.

Symptom
-------
Audio cuts to silence for 0.2-3.5s at irregular intervals (roughly one per
2-3 minutes of use) while the machine is otherwise idle and responsive.

Mechanism (as measured, not inferred)
-------------------------------------
REAPER runs one SCHED_RR prio 20 audio thread plus ~15 SCHED_OTHER "livefx"
worker threads. During a stall:

  - the RT audio thread is blocked in rt_mutex_schedule() on a PI mutex
  - exactly ONE livefx worker holds that mutex, has been PI-boosted to RT,
    and is enqueued but never scheduled
  - its schedstat shows run_ns ~0 with wait_ns tracking the entire stall:

        reaper/livefx tid=43910  run=0.0ms  wait=3406.6ms  slices=2
        (during a 3403ms dropout)

  - meanwhile ~17 sibling threads run normally with wait_ns = 0, and no
    thread does meaningful work (largest run was 7.2ms across 3.4s)
  - the machine stays responsive throughout; unrelated SCHED_OTHER work
    proceeds at 84-94% of normal rate with 0-1ms runqueue wait
  - all 16 cores keep taking timer interrupts at normal rates

So a single PI-boosted RT task sits on a runqueue, unmigrated, while other
cores idle. With push disabled nothing hands it to an idle CPU.

Evidence
--------------------------------
  kernel  RT_PUSH_IPI  playing   dropouts >=25ms          xruns
  7.1.8   off (default)  19 min   8  (191ms - 3471ms)   bursts
23/265/434 per min
  7.1.3   on             39 min   0                     0
  7.1.8   on             42 min   0                     0

The third row differs from the first ONLY in the sched feature: Identical
kernel, toolchain, GPU driver, project and audio configuration. At the
observed broken rate ~13 dropouts were expected in that window; zero were
seen, at both 25ms and 10ms detection thresholds (10ms is ~2 missed audio
cycles at quantum 256 / 48kHz).

Workaround
----------
  echo RT_PUSH_IPI > /sys/kernel/debug/sched/features

Applied at boot via a systemd unit.

System
------
  AMD Ryzen 7 5800X (8c/16t), Arch Linux
  kernel 7.1.8-arch1-3 (and 7.1.5, 7.1.6 - all affected; 7.1.3 is clean)
  PipeWire 1.6.8 + pipewire-jack, Focusrite Scarlett 18i20, quantum 256 @ 48kHz
  CONFIG_PREEMPT_RT not set
