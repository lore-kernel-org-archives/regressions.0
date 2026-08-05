Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA1D3D332A
	for <regressions@lists.linux.dev>; Wed,  5 Aug 2026 17:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785951214; cv=pass; b=CD5TRBjpozT63rbimpl8UlkkYVLvtIs2gv0L4zJ0ccFxR4qdCXp1LqYXg3RjV0sjzO0VWNHGE1id+dlwP1ptZWk3t3azWvq04iU3uf6R6w+5+ZYiR9vExTZkg2BGGiP6wJrrOzs0fuqVWD470JjJUwN4tUBK8H9KzvRsMOPNCk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785951214; c=relaxed/simple;
	bh=8W375PzrfVO9LealRsAri/9qcosAIl7qz+R5/EoeNAw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=I59bNupYNhaXkUaer9cyJakoezK/h/htmewbBqaZB7JtgRl+J/sAerJEHyEgEdF/sGzXSmNTgZOgLZqE+8R4ADSqz2ntG/tf9RbglP/ftQn00PWU3kimf8DFkaDKxIoPB1ZuLcGHpArgl/t9sec1ySWdGT0eQjZFOqXtvYAf3RY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+tG8Sa/; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+tG8Sa/"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so129378e87.1
        for <regressions@lists.linux.dev>; Wed, 05 Aug 2026 10:33:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785951210; cv=none;
        d=google.com; s=arc-20260327;
        b=Tf5UCMxg6zy8MYwedAPkXn9p7zwf00UT+y8/1ajqcpLOitRf42oYhxYc8a+C3Dqwgm
         1sCAqwg0n7cK8zCRSvDikxclYX6T1MNdTDzbAzmqiUyrnB6HP3esWTP2yKfKqEAntWjL
         lzDgDrrYCLGjGXOZckAtYlT25KkF4ysQ2lBVT18hvgKiwyk3KdiVqVsMQcDQ2vrAcmPP
         XHZrRW0Ny1wQurJuSujAW3W6E5dd3bwcsUjy76pX4z9z4Vd0Igvb+fQZHb/VvH2NE/I7
         lnsekrUCxwIwHTPy8KEDr3q4wU48HLZLLgbY4rq/Wyq9l9GwFrcVcOW02nZyRTq+IewO
         kTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=gjIj7lzD5ZZ0aMlfuwKdTdUTDa+S5Wt5LLNmJC9Wk/k=;
        fh=Wzc+iz4Jpu/dlQALWJmWPxayfNuFB0KikMOovYo5tjc=;
        b=ryAN5HENEC6+upyXcyVDAaftMcgCHmnTsBvphxh/yIqgme7D0n7xhttWAqvxv/Nng7
         wK0Uvpc8o0kc1Mxn554JR4+KrrHQYZx5vev/CsjsXC/3FqoLp9JKx1g3lRRirPS4qVUN
         vFUNf+kkThfBLmOK0uLaOSdKJwmH9tBp6iDYEg/hUiffu+E4gANdE3/kRbz+m1QjJJJw
         2P95EVYPU32p3dtHMTTDt7eeoXhAl1iWc5bAwloDQjMnYexEkDL24RwRReMp1clbjEEh
         PjQkfBxUct+h7urb8zPIv/WuYc6BdeResYrWg8qO5S+qjwLfpBYqCQihupFVKLlCjqaa
         tljw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785951210; x=1786556010; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gjIj7lzD5ZZ0aMlfuwKdTdUTDa+S5Wt5LLNmJC9Wk/k=;
        b=V+tG8Sa/2h8lziWicvpPUWu8V8QwuAtg7KsEQ6qcnlf8ik4i7GU70RO7YYPRx1DAbf
         rEFzMttpuaISFySRcgW6vciwsdyr6tFDGnb+6lodjLt9zXLm+0Ex0EayvopTAyTRHgkv
         KSXb937fqMBC/KF1wWSIRSNcRWFFVNN6XEFG2ohWviE7GnZiDLKZxndKU8TlfgnnWJ5b
         INS1tEiXyXxQSm+3CRLDjFcuHOyu8xsidvAkHTVAJVgclNjPTdhj5fBuPnlEFNVw0jtb
         RXRrWkcQ9BDIBeTvkr54geSvrYjiMFvqm+O3+/gYveNniwU7K1PWcWIS1BqdgvlbqHGZ
         DFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785951210; x=1786556010;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gjIj7lzD5ZZ0aMlfuwKdTdUTDa+S5Wt5LLNmJC9Wk/k=;
        b=qwdpxuqlsKu4Xw/dIXeSBB+iE0hDuDAZEQaASBzn0ikqNKNIkUbB5AWgAcqBcvRjNk
         nPcRFaX9ghdS7wnBU6gCbxLbmmL9K7tHwzlRA4oOAuikxvCOhr+qAliYjJzav+k6ZKfN
         wf32VYKwPLLAC3967tUc9UHBnTab9emimCOkZLoCHyUwBGKOCeEq4fNJrlc8AIQRfNr3
         Knw1eP/h4oebtBLNVNMP1keJQuZ1HYjgZnuAcIu7KYhKLoBSMJavVdM7SVQsKEV4XUcW
         4cPliOs7+vEgJl6QcDA260oVu0CDGCVmYT7t2S01U1q/ac1CEDR84vU8SEdc/7giWWLW
         y7gA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1SM8LiRW1AIDsoE4/AUZPaGNrY0l3xGBAkbYTdGGBIzolofcw3Owj/BfT0uAMd/YKAOBl4rH2ijDI1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwU6loJi85OG4lRpaaZh5p3Tsiu1/0RQqdm2jh+RXVeS47klQaI
	x0ve45yfwu/8dXO8Kxvcl1t9wR5eBY/vgyIXh7LDJCCK7YhZJmqt5A2f/4D4wqvWgV/+UZctqrr
	EIeH1LeQzE486Hhd12Ou6LzU/yEWXsEw=
