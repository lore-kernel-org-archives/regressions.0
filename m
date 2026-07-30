Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1653B3F65EA
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 10:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408171; cv=pass; b=uSnymJZuQUsDKnLuvtFJ7qacMNIiU6/hhz8Q1li+Lwk9ilD5MyBmvtFeIng0IGMykJ394Z6N8ANBJwDNPUhXV+gk+Qc/fnwSiSmblaeSfKhEPskMfqgokIttZ667Qj9CpFU5vqYBrNvbJriI3fZvLxriG9+UkrmUw3OigtsGOkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408171; c=relaxed/simple;
	bh=W9y/o0fz9vmCM2PHGdXrf11+hHaWhgOC+/4OWUzaCds=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ujLIroJoRHSr4rMpxCHs6NNqF9c/OaLTho2qeLOV97b48N47CMhANc2nQACmIm6skxNVGp7F81ZplWuGATmJ8Y5zlhbU9LbtOQnH+40nGBYLpETCgLtNOftCl1rSwdWHeXJg8ZsTdBlSp+7cTr/5dUR7/Q23HxYc4JyJXp8gVv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlyAIhYj; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlyAIhYj"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c74722e27so7496871fa.0
        for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 03:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785408168; cv=none;
        d=google.com; s=arc-20260327;
        b=fpdOjGSwmg0SQNaUKLwBUopXIzkLd5LOFGUsNgOwmAD1HGrXDmNJtO3t1wLQ71JLQj
         74lv8F3ouVAOWN2NloxPbfbrgD2I3rdHINKecAwo1SEloq/9VV86kzZ+weFEJvxTgTCC
         s2OYJsw69JWMcWlDKI3Ch/nivDUFdqXfQwZgwxap+lLW4DhoiwNt9VCJTFMoN6QeIviw
         viwqQHZUwWK08HDPJ3yjSXYo5OlgidMXMECq4JBWGYCKXAhPYj/XA0UDLSEWtKh+nPaP
         zT5wlcEFia8EvTPiMFLxSBJ1DuVml5HG8Am+veeQpb8bTOhfigDUrYr4pcArpMszy65W
         FBKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=DvRPL0xNHt2yUHxmPNQXYSIsNFvCGztbkFOk+1WnSSU=;
        fh=PVfp+6o6zaVys5/BmyJrw0dyBA37B8CrslNLMVsBcFs=;
        b=rm6vgBiTfCgsOow5tohgDXSN6gii/19U7nZIJwATRE4+e9QLiRyMYiLmiABbUfnrLg
         8RDYx8LsT8cqlqHgHrcECkSJabYqG/Bk7e4wF3Hdw7BrA31sZUg46Qe8OJ8VltBebyb1
         qCd2l0ZuCTVcwdgmn3RCw32+0dyaPJX91Hk71XFHt3EA+MIt3vo9Z9ndNAeWPegZcAdV
         SGmKZz/FM9708oLDdP1JzujGHYzszPflBnAY1DPsY/pVyjDQc+/VyL1pwrP78/+5eqn3
         1l/6mALuKB9O8bUX4R4vglHzg3PCM3RLRahlbvpQRxofX75Xjth1J34eZ/WI5j0rzx8M
         f5mQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785408168; x=1786012968; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DvRPL0xNHt2yUHxmPNQXYSIsNFvCGztbkFOk+1WnSSU=;
        b=AlyAIhYjvc70SuyBBeRUUkAqQYNZSzPQmAGhf9rzZBziQoq7FA56ExW9lEVwX8CMc5
         8Zi/bOdovVhhamo/TqB48dHH/pwn1ss8nHo1VfsufFJ5S+FcSBErBwZolNRN08asnZjf
         UYJ4iufA8m1xh3jNLSCSs6WetILjE/Br+ccnI5OWJFDGlHnQdDDKnWH8F4qcgb1HuIix
         9F0tVzEUgXYtlZmdpbazbd+7mGPNxwkNGRbovHZiQYhkhgIpz66JXwbCZzsMA5yEmA2a
         3vayyptduBcX4HrwCSNuFKYAwR45pIq+oLDOuuR+muU2DgK0XaUUWaJX3cT4/IOUQiIk
         SvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785408168; x=1786012968;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DvRPL0xNHt2yUHxmPNQXYSIsNFvCGztbkFOk+1WnSSU=;
        b=VHmuOIPODNsgej9fEyyAmpjklCRZ/21qJZAoMTKRMlcdKdIav7+SYn/noVOEAy/l5Q
         uGhTz8EFAMgd8bJEQmAshDNyHTJi+6ptH/01qtPKR6N/J1OLbksk5dETl9h9X6oxBk8M
         w5B9EHI7AxQ1oknJLphom+9atQIJC89CYuMA2JZ+WZ4VyM8nshXxVNH7JyxOiNHutu6a
         qRtUSZlUVk3yBeKaeqALeA5zzb1FkGLljFDY4hvquWvR+ytjz6HI1WfkZ0W4w16IVTaf
         1OHTJYeMTEjIV315Dzt1Gku1W4mBKcQjXEvDfhMc+eje6B6rBLJRm4OZcdaOafaJquwB
         Ro/w==
