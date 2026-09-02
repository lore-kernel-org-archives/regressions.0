Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FB34AE8C9
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 21:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788384723; cv=none; b=WC56vZKIReYp2j4pwkhHX+xGlb+4Y12+h/Tr5fVHNPXO0qVDEZIyqpkjjxeJLZKMLPzrgqrO8jNQXpIhHzAiIf3aIP7TflrAjambe+UXZZ+5szOnY4EsnDXNDOPeN99zXaiyuD0Z7vc5zCAibmd06AW4XTZtoWiVdTdz6bCJImw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788384723; c=relaxed/simple;
	bh=I3fvkvWoA8/WV4SQWhXYswOYzr/OzkLB5gLkIo8oOpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aBI1A52F/6fnq113OC/SekMOU6DHDUqe0LgXlWNl/Zz6z5jfL4TjVkPB2lk/x2nh5/WUoDTu1aHkf/XgwSJTDGD9xQR6hqm/nHUPHElh4j+lDuwmwANMejitNASgngjxuE18RAW5KPH5dMnZp5Yae93VL8xH2AkN0HDD6BeSm6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwhoX+tq; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwhoX+tq"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4843c41f35bso218081f8f.0
        for <regressions@lists.linux.dev>; Wed, 02 Sep 2026 14:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788384706; x=1788989506; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UaW+NnApz0iuwtAB6zb65SHy4anzMmX+6fXOJdC4/tA=;
        b=AwhoX+tq50dg3kmzY59LknJlAGODb1XbZ9ZyoBgeyzGja5TQpF2IAoeL2Sdf8feTXT
         QEf1skYiys+AIuqqwI/A+OSEeFqLaw/nbuBZTPPpDfvWYTN/cGqRPX5lbTBqILvCJj7o
         r/Kd1y83TkTk737dpmQrwRCNVv2PWN1Ot6QiRUJGomYOQvvbEKvLA9t8m6M0acHcFJBf
         yJEIHLqZ2VVqoEYbri+z/jQHA/6R8Jr0+u3JgSwZobP+4081foh7Lb11FZUYeEYazc3p
         SIi7TLa4W7mrJNSMTMGye0ET6F4NLDXShVFfY6xwYgxBLiCLe6SUD60fb7B96OvZXpSy
         rcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788384706; x=1788989506;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UaW+NnApz0iuwtAB6zb65SHy4anzMmX+6fXOJdC4/tA=;
        b=k5GMfS87tsQiJXuZq7Hv40G+YjElPVPJGNK5ojD5DODjRR6VwttlOm5cf6kRlCG2nD
         rfAqyKGF99LN0ilm6HXc8i9vFr4jO32ReavrsIJt6aFjgipbog/OFgPqu+Zvb+oUcyHw
         AfEK/0NKOoIhMigQbnC4kFvHbf931jKEx4xoAF/WrbomL3+hLMD093jtnUHagfNJJyYQ
         iIyPpjru3CAIASNXHvOF8Ny69saQS7z6qq57tb5SijGKkBm8/xRX6nX7mQVM2POR1sin
         wlWTPGx1xaelV2Lext16zJslPi0KUfmsP2Karv7tX8tLM7/rW8EzjyUCao8rhhom3U3V
         H2VQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQjbenwLivV8LA93Rbkobl94g0rbAFmVJdg4VK4RBCXWzcqZpQBtKu6FWYt8BWjCvWJKXD7pJolpJMVA==@lists.linux.dev
X-Gm-Message-State: AFuF++mgJcI8bvBeSyY7+hOf5eaotspVVOg77ATxaUDTZqQpWh5gZxoR
	goFxRAX5ZcZ2GWkcSdgvJCWEVxzt9csWCMTGbBhFWCSU8xhxG3LMij/A
X-Gm-Gg: AYBFou2/BdlD4kJrY4UpAlCE6erliCS/7VNTPDBugCkqOTjFomgTzeUDGw4sHVWpxUb
	iSfzqyoI5gA36r0L7yc5vuykNJBbvd/EKlRT4JzlPtUk31H7cE2R5ki84TvRt1a721+H+e/GJnK
	d2g7P3/gk5I/02YlmacjpTN/1OEv3r4RXJQJefHxZDvQZQhHSfOtQTHf3vTNjvzHkEefpprrNmy
	bypePQCexy+Drj1gStm6jRB13yMNYvTi7dRZ90WBnqjGERn9EMaKi3bfr2LEnrSh8WRsi32x3cl
	3boEmWpySENa0NjYhkQzCDbKJLVVWBHOEqt3JTOd1yUZizL7HQp+Ic3+nkrpDGThWf0vsHjhHcT
	wYtwTqtJZ9q4Hy82nYR+jlmV7OL/+a9WujRJy0jnTJb3w1Rg4J5VQm2ZUj5RkXQfj4SvqWOyXBP
	4+D+d5fP8S6Igbr53YHm2PtVmzMQEA/tArW3tQ8Qjy7AXUEJJ3SiJx+UNFIcCKcqF+RJQlKKwvc
	zyHT9nHIBd/2nw35Gz4OykvyHuvlpUk6/w7hG+VgRtSrn9wnD9awsOoIjGdBxy3xubpY6h2TChP
	xFoYrUFl5s/FlXgilP/kGgg=
