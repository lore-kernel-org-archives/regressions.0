Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFD21B5835
	for <regressions@lists.linux.dev>; Tue,  2 Jul 2024 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719929615; cv=none; b=rRw8ksM46GJJRQSWcKfJgKkwlaGQcuKmCUuEB9clWFjZMABLuIBRmJE44PixN/7JvT1R/nZzVjqdFEXAKCCFGFc+ulTeubavBr0xUO4NGu4JhJUlykryWEcLpS4UQeZlIssrRK6Ct+yS6fJ7+g3+zKyQMELsLrPkHZmlpGMKnZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719929615; c=relaxed/simple;
	bh=nyiy8AT5jGhchwJjyM4q1iEH8XKHmHgh3pCJbFwSXEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ouLBqRXwEtffi78ACHylgX3d6d6OHOHA5elmotV7UAIVAbI47bKD6eYnz3NavvhYgwsQ5JZzdd/aqChR7jhVv2P9STNniOzX19noH0V7uMSIxFMZEs8WiMLVv2xif7uatX5fzBL7/BhU1wL6X4FcDEgXN8kMJ3d9HvY6xx+aOuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFzjbGBP; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFzjbGBP"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6b58f875e1fso4938086d6.1
        for <regressions@lists.linux.dev>; Tue, 02 Jul 2024 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719929612; x=1720534412; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRkiN3tNig0E9yCGyOzoW9HEt2shQBH+E4YeHpZOoTI=;
        b=PFzjbGBPHZ3z4nDULEdPjmGCrbek9x/GSF/ujdPaic5yrKm17+dpQIzbDI6PTLWZWx
         IKYOruyYWNoQs/RgdWBp9kkunEUMuelPSw+pl59whQMOoRM8B3jY9mC/dEdVVuymxdD0
         Yqp1Z7NYzxScwEqjK5XakH38WWPjolwAWYdLfbXPNNHuKELHXHZmjpF4lknpPoYJjxq/
         gKHIo6VgUHufgtm5iR47ERCYh1mcBd06Ei49VxHbNPw3TMZCDexoI7LhXAcQXkUwWKK1
         WRLkoRDbXkkZQrWxgj+zC7h6abwa6HSuRruQWX1M+8mY/sJ4BShAgqwpeMAN+Jp4UteT
         g1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719929612; x=1720534412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRkiN3tNig0E9yCGyOzoW9HEt2shQBH+E4YeHpZOoTI=;
        b=Y8vAU6tbaHzZrvyppyaCUbbeDqrGRGoONUU7u0CZvQXIkNn0GJw/nT90CaJnbNB7tI
         m+FIRpiwCZupc6MH5L7o2dWrKdhcCo/PTlvmAITFtnczq7NWAhlqkW8axu4cHQmCcrfJ
         4B2xOny7tQjk2zZ4z4+BqKpUTbO02JW42WKqWx5e/yDtTe/iJZolkAWIyjJaTAyu0hAT
         9aw+ViWEux2keE3JxLJFvTdTFYFYdwdiB2G8g05CgNBnqzuFwGXby+K1mV/dUc1sPCuI
         5k1tZrb2sQMNhwTp4u4MLXQD7k31gGFsj3BpNw5DBr3xhY2yXRJKJC8xF04IKU2X1YuG
         OsUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOCLLCc3H490QHLxrpC/qFE/zyMmVduBWr1FmLhJ2d6ZfhJDz6X6XvEhrtCDc3hBXqqI3WT09f3OAanz4PfoqLDrRe9YtperrkEvc=
X-Gm-Message-State: AOJu0Yw63GU1B3FoeSwuPyhcj0QwbwYEtyPsTSY4iyYJBZ8NWNj4Y9oT
	pkPYLcWodwtaDnEuUOuBaGUZ3CxO34P4Gw0Ap7Gfs8wS2XCx9ZaKQ8t2VJqKu3vXxPsUKgqcogG
	IghGDG6czqUIL/cmSo3yNXpXVh/Q=
