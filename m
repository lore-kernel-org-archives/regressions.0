Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E531ABCAB
	for <regressions@lists.linux.dev>; Thu,  4 Jul 2024 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720091945; cv=none; b=Iq3HKSkvM8YMKTAHDz250Ct1FIwT3c3s1OksfvziCfvqSNT5XVkH+FknzI/efDEAGcb8qvUAlh/Z6lpe5kG35iYkm5a1Wi9dc7nWl6cdn2NaexUHoGn1mHs/hpjEC6OG3WRD/nWr3zQwDgAwTigRWLZX3FUAkhfLH5CaYewerwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720091945; c=relaxed/simple;
	bh=GCT0mvqtioHryCpvymDplb3ffd2k3pxu02LXeW77bLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uuNqL1V+lCOgzqXXxKwCORYJBQtI6bhGqii4IV/nKIpLZpBhFeGamGAMjPSBPjZREP1H1xXONkVIXByEMcP7kaRSpSJlpG2adhMmKBGyD5uAN1iACEMd+DASf2i3SYNlDi3Grn3GAmuk2fNN7Qp+NyAqghJEYQvADfdh4SG+W6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UA7C61Ib; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UA7C61Ib"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6515867cf33so4299177b3.1
        for <regressions@lists.linux.dev>; Thu, 04 Jul 2024 04:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720091943; x=1720696743; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fNCmxKLZEKdnaIo1lzCkGEq0IJ2TD99MH/XAb7ZGOQc=;
        b=UA7C61IbA6TeN+GIbov4yPkj4SCWb0FmGw6tfn2BfOmY0YScMRZSqG7Rq8xGUam2zH
         QzKCJwivGTLqjjWjm9tP9b7PTn6USO4JPH3WwvoYWsJ1MlwhXcsObdKqVJCFgoXPPd3H
         ZorgXJfsYSJyt7ebefgTdah/RAJjIpI7Plr5DwSPa1hhOwXUhqnFZjQvWDZMxHo3/2dH
         O6Qb0L3sDs3UsEauvh0eH8gBQZtz2WC9q3ovJnTh7qQH8azxegDwHGJqXWdjaCK0OIX2
         FbnMbyPM9VnV4Auiz4nHLGFzHF+3iswtxGS78vENQ1W5iobDhxGPyMhw6oFKkVWuCspP
         RJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720091943; x=1720696743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNCmxKLZEKdnaIo1lzCkGEq0IJ2TD99MH/XAb7ZGOQc=;
        b=wGbKzuBMKQnQrg18ntGgksaSH4XzFGCEE3Al+ur1HkoRCMM47mmasYAYhuf2o8qRZg
         NlfPiy0o2tiQkntl2G/4p1AbusWh9poKXXf6dcVXEtC/AkHTTXccfoDSp5yenDZuIojb
         7jI62pZZrFmbMK5aG98ZWUchxvled2YM+FkMr9HSW6Ybwj1LfWulFscYjy/RCDYFSJKQ
         XIuNhN4hPXEEh7ZL0QD6+k3XpBDxvFbPhUBkRZ8M/H7vaEipmylg2IffJFz9t/I9HNX2
         ThMNhYgJQRx4T3utcFs1LeLOzYzpz0uOaRJmxkMNz2+5eb8/h6XfdCxLUPIqPFBWzSq9
         PmOw==
X-Forwarded-Encrypted: i=1; AJvYcCW4RmL0xNcXDBx76Dt5+SRCg7q51PUBERhlTe35ktN1CqwF9Ze95HYas0Igsxn6pGZtHSMDIFlPYRnKPnseZKqNoU8Y44kZWxA7Qa4=
X-Gm-Message-State: AOJu0YwSZVwcvAaIxM6Vf0Yv4c6Bm9cBrboBhEb3ECp3Qippt3o/aLIP
	7rWM04fbUmaWuPZF/DUd10aFtLu6RDFHNn3r0RcJr0yH1qqnBV1Fy8nWn8UUJZLQbAgMUywWlgD
	mCUHn1mpcSEVfVqw8VIJG+/A27U0=
