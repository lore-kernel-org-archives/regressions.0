Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E20D240236
	for <regressions@lists.linux.dev>; Mon, 13 Jan 2025 15:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736781845; cv=none; b=ZBtSRwWogNfS8kHkPK47e15mGBNMGUdjXBEJKPvHgZNA2MQAFZlbFcQ2/NSIfCYZfBNLTlv/0ws6oVdj9nCmNxjavl1PKcPvC3nyIbnPD7pLpQ2LxFtI0QF4tvdsGxrLLTee1mYRHkm2AW4r6rY3euN94mcvA5jJ+Gaxh1GKxbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736781845; c=relaxed/simple;
	bh=Y4C88y0bn7yemxHxuSxh2GU1VXk+r1LxVa7cPbs2r/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wwaw1a9+iPkY6LS8wbXVPGnfJiEq9+ujwmf4+tKDWLa3FoqiInJEoag29QBq5nfYj72xXPKXEhlxlz0JkSPH5MyDX0RSFgSEyC99wyrzy/gjgKNkuRPXhzn5wvlKCQfJAt/jJzFGxBP8od7/C29kHHurKpJZhgVLW2IceF2JD6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlYguDc4; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlYguDc4"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so6579983a12.1
        for <regressions@lists.linux.dev>; Mon, 13 Jan 2025 07:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736781842; x=1737386642; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g9hHRvdWIv3F+jnUoOkVpVXG9f4b9fdriEI3v5kii1U=;
        b=LlYguDc4sTAqmH4ewRKyLwsFwVilRP9/vKyZgmdq3+xIVr6CpWtGndgm0dxZiDEZra
         HP7gQiXel+GyQ1XxXAYzAEaxvAp2SWGufgL3AQPsp+gWKaY87/YkBklICPZLZp/WK+T+
         hb8EiBx+zY4LBeFFMmzjpJTnWmWUriMSXL8zsuso2XbqcGrY+jse/HMZQQ299ZJyfgcb
         lXux6cvpuwNj+8j9UTEhULrss2SDNCs/wpSNMhXfT4IhpEFK3D4gWLIeEk7bKeUnww8E
         tnvYKkzsQTk3UYM1WbaTp8LdH+xVjJ7GpyDKlWm79y+jz4C/ZBUnLm94jMKSxzy8YWm9
         w3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736781842; x=1737386642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9hHRvdWIv3F+jnUoOkVpVXG9f4b9fdriEI3v5kii1U=;
        b=SaKtCHxr99grwh6LYhQ6C3T+CIaACN/CYvu8M4QAupuHdbdDY8fR/4qLvxLaxWvsug
         HFWJyKonB3kZtypwKcZBoHLrMexz8pMG15czuwKM6vI+640kehw4UN48z/ayvQDmmM2B
         XgB6mvpdxwbqh25wzXrTvgR+XoX9X2kDfw5mTNi8CUJPiF8JURlNwh5JsIM9Hr4ETOAn
         zVzN3u9r9De1w+WhGTXrroFK/Iotv3r5MO6G/ppuJFdxdZ5fBjRobyT1KfQvKAwqQo7y
         LNTEGiRktMDL8xr88+5GLz1KqZJCCYveMAYfDvaFY7+jvztlAJ9EtYDgc7+0CJHAdwbl
         f+Rg==
X-Forwarded-Encrypted: i=1; AJvYcCW5AvP5QmmMgp7Wev9NqVZnKL8p79HBmBpfsZZr9ocUf9nPlUcrqGVwDPGvYypKcP3kcQhyUNPj95ws4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/JUtvAhwMWp6NaW3Tx/OFrZyGmKsl3aYP/Iurezgw4H8xx8FB
	jYMxAwBQga9kyNrT+V33ZxCeMj9GWVUA5OUi39iV3mA686WF062d
