Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868D01FC7F9
	for <regressions@lists.linux.dev>; Sun, 23 Feb 2025 20:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740344104; cv=none; b=kYq1uoPTrUuZyQdYgFH3mzDXNRT56BRyUqI8nMnOl1uTTHn9shq5He9LiG0vem2rGifccFzz3hNANQqEj9C+GCl72JG+kSDcfpXrGsuO4XeAmLIF90UItk2S+Uwpqx417LViQZkH/kM5Ka6vxg2U232WQn5NBBpBt0F7igEQ/1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740344104; c=relaxed/simple;
	bh=+HXFPjewlMNAg7XWH8v++wunTGFuJg/cfE3DU9ZIQHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TludP/MutbwwuGNxo8KWd2e8Mb+Ij0wRJl7yuNaqW6eizo87CgvahCOR8UTeSlAB43m4xNAMEyVJT19NvqmlzMxvJueqgklvQdS8g3Pl2AecjkgIzJxmeoSgJ6pceUdIqUi/qEVBJ7gib/3kvOT5S1ENCj+XhWEKymjpjXfQlBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2qBiQZBt; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2qBiQZBt"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30738a717ffso28891511fa.0
        for <regressions@lists.linux.dev>; Sun, 23 Feb 2025 12:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740344100; x=1740948900; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4bxYkQ/nsKJRs2jIrffultr9wOz+jQ/89XsqJiCc2g=;
        b=2qBiQZBt5sUlKvcpO/c9imU5mAEE7A8rqquJ7DSMUqmdzPEQ4j1Ca7P1gZP4eTCJna
         BvVzx6Iqp6ElGQbl61laQRNz0H5Z7Gy7h7b7w2ppG6oLo+S5Y5ph8bTBTqqGhGgHdB3T
         wtBseQBxeKfIAv/yzjTOhNKko3Xfmbk+YH6kFeodpRzZ0sLNFRvVTYwQSWrDgOrBQUyj
         i5KO7BLx3/VoDZmJXVeteslI3sjZMPb4v67uU44j7FS523YpJdWC6cpyZYRYS+uUNZnS
         pMbO7Xyb0kNpkHXoIWO0f4p93Q9uBoVw7UDBIZyIk9slZCC3rrG4CjYdbuAyVu9mRToq
         TLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740344100; x=1740948900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4bxYkQ/nsKJRs2jIrffultr9wOz+jQ/89XsqJiCc2g=;
        b=gM8fx45JYbx0SJQNCTGtgjnOCfRgFmYIdUCRwGoh0rRu8H2pnxRJK6lwGtlXmK97BR
         zGsw8OVJPCxSPSkv0f0QRrbIL10Hl0E4L0ieEjKvaSIonGqIFftBYvwjd106PUsRghps
         zDcW2pwG1iA1tz6MEeiwIQIiyLdWpFMMHJG7LgnreeQhhXt90CtuqTnpDbQzJfM3dKU6
         NmAqo1sjgjp3HQ5/XfeR6+8QHT+XAqyyzAzIq6PR46PMLNxWgB5o4KqZOlZ7OyJQ+VOz
         9/FJsTKV/r/6oH0s6d5805t8XcHKeSgI/nVZE20reHNplQ0Wg0/s1PGWmSkj7+kifSjR
         WaXg==
X-Forwarded-Encrypted: i=1; AJvYcCWUYMdCp8Dee+Vm1nyDJ6ttkBZC7OHDgkb2256lGPjlYbTezKgqCQscPnWxQuIJZZU7fp+7G3Zmq2fFLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGmlS86BORRD+C/6OAkAmAseNo38NewMd3r4JiZxnlFNHDUkVW
	TJquvTL7iyxVb9oiB+wutGmW62L7GHgrY8rV4P62aE108ESHWUql8leAkr7XpHEQJFGZuNW5RC4
	72pwEmeapu3xGVFIYMmn1KSHQGjnCXoCGTp+nlg==
X-Gm-Gg: ASbGnctyuz/uCTeIcXuHWrpluHWQ3YNDYKG6Om1bEnpO7pZwFsadB1xmffCpTcfVFXg
	K/BgR+PLiF3CIxMWifqvbTKH/y8vxU1ommTYQheParJASLYOY+d3Ry5AGAbSydbpbddii6A3x3P
	yDPh86cDlmZGTNbSoDnNZfXL0ILkJ0H3j3bbXBcA==
X-Google-Smtp-Source: AGHT+IFDn780/w8soVGkUXtHpzGjhzs8+k9JV2usxFG+k5/j8YX6aH0YTVHnszJEk/w/4d+aG7PWG2yBwM6p4Q/Ab2o=
X-Received: by 2002:a2e:9658:0:b0:308:ef73:523a with SMTP id
 38308e7fff4ca-30a599a2775mr39360531fa.36.1740344100418; Sun, 23 Feb 2025
 12:55:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9ded85ef-46f1-4682-aabd-531401b511e5@molgen.mpg.de>
 <CAMRc=McJpGMgaUDM2fHZUD7YMi2PBMcWhDWN8dU0MAr911BvXw@mail.gmail.com> <36cace3b-7419-409d-95a9-e7c45d335bef@molgen.mpg.de>
In-Reply-To: <36cace3b-7419-409d-95a9-e7c45d335bef@molgen.mpg.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 23 Feb 2025 21:54:49 +0100
X-Gm-Features: AWEUYZnDGB9vf_rZcGPk3HcPzJBryjbD6Lns6ejuWLna6xFV2KkIANI-1IW21co
Message-ID: <CAMRc=Mf-ObnFzau9OO1RvsdJ-pj4Tq2BSjVvCXkHgkK2t5DECQ@mail.gmail.com>
Subject: Re: Linux logs new warning `gpio gpiochip0: gpiochip_add_data_with_key:
 get_direction failed: -22`
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 10:02=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de=
> wrote:
>
> > What GPIO driver is it using? It's likely that it's not using the
> > provider API correctly and this change uncovered it, I'd like to take
> > a look at it and fix it.
>
> How do I find out? The commands below do not return anything.
>
>      $ lsmod | grep gpio
>      $ lspci -nn | grep -i gpio
>      $ sudo dmesg | grep gpio
>      [    5.150955] gpio gpiochip0: gpiochip_add_data_with_key:
> get_direction failed: -22
>      [Just these lines match.]
>
>
> Kind regards,
>
> Paul

If you have libgpiod-tools installed, you can post the output of
gpiodetect here.

Bart