X-Google-Smtp-Source: AGHT+IF2+QptZ2rBGc+sGQL3cR8V9h89I+bSi+rn6CRax7iFo5NdO1YA6DZd3WbbDoPf4L2Oi2e81nz0cOU2hWQjIqg=
X-Received: by 2002:a0d:e605:0:b0:64b:a57:8441 with SMTP id
 00721157ae682-652d67c500bmr11259537b3.19.1720091943252; Thu, 04 Jul 2024
 04:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsMmmb36ym8hVNGTiU8yfUS_cGvoUmGCcBrGWq9OxTrs+A@mail.gmail.com>
 <CAL3q7H4yBx7EAwTWWRboK78nhCbzy1YnXGYVsazWs+VxNYDBmA@mail.gmail.com>
 <CABXGCsMWYaxZry+VDCgP=UM7c9do+JYSKdHAbCcx5=xEwXjE6Q@mail.gmail.com>
 <CAL3q7H7Xb9FQx-5PMQtK_-reMq-cbfysCx6s-ZOWL1FUPSm8sA@mail.gmail.com>
 <CABXGCsP9tSwgR4dN-k97maqHB1KOtykakmHNz78SYbAuHydUTQ@mail.gmail.com>
 <CAL3q7H6vG6PEKjcsXtSuq=yks_g-MczAz_-V96QSZCs9ezRZpg@mail.gmail.com>
 <CAL3q7H5RC6dinsA2KLtus07jxDuY1PecPXbhYOWtW+nVyzXwuA@mail.gmail.com>
 <CAL3q7H4MiarsqxSMc0OzY2TNRk8J7Lg+89MaPHY2+NPO-EcDgQ@mail.gmail.com>
 <CAK-xaQYYx6SPQaOVwL+ardB0y5LzYJw9a_hfWWtVEZ=y1rXq5w@mail.gmail.com> <CAL3q7H74jpSoMvvkSvmrtB_VGiscz8zN5aHnApWuYU+hpKe+rA@mail.gmail.com>
In-Reply-To: <CAL3q7H74jpSoMvvkSvmrtB_VGiscz8zN5aHnApWuYU+hpKe+rA@mail.gmail.com>
From: Andrea Gelmini <andrea.gelmini@gmail.com>
Date: Thu, 4 Jul 2024 13:18:46 +0200
Message-ID: <CAK-xaQagqS0kePozkim7sB_Zi+8NrDRnbqFuLVQ3s4F+0WZ+DQ@mail.gmail.com>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted increased
 execution time of the kswapd0 process and symptoms as if there is not enough memory
To: Filipe Manana <fdmanana@kernel.org>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>, 
	dsterba@suse.com, josef@toxicpanda.com
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 4 lug 2024 alle ore 11:49 Filipe Manana
<fdmanana@kernel.org> ha scritto:
> I'll try that soon and see if I can reproduce.

I'm creating a qcow installation with everything, to replicate this.
Sorry, it takes time.

By the way, it's just me? (latest git master btrfs-progs)
 btrfs-image /dev/blah-blah loop.dd
works perfectly, but
  btrfs-image -s  /dev/blah-blah loop.dd
generate an image impossible to mount:
[gio lug  4 11:20:05 2024] BTRFS info (device loop40): first mount of
filesystem 496b800d-2f32-46bb-b8d0-03d6f71cf4b2
[gio lug  4 11:20:05 2024] BTRFS info (device loop40): using crc32c
(crc32c-intel) checksum algorithm
[gio lug  4 11:20:05 2024] BTRFS info (device loop40): using free space tree
[gio lug  4 11:20:05 2024] BTRFS critical (device loop40): corrupt
leaf: root=1 block=40297906176 slot=6 ino=6, name hash mismatch with
key,
have 0x00000000365ce506 expect 0x000000008dbfc2d2
[gio lug  4 11:20:05 2024] BTRFS error (device loop40): read time tree
block corruption detected on logical 40297906176 mirror 1
[gio lug  4 11:20:05 2024] BTRFS critical (device loop40): corrupt
leaf: root=1 block=40297906176 slot=6 ino=6, name hash mismatch with
key,
have 0x00000000365ce506 expect 0x000000008dbfc2d2
[gio lug  4 11:20:05 2024] BTRFS error (device loop40): read time tree
block corruption detected on logical 40297906176 mirror 2
[gio lug  4 11:20:05 2024] BTRFS warning (device loop40): couldn't
read tree root
[gio lug  4 11:20:05 2024] BTRFS error (device loop40): open_ctree failed

> In the meanwhile, just curious: are you using swapfiles on btrfs?

never used on BTRFS (i have a dedicated nvme partition).

Same effect also disabling the swap, btw, and thp.
