Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4783515D2
	for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 17:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787677571; cv=none; b=md756L4ZYdFR512cZsa58JVMnniJPhGARrN/mqZdOz5r6yboTTMlDLNuSE74GciVfhBs15SSGD0Oc19MD8lpQzSEr3bmnZ5MEOyjQRodAgBBiXES2lDl78PHYhFTYkPKYiu2UlidkP0qIMFdc9W0NY8vuUR+66U/dqiFVPjzDa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787677571; c=relaxed/simple;
	bh=Hnau623AN6tw9BwGa3FjSA+P7N8Ig8R0aZB5p+5ZRGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGBozLKnhElvMEx1CHh7dcJ00R1c5wVenoO3FzWq+ccgfjgrvtMmcCRXjRZTnL39kC2O/pEF1aEqIB0tDHNKO7lk2hwR+4EjqvQEo0abMcCHEpTRvNDQNywS0om0q0XV7QwA9kkMUCRv16cgGMW2OqnUcL2KxuCzP0P988ayOcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1N+ndL0; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1N+ndL0"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so584175266b.0
        for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 10:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787677568; x=1788282368; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KudbG89fOLrydIxnFaLSqgwE/pyi6a+0V2HarZsOPgY=;
        b=n1N+ndL0a0iEXp7HjRmwgkghgOj+7FEuyNN3wkt0B/NvaZ4ELBa6nqo8xAGikHDFBY
         jWVcprSSqrd1QmzD+63qzVI2eotlN/4riGfPzKybAyBXiaESZx/HE0S71+owzBnUOE+V
         c764KJZLlbUS4I/awNgj5RAT2+vqw5AaxtB2nr3wgh7hIZd9vIu2Qijj8pHEq1FH5Tri
         sEAHIfw6wF1ckwpcj9BF4xtyH7fGhle7dfkTNR2m/FEIdluByIr6RTz8J0vTUqrR+GDy
         lp7Up8uEFGqbiCcEEqqoM7R/qCheRJ3XNfwdJutI525yOq2Mu+Tv8IsvwZrr7GLXyEMi
         8L6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787677568; x=1788282368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KudbG89fOLrydIxnFaLSqgwE/pyi6a+0V2HarZsOPgY=;
        b=s+3mBiooYSxtV9I3rrfCesinbYs7h2X0ah/9rxuwxgb895dtOzpup9W5DS4aoLXUxo
         XUl0GCDBSOK3M6VlGb6YlYegrntIFZ5WqIgSYKKV7AVisRfFVG7RAMDKV0rzVgtJD/Ku
         HOObn4igdHxjo3nC7h9J0TuQ85QV5za/FgBejHbebRZw9hvrQmYj+F4a0PICxmdGuK9e
         riBl1fEiB0mvnOXVw97DQ8uQ6zowazpYjrtQUqk9leaxLNFyrJ2o2oqhpu8DBKr6i1gd
         q74+wt8weueAiPPdjIxqYxXXMdninUSrskVowu4YOJwDIpNIx7106QK1RhWxquy3PsOk
         TzpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvbMDMJLEUErdvVv9xQbCGcL1Y2QgDP0zutK5mHZH/glM3r3c4dXqjUHF3NJTe830Qy+XJkbDRMUrnbg==@lists.linux.dev
X-Gm-Message-State: AFuF++lpC32CTyVeQLGhfswAM54sGai4PSfRPOYdTIv2w1VaMQ0rco3L
	wLk/tBXmqrhN7yZk1doLnUSrOh+F6wQJvexkGtXtQFuLGrDAPKC4P0U1
X-Gm-Gg: AR+sD13Uz6SBUzbZxSkURQuvbirTtm/5LnSsUutfHDCnZHIvL2WNyxAfwm1OIqh6PBs
	X9Z/6lpGFpiWMfzx4QxPTH6vC6rilvPm48n5R/QwRkzm5frr427PImEsOdsT7tFyhkNPh3KG3h5
	ux+bpJNOwXABoRZToEJ6Vg6lzC6YBuCl2GA6DFtsUUCKQGeZ4M2408+acc4XCI9evnEcfKwTuyu
	PqBHEiaP646+vuOskdIFmOVNRUg8rbETloieIc6o4sUG9U0TMilxMJ752urETwHaiLhCWadhMCG
	bDm6WqJCHajJS+oyjgV0TCmNpgDQ1w1cOHNzL6XMSnpRIw7mDgYoGr257Zn/9qY6a1+JHDkSCQa
	8y7IKdd7KQ5KcIuZEUfZVXjiYWUH6Vaa88jBlGw6WaB/iaOawJLBIIMyDf5kPxjFCKN9c5v9Wlt
	amjXuBxdAHdph7AY8ypA2H8OO9IzbVHmb3+ZAnkTJ5fTm/LsXM4nEZ21DgsCdRaNj7XFEzH3Oqm
	hNsGNNjRrWC3SPCO5YyHhIeX7K6PRd5aY9sATak8pQdVs62u38Yw64vkS2mMrK9rYL83FDQiE75
	4+DqOQ==
