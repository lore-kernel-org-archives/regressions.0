Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124303;
	b=tVTwNM23jIwcqyLgWcDGHG985ii+42tkyyyqTzW12Qu636nFcn/BCACAznwt/qIRBgjo
	 VuOAgmECYQ5ZqfU7wxlBEQKcx65sLVU3vovtc/aqb5wDoUU3Kqd/ykhTt8dpIj8ufxnhq
	 a6cfpLFTHfFHWyFakA8vr3GqdxU96iILezSMZkcsoxiEMBPHRQQ9zZRK15yDGWoXu1Hbu
	 hqly6e87q+Sl9UZ1ZK2XaVw5qajWur4afyU6tcb66UpvcXg25RpLIXDoKkghyIs9GNY1W
	 LIxnAgxreELJRIBL4NQiXVrqCRkKPIrsJIsrHjhiZcRN/GpflmE9twEA0gyt4Jx6+Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7UP+K2CIKJLiob8ybXferq92NXaHOd6XKBVJ1ps1v90=;
	b=ooN+J/drGd5d5vrbznScbvxJNeGfpOCk9BdRZblBY+g+7oq+FpZOHqJb0WZ3XwkIETmZ
	 3vw6pdgwbgfFHF3KW1qI0gs/LCbngE4ICanVnCxrd0Ng0QwOtm0DyLyiu/Wqg7d3z3Jnn
	 mISuu8vm6sXJfRkFb88yx/li9CCi9SwUekx5wxaSS+GwV3jGYX/I7WlVVFRLKjMAjPXJm
	 Xm4xnLY8mGPZjWLPm33bBrH4Ei9kspzQkXdLd7Vzui1RntRtTcTpCQdUrRdqPEc9pLvoz
	 +nEfWv2klhT04B6tq3gboN7ZvIDbWjoTV0u7WHVCkuP9sTeLExkLtbkpbNT8OmsbUQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=anMAi1Wh;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E090606A31A
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 18:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E090606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=anMAi1Wh
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-84e513874f8so85302a34.2
        for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 11:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793124301; x=1793729101; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UP+K2CIKJLiob8ybXferq92NXaHOd6XKBVJ1ps1v90=;
        b=anMAi1WhvvltyX8oqTCq6MMjf0nOOIRtTHGeJIF+tfYu7U7nD4YSvuB0M0isgn4ojW
         8m9h1/NTq5o7D7lOLX/u8CWsSUkRAMTDURCGkeZnlHMt/Dm/8rcLXRzshUOqWcCuskhX
         Za+4CaqvQKgmR+lWsObSbxmD2V6NYmGCBiC8+oYqSUTMQCtJp9Gq5TaZPx2BUd+6Im7t
         OP5nDAHcB//xEjpxZ1pFnqFkDDhwJfoF0xjZa0mC8nvFGlvEfdX1pPTY1m+U038QK2it
         qCLtf9oIn2cimFSjwuvYXBUfEwe8pAHf1dxlgOqrBHzsa5yhNWp4FjOeODGVOnpu3ZV6
         NKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124301; x=1793729101;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7UP+K2CIKJLiob8ybXferq92NXaHOd6XKBVJ1ps1v90=;
        b=zALz1HfBlX08GBBjIKf7fd0UzSJ1WPGohlggUxT9foSBSPUOdWfp1wDvFgvEDLO72t
         eubrH6kj5+rDTn95guZ+WJUnwY3pQ26r9V1XKafFjRfvMnEQ04wTg1PohxgyYpik0zYn
         AmdO6OjMWXizDi8TMCaV6DV34uQv2LkzKExcFOM4FXcXrQUN1q1RtDNjUfkHUMlB4SW3
         G2dDC+fDZniDTXM/BEEldrgsiZRF/hWe3SmW+gNsIOCrMLwet5pyMj41xX0H66CoSZ0Q
         PMD3WQCjS47ZOFrHrhZmFdHE7gE1eeh1NBe97+mjDiNt35ixF23LDq3YBmagwNZwp9nr
         R0PQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEGEG3gUz9VciZreYmigfQz/jd0GahX130DGJFAN/5OAOYi2IB4SLwyM5QGCIxLeZdr14RJX9OBXW0Yw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJlV4/VL9svla9pqYhPyxGw670AaRIdDIQLnDEy8ETMak2nSY1R
	yg6QgBD2dnFX52BSVIu0QrlGYJtE82F5fBHDroc98iZ23jfcOCtkeWCAGwls+ldan14=