X-Gm-Gg: ASbGncur6hdqexiRdQRYVIqds+COg9fNZoxWW1rgklZiC0dmxW/YrPz3CKq/k13w1TN
	uHCbHfDFVnc/9xvxnjbfxe831n7AlBqkp8zU+JfjKf/TaPg7+PLkJimYpozOgY87AG4kxwK8+Lv
	MbONarZTgAkau1z172aaKlfJXMIqIRdSkfrri91z0zyNg290X3pVG7Jjj0bWs3j8++bIB3OsXug
	Gb0W9g/GF1F8iXcYDpXng/MpoJlAo89wdvYDFdYEh3x37O7/fbESXm1S5U7jsvelg==
X-Google-Smtp-Source: AGHT+IFp9q5BqpiqnmEIEQZ9KMekGm9HnKIKXgsVhC0LmjI6TvAV9EQs0D5RE2AFUsi6ms0+LgB3ew==
X-Received: by 2002:a05:6402:26cf:b0:5d4:55e:f99e with SMTP id 4fb4d7f45d1cf-5d972e1d7dfmr52385362a12.18.1736781841946;
        Mon, 13 Jan 2025 07:24:01 -0800 (PST)
Received: from debian.local ([83.105.230.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9134403sm522348066b.90.2025.01.13.07.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 07:24:01 -0800 (PST)
Date: Mon, 13 Jan 2025 15:23:59 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: "Lai, Yi" <yi1.lai@linux.intel.com>
Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
	yi1.lai@intel.com, syzkaller-bugs@googlegroups.com,
	regressions@lists.linux.dev
Subject: Re: [PATCH V2 3/3] block: model freeze & enter queue as lock for
 supporting lockdep
Message-ID: <Z4UwD64zKZqG_7gP@debian.local>
References: <20241025003722.3630252-1-ming.lei@redhat.com>
 <20241025003722.3630252-4-ming.lei@redhat.com>
 <ZyHV7xTccCwN8j7b@ly-workstation>
 <ZyHchfaUe2cEzFMm@fedora>
 <ZyHzb8ExdDG4b8lo@ly-workstation>
 <CAFj5m9+bL23T7mMwR7g_8umTzkNJa14n8AhR3_g6QjB2YCcc5A@mail.gmail.com>
 <ZyIM0dWzxC9zBIuf@ly-workstation>
 <ZyITwN0ihIFiz9M2@fedora>
 <Z0/K0bDHBUWlt0Hl@ly-workstation>
 <Z4Ulmv7e0-Q4wMGq@debian.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4Ulmv7e0-Q4wMGq@debian.local>

On Mon, Jan 13, 2025 at 02:39:22PM +0000, Chris Bainbridge wrote:
> Hi,
> 
> With latest mainline 6.13-rc6, I have been getting intermittent lock
> warnings when using a btrfs filesystem. The warnings bisect to this
> commit:
> 
> f1be1788a32e8fa63416ad4518bbd1a85a825c9d is the first bad commit
> commit f1be1788a32e8fa63416ad4518bbd1a85a825c9d
> Author: Ming Lei <ming.lei@redhat.com>
> Date:   Fri Oct 25 08:37:20 2024 +0800
> 
>     block: model freeze & enter queue as lock for supporting lockdep

I just read through this thread and noticed:

> The warning has been fixed by the following patches in for-6.14/block:
>
> blktrace: move copy_[to|from]_user() out of ->debugfs_lock
> blktrace: don't centralize grabbing q->debugfs_mutex in blk_trace_ioctl
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/log/?h=for-6.14/block

I tested linux-block/for-6.14/block with a directory copy and did not
get the lockdep warning, so it looks like it might be the same issue
that has already been fixed (?). If so, it would be nice if the fix
could make it in to v6.13, otherwise many people will get hit with this
warning, and end up tracking it down and re-reporting it.

#regzbot title: intermittent block/fs/kswapd0 lockdep warning
#regzbot introduced: f1be1788a32e ^
