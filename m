Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F1232C8B
	for <regressions@lists.linux.dev>; Sat, 11 Oct 2025 08:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760171514; cv=none; b=mEQU6fcEnr0KxKd/dooa5ZL/PnUk7DGGuu4qN1+nTURWSjTKQeVxqWcGufwD/ZF8V5TBisyXV6LELVQ3heCq9GXe1CLdEqTToornDqHWyJ2bI5L1NtEap26KGBzYPe+eQnuu7nwCsgjD2x1C2al387+xlM3+0vCXPAs6V8+J9oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760171514; c=relaxed/simple;
	bh=XgCQ9pI6qjLRbY6gYT8jTdFJ43IhBMEiV2kVAMWGn90=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hUUf4ROLpGk2A0X/JWlS0TKLCZOUtbmOD/+tpRGskugUk6dKMw9J61vYjxXPtbZLpGDRb1k85dao1IpHj9VhOLFXK1Ovb1kFgagEul8itBIMLIdZzA+/1cmbREJq7I15LLeLu4mGOyHYFd6Zy2ZvKppdWmJHRLxoUYR0A6HOxrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfDs8EF+; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfDs8EF+"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-54bbf3329c1so2382828e0c.1
        for <regressions@lists.linux.dev>; Sat, 11 Oct 2025 01:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760171508; x=1760776308; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XgCQ9pI6qjLRbY6gYT8jTdFJ43IhBMEiV2kVAMWGn90=;
        b=UfDs8EF+34x731UUbgDNCJjIUGHPp4Cp1KTkAxEnYFUBnRhnUva/0eigSgj15R3+Jm
         cABS8plJCH3dz4v/T20C9jOt3MNzPdxaHdekRY4g0r/E/jpA/HTY/R6+27MdPsylwfxJ
         dhQ48LDbeJjyJtDUjpj8ZvswLLIaxpL4LG0kTwfatLaeLyoYNS6ACNh0p81Hujv08JNZ
         zdZKwNwg6Tis96cW4LI0HSRoFRgMYS/3fK0KcshJEcOmzfYs+GV24Tg33bQB9ACPEvkh
         9UU0rQZ5w1lN/mZN91dUcYmMAZFYKd7gNHpIX7k49yDTqwjrlyi7Z38q2Asm8R9SUjxh
         PQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760171508; x=1760776308;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XgCQ9pI6qjLRbY6gYT8jTdFJ43IhBMEiV2kVAMWGn90=;
        b=APe05nU8N3jZpSHuq4x6UNy+bQPNPPHmH6n3mi8rXQKKQaod8H8YQ3q5di1HzKaWjT
         mj7kXA4eZFMZKFLHHuymRX46GN1zeLEKZlt54y3WYQBJL7fL3I5ge5t/gTTc85VLf0yS
         aiSdN/Lj7+MMFEX2PieyBb2aqlOuubT8IqCFG2ud1wk9PZNDtZFGZyaW1P1/g3MppKXv
         7fRRWXk8zOQznze/2QXTXDpUbZxvaea0548tUHzKLGfXiOIm0TDvTeZfG6rnjSowDfpr
         2mDwYmMXseTcdiPXdhUBBvUy4j0vdDA1DgjxlSVSl2c/A9NXjzzKD+rwkfkIEw3hZz0G
         CfIQ==
X-Gm-Message-State: AOJu0YzNNa3Q0Gwo7HMWi+wrT2BD7/vw8jhxjdRXYYiElCTVKduJLKV9
	9CnMJBNNje1G2xoZ81DgkfZL7UlyBUiQ0tSBcg+mykgT2xl6NRP1MX6wTptnoMh/mu2vC7nQ2LF
	08UxEsz/GDoGaWugR8kSj0aby93RtK5s=