X-Gm-Gg: AYBFou3JV57Spfwr3or/+yf3PAYhLF6Vushj17us9zDhxgAH5uiRfRS2y1tOxrlWPfn
	QLsX64CgHQ79k3IfCmThuUSCGG+LjOncyBR7q6ogaTCkAysrfQ7wyKS4S9Vt8lB2o5Adf/xyBfl
	+2kwygCTpIjWWkcbbHjnvjA/ILVsvGAd0t5/qqiBk+MLbH8GNbuHihiHlx421Mj0fHzcosBLKaL
	cFeYojTGac/pfCY00NknbGFu66SH5B9VdLnjkGXqs0WsSv11vSDj9YRbdHcdc+SOFirsTq7uup+
	ITj2Qfb2PMqDYv90S8ekOmxFYSBJ8+eNxVRUAOCSA18MnA8vw5XjR/LIdf8qriiKVSSi39ZnZ8V
	A161zugLHwTpkk9yfn9+NSMk6ZRQ5xiVNQSoXJByEr+LI+8Pv/JGJdEogWriFE4gBZCnBslLKSa
	YWbl9KBNJtQFPT0ImyaPLPsxVsKaY44PvEL+vg+D47XK6vJEQmYIoiLnyeKwvglTmCv4jfV+ar1
	p1KPEh3iaNkTRXnBMaGp7eZ/onv0J6HQFLXM5ivd5JkHfO3+Ok19sSP7s+FQ8DlpbtxdCgBoWDw
	0dMLSHc94FmQcXNCctHuwh9qfAX4gXtAd9WyXpshHkPX8keQ4axuw/q10A==
X-Received: by 2002:a05:6830:2b22:b0:84c:85e8:f922 with SMTP id 46e09a7af769-85abe8bb899mr253687a34.26.1793124301049;
        Tue, 27 Oct 2026 11:05:01 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fc005bd7sm11949803a34.24.2026.10.27.11.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:05:00 -0700 (PDT)
Message-ID: <b50196b6-cc04-4d3e-965a-28c4f75ef263@kernel.dk>
Date: Tue, 27 Oct 2026 12:04:59 -0600
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] io_uring: final close can hang on a stopped
 submitter
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: io-uring@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261027043521.99446-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261027043521.99446-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/26 10:35 PM, Karl Mehltretter wrote:
> Commit 13d3783a55b7 ("io_uring: wait for in-flight requests on ring
> release") can make the final close of a shared ring wait for task_work
> owned by a stopped submitter. The close does not return until that task
> resumes.
> 
> An LLM helped with the review and reproducer.
> 
> #regzbot introduced: 13d3783a55b758a9fa05b67835afa7e216476c61
> 
> Last good: v7.3, c03c1a14507dfaf8b856c2608f9ac216021fc222
> Tested bad: d135ab453a7400a34930bdda1ef4bdc8acfac80e
>             (master as of 2026-10-27)
> 
> The reproducer uses a default ring and three processes:
> 
>   1. Submitter B creates the ring and submits POLL_ADD on an empty pipe.
>   2. B forks closer A. A inherits the ring fd but starts without an
>      io_uring task context.
>   3. A unmaps the ring but keeps its fd. B drops its fd and mappings,
>      then stops itself with SIGSTOP.
>   4. After confirming that B is stopped, controller P tells A to close
>      the final ring fd.
>   5. P resumes B after two seconds so the test can finish.
> 
> B keeps both pipe ends open and remains alive until close returns. This
> excludes pipe HUP and process exit as completion sources.

This is working as intended. With the change, close() waits for
requests still in flight, as otherwise they keep files pinned after
the ring is gone. If you SIGSTOP a task, then that task can't run
the required work to complete it. A fatal signal will still kill
it.

Unsurprisingly, sending SIGSTOP to something may prevent it from
doing work...

-- 
Jens Axboe