X-Received: by 2002:a05:6000:4a1c:b0:47f:ece1:1eca with SMTP id ffacd0b85a97d-4857e3cafc3mr4353499f8f.1.1788384705864;
        Wed, 02 Sep 2026 14:31:45 -0700 (PDT)
Received: from ip-10-19-79-40.eu-central-1.compute.internal (ec2-35-159-55-138.eu-central-1.compute.amazonaws.com. [35.159.55.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7f8f9sm9018342f8f.9.2026.09.02.14.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:31:45 -0700 (PDT)
From: Nikita Taranov <nickita.taranov@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: futex: private hash can stay on the shared atomic refcount indefinitely after auto-scaling
Date: Wed,  2 Sep 2026 21:31:42 +0000
Message-ID: <20260902213143.3426531-1-nickita.taranov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902075604.A_-jz823@linutronix.de>
References: <20260823150046.204417-1-nickita.taranov@gmail.com> <20260824160337.0IvfKx8A@linutronix.de> <20260825170605.2462933-1-nickita.taranov@gmail.com> <20260901230559.1978876-1-nickita.taranov@gmail.com> <20260902075604.A_-jz823@linutronix.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> How bad is this in general? Do you have a workload where you fire a
> process, create 128 threads and then seconds later kill the whole thing?
> I would imagine that in general it is long living process and once the
> "final" privat hash gets installed, it remains…

The problem was originally observed on a synthetic benchmark that pretty much
did what the first repro does. On that benchmark, it was really bad as you saw.
I've never seen it on a real workload, so cannot comment on that.

Speaking of the benchmarks again, by "never recovers" I meant time ranges
comparable with the duration of the benchmark itself (few seconds).
For example, running the load continuously and printing throughput every second,
v7.2, 192 threads:

  9.0 3.4 3.4 3.2 3.4 ... [169 seconds at ~3.4] ... 3.5 24.8 34.6 34.7 34.8

So it recovers - after 169 seconds. Six further runs of 300s each, same
configuration, time to recovery:

  14s, 33s, 165s, 280s, ~300s, and one run didn't recover within 300s
  (it peaked at 6.9 Mops/s against 35-65 in the others)

The pre-sized control run at the same thread count is flat for the full 300s.

So the accurate statement is not "it never recovers" but "it recovers after an
unpredictable interval, sometimes seconds, sometimes several minutes, and the
process runs ~10x slower until it does".

> It depends on v7.3-rc1 and should keep new waiters blocked until the new
> hash is installed. I also added wake path assuming they will continue to
> matter what. It might make sense to do this on the wake side only.
> Does this do anything?

Yes. I built v7.3-rc1 twice on each machine - stock and with your patch, same
config, same LOCALVERSION.

Stalled runs out of 8, per thread count (auto-scaled vs a pre-sized control):

                          stock v7.3-rc1        + your patch
  Xeon 6975P-C 96c/192t   8/8 at 96,128,192     0/8 everywhere
  Graviton4 Neoverse-V2   see below             0/8 everywhere
  AMD EPYC 9R45           0/8 (never stalls)    0/8

On the Intel box the 300s continuous run is flat at ~36 Mops/s with your patch,
against 4 Mops/s stalled on stock. No hung-task splats in dmesg on any machine.

Graviton4 needs more than 8 runs to say anything, because it only reaches the
state a few percent of the time. At 192 threads, 24 runs per configuration:

                          stock v7.3-rc1        + your patch
  threads all at once      0/24                  0/24
  waker creation over 3s   4/24                  0/24

I'm guessing your patch was an early stage draft, but just in case let me flag
one problem I saw: on the Intel box the futex selftests regress:

  stock v7.3-rc1     14 passed, 0 failed
  + your patch       12 passed, 2 failed

  futex_requeue      requeue_multiple:
                       expected 10 == futex_cmp_requeue(f1, 0, &f2, 3, 7, 0), got 0
                       expected  7 == futex_wake(&f2, INT_MAX, 0), got 0
  futex_requeue_pi   2 of 24 fail: broadcast_owner, owner
                       "Test terminated by timeout"

stress-ng futex was clean, so it is specific to requeue.

Happy to test any following revision on these three machines.

Regards.
