Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3F61BB6B4
	for <regressions@lists.linux.dev>; Tue,  2 Jul 2024 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719934094; cv=none; b=mFtMKihCMRFhWPsJwe6KcXkNIjFFCKtovO1aHgC2bzJbqr2fHVuQMYKS+HPvGTVSY3Tz/4LyzgTX5LeTi+KuQY9cmBPtL7NU7Uvz6QhKYXyP6Z29NWq2Epv0gr86Lu1f9tY9cCQphFfO/ugXYNUdLWwGXZPjTB76wmOzxvMnjCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719934094; c=relaxed/simple;
	bh=k0eh3p6qPcP7dC2h7ien1wFzUSgMua9EcLtjou/ga4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GGABaWw7XbJxem6bNujFyMe0AuVqm99aRMcpJvH/qZoHEtak30xZmIIb4W9ENArxidFp+KOyyN8GL/D+IYqpnPW9pWLB8yBZ3z3eWzG7Q2VUmkWzenQdZuD5EPC1Rj9ZrUxUaqPDYHQyYQr9idNyVAlsdWDEGQn7Il6gc60ZYgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2gm9N+T; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2gm9N+T"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6b42574830fso19937706d6.2
        for <regressions@lists.linux.dev>; Tue, 02 Jul 2024 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719934091; x=1720538891; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0eh3p6qPcP7dC2h7ien1wFzUSgMua9EcLtjou/ga4M=;
        b=A2gm9N+TcVvYYwn/ADgxTwRxjMRHoc9xZ/qQ7DNtNqduZ1GXgxmD+IN2f1QAx3k5Ji
         wmLMQUb5qM+SPUVYyr0Vxg7hLKjsdVxh6Hs7OUHjb63hFyvVjYa0o6mhEPDcC1D7N2xV
         WDPCXZpt/fNumxa3ZkPzv+IyOtQdTtSa+FUnmtFtysWVdelQQdX9CfAucHyRUR7NvdZ3
         O0l88L9sTqu0i8mR5mrNs9kknypQlVLtQ5bNLfcIxvUu0kNmyXnGP0dIN0F/88LJNR+e
         uz40ZVFOol0P06PtsYkxQAapHgmFp9NdyMUgSRyfEFi/7vHtypOs7mIJqyU0xSqwpoTO
         aglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719934091; x=1720538891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0eh3p6qPcP7dC2h7ien1wFzUSgMua9EcLtjou/ga4M=;
        b=F1zkFlYRKhSdLeyzCB1U5+YmG9X+SatdepODfS2ZPG8VBSAMW5BzF7ukqgFbVMCvbA
         83V9Xv6D5HyVKkpVFrMMyBgkfHh7j06trMypxpDvG7XnFQHCV8aKx+pBC66u2xih5a3w
         pkD8VrIi5Vy48dhnr+oclVZS5rkXSHitT+1OEUZuDiIa3rin+JEWvmJulXyTSaPfWdWc
         ZDrf9rKFR3M9zVg3CbM0c2XhqeMha+ZQq+EK71YN9mEtgW4fvNir64tXGITfK2Ld9h5q
         3mn7V5nYEsLejT6XDkmWkCOM3z7qy8I4grvEilGdbBIZp1TgXBzki/zk+d68pzGp6wco
         6+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVNtYYuBLHhNwezU1iLml6I8bkpHSvuM/8sk+taTd0F2BJGrxvZ7NaunlJDEW/XIHR0YN6nePfr+Sjb9yCKxamwtsBf0gZCMLS6sR4=
X-Gm-Message-State: AOJu0YzzoQ2DbsE5RpghAmpItZYi2XwAdMZI20gr33ZWhbVIFJNFzFA3
	taJ5adO9NRJwCtDjNsKIAW83P3YEU88BTNI/e+08S9r/AgVOMrAlMcCmQzHtZ/KJgilN4esyiiL
	jsgaj/ZnzJhULSR25kCFUmO9RPu8=
X-Google-Smtp-Source: AGHT+IHvWk7453VuLpTof4HZQwUnMyUU2esYkvshRC3QIEhYFnMdUpYq7QJ+drdrhCZq+1pjXAE3cpY0ynuvrhfX/ds=
X-Received: by 2002:a05:6214:194a:b0:6b5:9c9c:a736 with SMTP id
 6a1803df08f44-6b5b704f0f6mr124222236d6.6.1719934091338; Tue, 02 Jul 2024
 08:28:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKbZUD1-kqfuV0U+KDKPkQbm=RwzD_A1H3qk_c+bw92CqtMbuw@mail.gmail.com>
 <20240702003343.2756828-1-builder@example.org>
In-Reply-To: <20240702003343.2756828-1-builder@example.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 2 Jul 2024 08:28:00 -0700
Message-ID: <CAKEwX=OCgzPKzCN_bvK9Y6qy1uHVDrHqbCDaYZH1iDpoWFdmgg@mail.gmail.com>
Subject: Re: zswap_writeback_entry crashes in 6.9.5
To: Builder <yshuiv7@gmail.com>
Cc: pedro.falcato@gmail.com, chengming.zhou@linux.dev, christian@heusel.eu, 
	hannes@cmpxchg.org, linux-mm@kvack.org, regressions@lists.linux.dev, 
	yosryahmed@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 5:33=E2=80=AFPM Builder <yshuiv7@gmail.com> wrote:
>
> On Sun, Jun 30, 2024 at 10:58=E2=80=AFAM Pedro Falcato <pedro.falcato@gma=
il.com> wrote:
> >
> > Hi everyone,
>
> Hi,
>
> I think I have hit this problem a well. I actually reported this on RedHa=
t's
> bug tracker a while back, along with a couple of stack traces:
>
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2275252
>
> Reverting the commit I mentioned there seems to make this problem go away=
 for
> me. This is a long shot, but I am curious if it will also fix the problem=
 for
> you.
>
> (Also inserting myself into this thread so I will get updates.)
>
> Regards,
> Yuxuan Shui

This looks like a different issue. The hang-up is one task waiting for
the mutex lock (&acomp_ctx->mutex), whose holder is the other task
that crashes. Looking at that trace in particular, the line that
triggers the BUG_ON call (mm/zswap.c:1395):

BUG_ON(crypto_wait_req(crypto_acomp_decompress(acomp_ctx->req),
&acomp_ctx->wait));

is the compressor failing to decompress the data. This looks like some
sort of memory corruption, and could happen for a lot of reasons - a
zswap bug, a backend allocator bug, a compression library bug, or a
hardware issue that corrupts memory.

If it only happens on 6.8.9 (and not 6.8.5), then it's likely some
changes in between, but I'd be very surprised if the bug somehow comes
from the patch you reverted. If you look at the patch's content, all
it does is essentially handling the case where the shrinker receives a
NULL memcg, by using an alternative source of stats. It could
potentially reveal the problems previously hidden, but definitely not
the cause of those problems itself. I'd recommend that you send a
separate bug report with the build config, steps to reproduce, and
more information about your setup overall (what backend allocator are
you using for zswap - it should be zsmalloc btw, what compression
algorithm you are using, etc.)