X-Forwarded-Encrypted: i=1; AHgh+Rr3uEnj+cgO77pVl684BJhnjNX8qqn3KH3M1awGGPd5EDS8QhcJOWFsjUOOsZuPsojLSk1H87FmLjfabA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfxVC3d/hEg/NCMjwgWtzDKoWe3CGwbkfXx+UnfE8TAr1RCQXm
	Sx0oozpLxHyc4LJs8R3HS/D9eWl4ugX3iynxs3arkb/27yvfRU7t6UxvFNUo+i1iwJgiIRTLOo0
	7fR5evRPHcwI3rcumE1nMvzaTii6Yf2Y=
X-Gm-Gg: AR+sD13XCPkeH2Q9E1Nr7VnBhQHuKQxD0R8xU1PomL9Au1nlgPB5yz/inGZYZnCJdXN
	RpJo5UqklNj+Q/J60hUkfrl0glb4HB2q90rL+AuE+bPdR4KrrpYmqHimDb3ZbFuj6909No+0xeN
	MIC0SHGXUuYQ0KP6SMM3b4WsG6EiU5lNlCAlS7YUGZxw1Jr6xOIFaxqYBdQx2oGZhUqVvnLS8hQ
	DYT7PtQJAWddyN9FsZ3OlkFfTXOlvWMIXGeeh9fO4mUKkdLJjCHZWJeKEOKQ2ayOIX3Vu9DBJn+
	74doS+NbCW9ooCtq1iAr9mWAAPhnQvakSIDB+3I28l4=
X-Received: by 2002:a05:651c:502:b0:39a:fef1:ad7 with SMTP id
 38308e7fff4ca-39f706705camr3487351fa.21.1785408167726; Thu, 30 Jul 2026
 03:42:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Thu, 30 Jul 2026 18:42:34 +0800
X-Gm-Features: AUfX_my2Ux3mXHCSLI9OEzNcBpvgABF6k1WnDjHJmIPPMenxP_myxBhVJEyBI4g
Message-ID: <CANGjgdn=R_qyUdE=j9za+vkmqcxacbP-84OHXF4nZ4ho9qRyVg@mail.gmail.com>
Subject: [REGRESSION] io_uring/futex: scalar wait/wake slowdown after 079afb081c42
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, Robert Morris <rtm@csail.mit.edu>, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Jens,

I tested 079afb081c42 against its direct parent on bare metal. In a narrow
scalar io_uring futex wait/wake workload, the child was 9.27% slower. A
separate 338-line standalone reproduced the result at 10.02%. All compared
kernels actually ran with preempt=full.

#regzbot introduced: 079afb081c4288e94d5e4223d3eb6306d853c68b
#regzbot title: io_uring scalar futex wait/wake slowdown

This is a focused synthetic microbenchmark, not an application benchmark. It
uses one raw-UAPI ring and 32 cacheline-separated private futex words on one
pinned P-core. Each timed cycle submits 32 scalar IORING_OP_FUTEX_WAIT
requests, then 32 scalar IORING_OP_FUTEX_WAKE requests, and drains exactly 64
CQEs. Every wait must return 0 and every wake must return 1.

I used a fresh boot for each point:

  6a8118a77eec parent A -> 079afb081c42 child -> 6a8118a77eec parent B

Each point had 3 warm-up rounds and 15 measured rounds. Every measured round
ran 512 cycles, or 16,384 wait/wake pairs. The results in ns/pair were:

  implementation   parent A    child    parent B    child vs midpoint
  formal              180.079  196.647     179.856        +9.268%
  standalone          180.171  197.856     179.502       +10.020%

For the formal source, dropping the first measured round gave +9.269%. Parent
drift was -0.124%, and the maximum CV was 0.169%. The standalone drop-first
result was +9.996%, with -0.371% parent drift. All 90 scalar timing rows
passed the CQE, result, timeout, overflow, outstanding-request, and CPU
checks.

An untimed child trace also hit io_futex_prep(), io_futex_wait(),
io_futex_wake(), and io_futex_complete() with the expected request counts.

A matched WAITV -> WAKE profile changed by only +1.385%, below my preregistered
5% signal gate, so my claim is limited to scalar wait/wake.

I understand that 079afb fixes the exit-time use-after-free by keeping pending
private futex waits visible to cancellation before their mm state disappears.
Scalar WAIT and WAKE both use io_futex_prep(), so in the child both sides of
each measured pair execute the added tracking call. I am not suggesting a
revert.

Is this per-request cost an expected trade-off for the lifetime fix, or could
the same exit/mm-lifetime guarantee be retained with cheaper tracking?

Evidence bundle:

  https://github.com/lcf0399/linux-regression-evidence/tree/65c8cbf86f40cbe759e3f7db1d29d152ba03a8f2/io-uring-futex-inflight-wait-wake

Standalone reproducer:

  https://github.com/lcf0399/linux-regression-evidence/tree/65c8cbf86f40cbe759e3f7db1d29d152ba03a8f2/io-uring-futex-inflight-wait-wake/reproducer

Thanks,
Chengfeng