X-Google-Smtp-Source: AGHT+IHR8tWm3As7EFimYegkJ2aEH11DJZlSqpt7hxp2toPtKiyzrb5SnNq0dyiEPvt5NEjoGvgT61ZwQZfb/E9fudo=
X-Received: by 2002:a05:6214:5016:b0:6b0:6370:28d4 with SMTP id
 6a1803df08f44-6b5b71f6644mr97861346d6.6.1719929611963; Tue, 02 Jul 2024
 07:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsMmmb36ym8hVNGTiU8yfUS_cGvoUmGCcBrGWq9OxTrs+A@mail.gmail.com>
 <CAL3q7H4yBx7EAwTWWRboK78nhCbzy1YnXGYVsazWs+VxNYDBmA@mail.gmail.com>
 <CABXGCsMWYaxZry+VDCgP=UM7c9do+JYSKdHAbCcx5=xEwXjE6Q@mail.gmail.com> <CAL3q7H7Xb9FQx-5PMQtK_-reMq-cbfysCx6s-ZOWL1FUPSm8sA@mail.gmail.com>
In-Reply-To: <CAL3q7H7Xb9FQx-5PMQtK_-reMq-cbfysCx6s-ZOWL1FUPSm8sA@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 2 Jul 2024 19:13:20 +0500
Message-ID: <CABXGCsP9tSwgR4dN-k97maqHB1KOtykakmHNz78SYbAuHydUTQ@mail.gmail.com>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted increased
 execution time of the kswapd0 process and symptoms as if there is not enough memory
To: Filipe Manana <fdmanana@kernel.org>
Cc: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>, 
	dsterba@suse.com, josef@toxicpanda.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 2:31=E2=80=AFPM Filipe Manana <fdmanana@kernel.org> =
wrote:
>
> Try this:
>
> https://lore.kernel.org/linux-btrfs/cb12212b9c599817507f3978c910276726762=
5b2.1719825714.git.fdmanana@suse.com/
>
> That applies only to the "for-next", it will need conflict resolution
> for 6.10-rc, as noted in the commnets.
> For a version that cleanly applies to 6.10-rc:
>
> https://gist.githubusercontent.com/fdmanana/5262e608b3eecb9a3b2631f8dad49=
863/raw/1a82fe8eafbd5f6958dddf34d3c9648d7335018e/btrfs-don-t-loop-again-ove=
r-pinned-extent-maps-when-.patch

I tested this patch on top of v6.10-rc6

> Btw, besides the longer kswapd execution times, what else do you observe?
> Is it impacting performance of any applications?

I observe that the system freezes under load.
Demonstration: https://youtu.be/1-gUrnEi2aU
The GNOME shell stops responding, and even the clock in the GNOME
status bar stops updating seconds.
And this didn't happen when the v6.9 kernel was running. Second, I
spotted high CPU usage by process kswapd0 when freezes occurred.
Therefore, I decided to find the commit that led to high CPU
consumption by the kswapd0 process.
As we found out, this commit turned out to be 956a17d9d050.

> I think no matter what we do, it's likely that kswapd will take more
> time than before, because now there's extra work of going through
> extent maps and dropping them.
> We had to do it to prevent OOM situations because extent map creation
> was unbounded.

Unfortunately, the patch didn't improve anything.
kswapd0 still consumes 100% CPU under load.
And my system continues to freeze.

6.10.0-0.rc6.51.fc41.x86_64+debug with patch
up  1:00
root         269 13.1  0.0      0     0 ?        S    12:24   7:53 [kswapd0=
]
up  2:00
root         269 29.9  0.0      0     0 ?        R    12:24  36:02 [kswapd0=
]
up  3:00
root         269 37.8  0.0      0     0 ?        S    12:24  68:19 [kswapd0=
]
up  4:05
root         269 39.3  0.0      0     0 ?        R    12:24  96:40 [kswapd0=
]
up  5:01
root         269 38.8  0.0      0     0 ?        R    12:24 117:00 [kswapd0=
]
up  6:00
root         269 40.3  0.0      0     0 ?        S    12:24 145:24 [kswapd0=
]

--=20
Best Regards,
Mike Gavrilov.