X-Gm-Gg: AR+sD11mCx1Ipq01JreWpxm/4ToL2708R1IT3pmEdQ7M5n6x1XU1d0tDDtyztixk2r1
	k7xKl7VeCMfMmX5hsOUfqhX2q3+2FTn/GeWP6CGGrkcbSx+ci9jdJNQaBM2lo0SnBRCatcMwJ9s
	YcH0V6OWAIYAozdR1bPZKU4vW7QqF48oUTMdFYVLSWA5fX8HD7kfY9jR3V9b/lm0iH5AR9o+yhk
	bLQNttaDjzFJTkR/8bf9qCwgf2ccGItqKxEiSORJfLvALaiMjw2ZWs8P9SE/Jmdyq3/4tK6hj9/
	Ti1hfQV6wPrJ5oglXEqsYSrr6qg9dyj22+Etpj7NBsE=
X-Received: by 2002:a05:6512:114b:b0:5b2:8dc6:3ec4 with SMTP id
 2adb3069b0e04-5b2fe7b7602mr132201e87.18.1785951210010; Wed, 05 Aug 2026
 10:33:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Thu, 6 Aug 2026 01:33:17 +0800
X-Gm-Features: AUfX_mwrMqeWVhLGuxpWkwZ_iXRXkgEaOw6DpiunlUGbuwY2eW6vW6rqEunofnU
Message-ID: <CANGjgdnoz4NdqzOV9+SZaYTc+O_GkNNn5NVp+ZpHUQbp5h-QVQ@mail.gmail.com>
Subject: [REGRESSION] apparmor: AF_UNIX datagram send slowdown after 6456ccbd2ff7
To: john.johansen@canonical.com, georgia.garcia@canonical.com
Cc: paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, 
	apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi John and Georgia,

I found a repeatable AF_UNIX datagram send slowdown caused by the exact source
delta of 6456ccbd2ff7 ("apparmor: fix regression in fs based unix sockets when
using old abi"). In a bare-metal parent/child/parent test, a standalone
sendmmsg() workload was 15.30% slower after the change. An independent larger
runner reproduced the slowdown with both sendmmsg() and io_uring SEND, so this
is not specific to io_uring.

#regzbot introduced: 6456ccbd2ff7
#regzbot title: apparmor AF_UNIX datagram send slowdown

The standalone workload uses socketpair(AF_UNIX, SOCK_DGRAM). Each sendmmsg()
call sends 32 messages of 128 bytes. Peer draining and payload validation are
outside the timed region. Each point had 3 warm-up rounds followed by 15
measured rounds of 65,536 messages.

Because 6456ccbd2ff7 was part of an AppArmor series, I isolated its source
delta on one controlled baseline:

  parent 0bfa1c2da7a8: AppArmor topic prefix through 50d56a1a366a
  child  30cb02a874b4: parent plus only the exact two-file 6456ccbd2ff7 diff

The child tree matches the same baseline with the AppArmor prefix advanced
through 6456ccbd2ff7. I used a fresh boot for each point:

  point       mean ns/message
  parent A          343.382
  child             395.831
  parent B          343.259

The child was 15.295% slower than the parent midpoint. Dropping the first
measured round gave 15.289%; parent drift was -0.036%, and the maximum CV was
0.137%. All 45 measured rows passed the payload, length, count, and empty-queue
checks.

The machine was an Intel Core i7-12700KF system with 32 GiB RAM. The workload
was pinned to P-core CPU 2, with governor and EPP set to performance and Turbo
disabled. All three runs used actual preempt=none and reported
/proc/self/attr/current as unconfined.

As a separate check, the larger original runner used matched actual
preempt=full. Its direct sendmmsg() profile was 14.841% slower, and its
io_uring SEND profile was 17.953% slower. I am keeping these results separate
from the standalone percentage.

A separate v6.16.12 -> v6.17.13 perf comparison was directionally consistent.
The children overhead reported for security_unix_may_send was 0.27% in both
v6.16.12 controls and 6.77% at v6.17.13. The latter included the path through
apparmor_unix_may_send(), aa_unix_peer_perm(), and unix_peer_perm(). This was
a release-endpoint comparison rather than the exact source pair above, so I
use it only as supporting path evidence, not as an internal decomposition of
the 15.295% slowdown.

I understand that 6456ccbd2ff7 fixes a real old AppArmor policy ABI issue,
so I am not suggesting a revert. Would it be possible to retain that fix while
avoiding the added cost on this unconfined AF_UNIX datagram send path?

Evidence bundle:

  https://github.com/lcf0399/linux-regression-evidence/tree/7b9862c7ac2d5f9622725912d7f0df95011bcbfd/apparmor-af-unix-send-old-abi-6456cc

Thanks,
Chengfeng