X-Received: by 2002:a17:906:6a0b:b0:c15:f0b8:eb91 with SMTP id a640c23a62f3a-c250bb45e31mr11385066b.7.1787677568261;
        Tue, 25 Aug 2026 10:06:08 -0700 (PDT)
Received: from ip-10-19-79-40.tail983ac.ts.net (ec2-35-159-55-138.eu-central-1.compute.amazonaws.com. [35.159.55.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a73038asm39689766b.26.2026.08.25.10.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 10:06:07 -0700 (PDT)
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
Date: Tue, 25 Aug 2026 17:06:03 +0000
Message-ID: <20260825170605.2462933-1-nickita.taranov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824160337.0IvfKx8A@linutronix.de>
References: <20260823150046.204417-1-nickita.taranov@gmail.com> <20260824160337.0IvfKx8A@linutronix.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2026-08-24 18:03:37 [+0200], Sebastian Andrzej Siewior wrote:
> It is not as bad as you describe. Could you try v7.2 which has commit
> a734d9fca84e1 ("futex: Optimize futex hash bucket access patterns")
> which might help to settle the counter.

I built v7.2 from the release tarball and booted it on the same machine.
It does not change the behaviour:

  # v7.2, 96 threads x 5 s, numactl --membind=0,1,2 taskset -c 0-95
  threads=96 slots(start=0 set=0   end=512) 5.01s   12.0 Mops/s
  threads=96 slots(start=0 set=0   end=512) 5.01s    8.1 Mops/s
  threads=96 slots(start=0 set=0   end=512) 5.01s    9.8 Mops/s
  threads=96 slots(start=0 set=512 end=512) 5.00s 1128.7 Mops/s
  threads=96 slots(start=0 set=512 end=512) 5.00s 1128.1 Mops/s
  threads=96 slots(start=0 set=512 end=512) 5.00s 1128.2 Mops/s

Unpinned, as you ran it, is the same: 8.7 / 11.5 / 11.4 auto-scaled vs
1128.2 / 1127.3 / 1127.6 pre-sized.

I rebooted the same box back to 7.0 and re-ran the identical commands, so
the two are directly comparable: 9.8 / 10.2 / 9.4 auto-scaled against
1023.2 / 1022.8 / 1022.7 pre-sized.

> You might have hit the sweet spot with your CPU. I have here a 144 CPU
> box and

Yes, this Intel host is the only one where the repro worked for me:

  ratio = pre-sized / auto-scaled; 4 s runs, threads pinned to cores,
  pre-sized to 512 slots; kernel 6.17

  threads   Xeon 6975P-C     EPYC 9R45      Graviton4
            96c/192t SNC=3   96c/192t       96c/192t
      2       1.0x             1.0x           1.0x
      4       1.0x             1.0x           1.0x
      8       1.1x             1.1x           1.1x
     16       1.1x             1.1x           1.1x
     32       1.1x             1.1x           1.1x
     48       1.1x             1.1x           1.1x
     64       1.1x             1.1x           1.1x
     96      81.8x             1.1x           1.1x

For reference, the same test with different thread count and placement:

  placement of 96 threads              auto-scaled   pre-sized   ratio
  96 cores, socket 0, mem interleaved       14.3       1048.2     73.3x
  96 threads on 32 cores, one node         334.8        349.2      1.0x
  96 threads on  8 cores, one node          85.6         87.2      1.0x

One more thing that may be useful: whether the pivot completes is a race.
Ten runs at each thread count, 3 s each, on v7.2 on this box
(stalled = under 100 Mops/s):

  T=24   stalled  0/10    259.3 249.3 261.3 250.0 251.6 ...
  T=32   stalled  0/10    334.6 332.0 335.3 326.5 335.3 ...
  T=40   stalled  0/10    415.3 300.5 415.7 389.1 416.3 ...
  T=48   stalled  1/10    251.2 423.8 482.1   6.5 410.8 ...
  T=56   stalled  8/10    526.9   6.2   7.0   7.0 540.0 ...
  T=64   stalled 10/10      9.4   8.6   8.0   8.5   9.3 ...
  T=72   stalled  9/10     11.7  10.7  12.2 331.0  10.1 ...
  T=96   stalled 10/10     11.8   9.4  12.1  12.9  13.4 ...

> Not sure what we could do here. One idea might be to block further
> futex syscalls so they don't acquire a new reference on the existing
> hash and allow a transition to the new hash more quickly.

I am happy to test a patch on this machine if that is useful; it reproduces
in about five seconds and the difference is 100x, so it should be an easy
signal to read.

Thanks for looking at this.

Regards.