X-Gm-Gg: ASbGnctECcFGE2r2Ns+8upDiEIkLMlmucBfFmKOlOX0ZQV8UEalkrUk524BrIgVrkbo
	LZSVRNd948ipPymEaLinK7GqVzSgAba3CO4spkMrhbMdG1vRNinWZoGlDytOsClwFLwBzO1kAON
	AGuHEqBUUzuh+2FLEVyVUBUoTOY4Mu4zKK+1ERA9ME0GfSNDZi+ouOkrX6jLMCkAjmTl3Te+2U8
	glfuVI2xqApIZCl/gFajRUmlnrw/ex9zz6ua6RpFcJCgMdYqjl91CybR8B9MBYUMvNjbELbjn+A
	+uO9jDr63X5PkAtXpgta0HFmvw==
X-Google-Smtp-Source: AGHT+IFejl2oruWpHZ0awY4yEWw3zCcPlWZ16r46QzwtfB7PY9nnCyu3jvPHC5L7g+95uxSL/bKMRFASRVgMxtquJdI=
X-Received: by 2002:a05:6122:a0e:b0:552:361e:25fd with SMTP id
 71dfb90a1353d-554b9193d05mr6615340e0c.2.1760171508129; Sat, 11 Oct 2025
 01:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Octavia Togami <octavia.togami@gmail.com>
Date: Sat, 11 Oct 2025 01:31:37 -0700
X-Gm-Features: AS18NWByaqnuJUTWmTTuzsDkaPpU8PWj6jMDq5RN-D7gigcpvQ72G62InwV-zrI
Message-ID: <CAHPNGSQpXEopYreir+uDDEbtXTBvBvi8c6fYXJvceqtgTPao3Q@mail.gmail.com>
Subject: [REGRESSION] bisected: perf: hang when using async-profiler caused by
 perf: Fix the POLL_HUP delivery breakage
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, peterz@infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Using async-profiler
(https://github.com/async-profiler/async-profiler/) on Linux
6.17.1-arch1-1 causes a complete hang of the CPU. This has been
reported by many people at https://github.com/lucko/spark/issues/530.
spark is a piece of software that uses async-profiler internally.

As seen in https://github.com/lucko/spark/issues/530#issuecomment-3339974827,
this was bisected to 18dbcbfabfffc4a5d3ea10290c5ad27f22b0d240 perf:
Fix the POLL_HUP delivery breakage. Reverting this commit on 6.17.1
fixed the issue for me.

Steps to reproduce:
1. Get a copy of async-profiler. I tested both v3 (affects older spark
versions) and v4.1 (latest at time of writing). Unarchive it, this is
<async-profiler-dir>.
2. Set kernel parameters kernel.perf_event_paranoid=1 and
kernel.kptr_restrict=0 as instructed by
https://github.com/async-profiler/async-profiler/blob/fb673227c7fb311f872ce9566769b006b357ecbe/docs/GettingStarted.md
3. Install a version of Java that comes with jshell, i.e. Java 9 or
newer. Note: jshell is used for ease of reproduction. Any Java
application that is actively running will work.
4. Run `printf 'int acc; while (true) { acc++; }' | jshell -`. This
will start an infinitely running Java process.
5. Run `jps` and take the PID next to the text RemoteExecutionControl
-- this is the process that was just started.
6. Attach async-profiler to this process by running
`<async-profiler-dir>/bin/asprof -d 1 <PID>`. This will run for one
second, then the system should freeze entirely shortly thereafter.

I triggered a sysrq crash while the system was frozen, and the output
I found in journalctl afterwards is at
https://gist.github.com/octylFractal/76611ee76060051e5efc0c898dd0949e
I'm not sure if that text is actually from the triggered crash, but it
seems relevant. If needed, please tell me how to get the actual crash
report, I'm not sure where it is.

I'm using an AMD Ryzen 9 5900X 12-Core Processor. Given that I've seen
no Intel reports, it may be AMD specific. I don't have an Intel CPU on
hand to test with.

/proc/version: Linux version 6.17.1-arch1-1 (linux@archlinux) (gcc
(GCC) 15.2.1 20250813, GNU ld (GNU Binutils) 2.45.0) #1 SMP
PREEMPT_DYNAMIC Mon, 06 Oct 2025 18:48:29 +0000
Operating System: Arch Linux
uname -mi: x86_64 unknown
